package beta.entity 
{
	import beta.core.ControllableObject;
	import beta.physics.BoxHelpers;
	import Box2D.Dynamics.b2Body;
	import Box2D.Common.Math.b2Vec2;
	
	public class MoonLander extends Ship 
	{
		protected var upThrusterForce = 1.5;
		protected var leftThrusterForce = 0.5;
		protected var rightThrusterForce = 0.5;
		
		protected var maxIntensityMultiple = 5;
		protected var timeToIncreaseJetStream = 100;
		
		protected var defaultAngle = Math.PI / 2;
		
		protected var autoStabilizerStrength = 0.1;
		
		public function MoonLander(body) 
		{
			super(body);
			_body.SetAngle(defaultAngle);
		}
		
		override protected function tick() {
			//super.tick();		
			
			var bottomThrusterPosition:b2Vec2 = new b2Vec2(0, 2.5);
			var leftThrusterPosition:b2Vec2 = new b2Vec2( -3.5, -0.5);
			var rightThrusterPosition:b2Vec2 = new b2Vec2(3.5, -0.5);
			bottomThrusterPosition.Add(_body.GetPosition());
			leftThrusterPosition.Add(_body.GetPosition());
			rightThrusterPosition.Add(_body.GetPosition());
			
			
			if (controlsUp) {
				_body.ApplyForce(new b2Vec2(0,-upThrusterForce), bottomThrusterPosition);
			}
		
			if (controlsLeft) {
				_body.ApplyForce(new b2Vec2(-leftThrusterForce,0), rightThrusterPosition);
			} 
			
			if (controlsRight) {
				_body.ApplyForce(new b2Vec2(rightThrusterForce,0), rightThrusterPosition);
			} 
			
			var currentAngle = _body.GetAngle();
			if (currentAngle > defaultAngle) {
				_body.ApplyTorque( -autoStabilizerStrength);
			} else {
				_body.ApplyTorque( autoStabilizerStrength);
			}
			
			//_body.SetAngle( -Math.PI / 2);
			
		}
		
	}

}