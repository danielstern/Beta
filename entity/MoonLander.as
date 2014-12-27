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
		
		public function MoonLander(body) 
		{
			super(body);
		}
		
		override protected function tick() {
			super.tick();		
			
			
			if (controlsUp) {
				_body.ApplyForce(new b2Vec2(0,-upThrusterForce), _body.GetPosition());
			}
		
			if (controlsLeft) {
				_body.ApplyForce(new b2Vec2(-leftThrusterForce,0), _body.GetPosition());
			} 
			
			if (controlsRight) {
				_body.ApplyForce(new b2Vec2(rightThrusterForce,0), _body.GetPosition());
			} 
			
			_body.SetAngle( -Math.PI / 2);
			
		}
		
	}

}