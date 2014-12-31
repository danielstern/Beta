package beta.entity 
{
	import beta.core.ControllableObject;
	import beta.game.LanderUpgrader;
	import beta.physics.BoxHelpers;
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	
	public class MoonLander extends Ship 
	{
		
		protected var upThruster:Thruster;
		protected var leftThruster:Thruster;
		protected var rightThruster:Thruster;
		private var _fuel = 0;
		
		protected var defaultAngle = 0;	
		protected var autoStabilizerStrength = 2.5;
		
		protected var thrusterTimeToIncreaseIntensity:Number = 1000;
		protected var upThrusterForcePerIntensity:Number = 0.8;
		protected var sideThrusterForcePerIntensity:Number = 0.4;
		protected var thrusterMaxIntensity:Number = 5;
		
	
		
		public function MoonLander(body, fuel, timeToIncreaseIntensityModifier:Number = 1, thrusterForceModifier:Number = 1) 
		
		{
			super(body);
			
			upThruster = new Thruster(upThrusterForcePerIntensity * thrusterForceModifier, 5, thrusterTimeToIncreaseIntensity * timeToIncreaseIntensityModifier);
			leftThruster = new Thruster(sideThrusterForcePerIntensity * thrusterForceModifier, 5, thrusterTimeToIncreaseIntensity * timeToIncreaseIntensityModifier);
			rightThruster = new Thruster(sideThrusterForcePerIntensity * thrusterForceModifier, 5, thrusterTimeToIncreaseIntensity * timeToIncreaseIntensityModifier);
			_fuel = fuel;
			

		}
		
		override protected function tick() {
			
			super.tick();
			//trace("moonlander tick.",_fuel);
			
			
			
			var bottomThrusterPosition:b2Vec2 = new b2Vec2(0, 2.5);
			var leftThrusterPosition:b2Vec2 = new b2Vec2( -3.5, -0.5);
			var rightThrusterPosition:b2Vec2 = new b2Vec2( 3.5, -0.5);
			bottomThrusterPosition.Add(_body.GetPosition());
			leftThrusterPosition.Add(_body.GetPosition());
			rightThrusterPosition.Add(_body.GetPosition());
					
			var zero = 0;
			
			if (_fuel > 0) {
				
				
				if (controlsUp) {
					upThruster.engage();
					_body.ApplyForce(new b2Vec2(zero, -upThruster.getForce()), bottomThrusterPosition);
					_fuel -= upThruster.getIntensity();
				} else {
					upThruster.disengage();
				}
			
				if (controlsLeft) {
					leftThruster.engage();
					_body.ApplyForce(new b2Vec2( -leftThruster.getForce(), zero), leftThrusterPosition);
					_fuel -= leftThruster.getIntensity();
				} else {
					leftThruster.disengage();
				}
				
				if (controlsRight) {
					//trace("engage thrust right.");
					rightThruster.engage();
					_body.ApplyForce(new b2Vec2(rightThruster.getForce(), zero), rightThrusterPosition);
					_fuel -= rightThruster.getIntensity();
				} else {
					rightThruster.disengage();
				}			
				
				var currentAngle = _body.GetAngle();
				_body.SetAngle(defaultAngle);
			} else {
				trace("Out of fuel.");
				_fuel = 0;
			}
			
			
			
			upThruster.step();
			leftThruster.step();
			rightThruster.step();
			
		}
		
		public function addFuel(fuel) {
			_fuel += fuel;
		}
		
		public function getFuel() {
			return _fuel;
		}

		
	}

}