package beta.entity {
	import beta.core.ControllableObject;
	import Box2D.Collision.b2Bound;
	import Box2D.Dynamics.b2Body;
	import Box2D.Common.Math.b2Vec2;
	/**
	 * ...
	 * @author daniel
	 */
	public class Ship extends ControllableObject 
	{
		private var _body:b2Body;
		private var thrustForce:Number = 0.5;
		
		public function Ship(body:b2Body) 
		{
			_body = body;
			super();
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
		}
			
	}

}