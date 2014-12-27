package beta.entity {
	import beta.core.ControllableObject;
	import Box2D.Dynamics.b2Body;
	import Box2D.Common.Math.b2Vec2;

	public class Ship extends ControllableObject 
	{
		protected var _body:b2Body;
		protected var thrustForce:Number = 0.5;
		protected var gun:Gun;
		
		public static var HERO_BIT = 0x0001;
		public static var BULLET_BIT = 0x1000;
		
		public function Ship(body:b2Body) 
		{
			_body = body;
			super();
			gun = new Gun(_body,new b2Vec2(0,1));
		}
		
		override protected function tick() {
			super.tick();
			if (controlsAction1) {
				gun.fire();
			}
		}
		
		
			
	}

}