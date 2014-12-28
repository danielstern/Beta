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
		
		protected var defaultAngle = 0;	
		protected var autoStabilizerStrength = 2.5;
		
	
		
		public function MoonLander(body) 
		{
			super(body);

			upThruster = new Thruster(1, 10, 1000);
			leftThruster = new Thruster(0.2, 5, 100);
			rightThruster = new Thruster(0.2, 5, 100);
			

		}
		
		override protected function tick() {
			super.tick();
			
			
			
			var bottomThrusterPosition:b2Vec2 = new b2Vec2(0, 2.5);
			var leftThrusterPosition:b2Vec2 = new b2Vec2( -3.5, -0.5);
			var rightThrusterPosition:b2Vec2 = new b2Vec2( 3.5, -0.5);
			bottomThrusterPosition.Add(_body.GetPosition());
			leftThrusterPosition.Add(_body.GetPosition());
			rightThrusterPosition.Add(_body.GetPosition());
			
			var zero = 0;
			
			
			if (controlsUp) {
				upThruster.engage();
				_body.ApplyForce(new b2Vec2(zero,-upThruster.getForce()), bottomThrusterPosition);
			} else {
				upThruster.disengage();
			}
		
			if (controlsLeft) {
				leftThruster.engage();
				_body.ApplyForce(new b2Vec2(-leftThruster.getForce(),zero), leftThrusterPosition);
			} else {
				leftThruster.disengage();
			}
			
			if (controlsRight) {
				rightThruster.engage();
				_body.ApplyForce(new b2Vec2(rightThruster.getForce(),zero), rightThrusterPosition);
			} else {
				rightThruster.disengage();
			}			
			
			var currentAngle = _body.GetAngle();
			//if (currentAngle > defaultAngle) {
				//_body.ApplyTorque( -autoStabilizerStrength);
			//} else {
				//_body.ApplyTorque( autoStabilizerStrength);
			//}
			_body.SetAngle(defaultAngle);
			
		}

		
	}

}