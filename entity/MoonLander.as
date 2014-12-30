package beta.entity 
{
	import beta.core.ControllableObject;
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
		
	
		
		public function MoonLander(body, fuel = 500) 
		{
			super(body);

			upThruster = new Thruster(1, 10, 1000);
			leftThruster = new Thruster(0.2, 5, 100);
			rightThruster = new Thruster(0.2, 5, 100);
			_fuel = fuel;
			

		}
		
		override protected function tick() {
			
			super.tick();
			//if (health === 0) return;
			
			
			
			var bottomThrusterPosition:b2Vec2 = new b2Vec2(0, 2.5);
			var leftThrusterPosition:b2Vec2 = new b2Vec2( -3.5, -0.5);
			var rightThrusterPosition:b2Vec2 = new b2Vec2( 3.5, -0.5);
			bottomThrusterPosition.Add(_body.GetPosition());
			leftThrusterPosition.Add(_body.GetPosition());
			rightThrusterPosition.Add(_body.GetPosition());
					
			var zero = 0;
			
			if (_fuel > 0 && !destroyed) {
				
				
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
					rightThruster.engage();
					_body.ApplyForce(new b2Vec2(rightThruster.getForce(), zero), rightThrusterPosition);
					_fuel -= rightThruster.getIntensity();
				} else {
					rightThruster.disengage();
				}			
			} else {
				_fuel = 0;
			}
			
			var currentAngle = _body.GetAngle();
			//if (currentAngle > defaultAngle) {
				//_body.ApplyTorque( -autoStabilizerStrength);
			//} else {
				//_body.ApplyTorque( autoStabilizerStrength);
			//}
			_body.SetAngle(defaultAngle);
			
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