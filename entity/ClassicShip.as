package beta.entity 
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	public class ClassicShip extends Ship 
	{
		
		public function ClassicShip(body:b2Body) 
		{
			super(body);
			
		}
		
		override protected function tick() {
			super.tick();
			
			var vec:b2Vec2 = new b2Vec2(0, 0);
			
			if (controlsRight) {
				vec.x = thrustForce;
			}
			else if (controlsLeft) {
				vec.x = -thrustForce;
			} 
			
			if (controlsUp) {
				vec.y = -thrustForce;
			}
			else if (controlsDown) {
				vec.y = thrustForce;
			} 
			
			_body.SetLinearVelocity(vec);
			_body.SetAngle(0);
		}
		
	}

}