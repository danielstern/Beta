package beta.entity 
{
	import beta.core.ControllableObject;
	import beta.physics.BoxHelpers;
	import Box2D.Dynamics.b2Body;
	import Box2D.Common.Math.b2Vec2;
	
	public class MoonLander extends Ship 
	{
		protected var upThrusterForcePerIntensity = 5;
		protected var leftThrusterForcePerIntensity = 0.2;
		protected var rightThrusterForcePerIntensity = 0.2;
		
		protected var upThrusterIntensity = 0;
		protected var leftThrusterIntensity = 0;
		protected var rightThrusterIntensity = 0;
		
		protected var upThrustStartCycle:Number = -1;
		protected var leftThrustStartCycle:Number = -1;
		protected var rightThrustStartCycle:Number = -1;
		
		protected var maxIntensityMultiple = 5;
		protected var timeToIncreaseIntensity = 15;
		
		protected var defaultAngle = Math.PI / 2;
		
		protected var autoStabilizerStrength = 0.1;
		
	
		
		public function MoonLander(body) 
		{
			super(body);
			_body.SetAngle(defaultAngle);
		}
		
		override protected function tick() {
			super.tick();		
			
			var bottomThrusterPosition:b2Vec2 = new b2Vec2(0, 2.5);
			var leftThrusterPosition:b2Vec2 = new b2Vec2( 3.5, -0.5);
			var rightThrusterPosition:b2Vec2 = new b2Vec2( -3.5, -0.5);
			var zero = 0;
			bottomThrusterPosition.Add(_body.GetPosition());
			leftThrusterPosition.Add(_body.GetPosition());
			rightThrusterPosition.Add(_body.GetPosition());
			
			
			if (controlsUp) {
				if (upThrustStartCycle === -1) {
					upThrustStartCycle = cycle;
				}
				var timeSinceStartedThrustingUp = cycle - upThrustStartCycle;
				
				if (timeSinceStartedThrustingUp % timeToIncreaseIntensity === 0) {
					if (upThrusterIntensity < maxIntensityMultiple)	{
						upThrusterIntensity += 1;
					}
				}
				var totalUpForce:Number = upThrusterForcePerIntensity * upThrusterIntensity;
				trace("total up force?", totalUpForce);
				_body.ApplyForce(new b2Vec2(zero,-totalUpForce), bottomThrusterPosition);
			} else {
				upThrusterIntensity = 0;
				upThrustStartCycle = -1;
			}
		
			if (controlsLeft) {
				_body.ApplyForce(new b2Vec2(-leftThrusterForcePerIntensity * leftThrusterIntensity,zero), leftThrusterPosition);
			} 
			
			if (controlsRight) {
				_body.ApplyForce(new b2Vec2(rightThrusterForcePerIntensity * rightThrusterIntensity,zero), rightThrusterPosition);
			} 
			
			
			
			
			var currentAngle = _body.GetAngle();
			if (currentAngle > defaultAngle) {
				_body.ApplyTorque( -autoStabilizerStrength);
			} else {
				_body.ApplyTorque( autoStabilizerStrength);
			}
			
		}
		
	}

}