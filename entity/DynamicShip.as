package beta.entity 
{
	import beta.core.ControllableObject;
	import beta.physics.BoxHelpers;
	import Box2D.Dynamics.b2Body;
	import Box2D.Common.Math.b2Vec2;
	
	public class DynamicShip extends Ship 
	{
		
		public function DynamicShip(body) 
		{
			super(body);
		}
		
		override protected function tick() {
			super.tick();
			
			
			
			
			if (controlsUp) {
				var vec:b2Vec2 = BoxHelpers.getPointAtAngleDistance(_body.GetAngle(), 0.05);
				_body.ApplyForce(vec, _body.GetPosition());
			}
		
			if (controlsLeft) {
				_body.SetAngle(_body.GetAngle() - 0.01);
			} 
			
			if (controlsRight) {
				_body.SetAngle(_body.GetAngle() + 0.01);
			} 
			
		}
		
	}

}