package beta.core {
	import beta.containers.BoxWorldContainer;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2World;
	
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2World;
	
	//public class BoxModelObject
	public class BoxModelObject  extends TimekeepingObject
	{	
		private var hasBoxModel = true;
		public var boxModelBody:b2Body;
		public var world:b2World;
		public var defaultWorld:b2World = new b2World(new b2Vec2(0, 0), false); 
		
		public var x;
		public var y;
		public var mass;
		//public var killOffScreen;
		public var maxVelocityX;
		public var maxInertiaX;
		
		protected var stablizerPowerX = 1;
		protected var stablizerPowerY = 1;
		protected var stabilizersEnabledLeft = true;
		protected var stabilizersEnabledRight = true;
		protected var stabilizersEnabledUp = true;
		protected var stabilizersEnabledDown = true;
		
		protected var stabilizersEnabled = false;
		
		protected var boxModelRadius = 0.2;

		public function BoxModelObject(_world) {
			world = _world;
			
			//trace("Create box model object.");
			
			
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;

			var body:b2Body = world.CreateBody(bodyDef);
			
			//if (hasFixture) {					
					
				var circleShape:b2CircleShape = new b2CircleShape(boxModelRadius);
				var fixtureDef:b2FixtureDef = new b2FixtureDef();
				fixtureDef.shape = circleShape;

				var fixture:b2Fixture = body.CreateFixture(fixtureDef);
				fixture.SetSensor(true);
				setBoxModelBody(body);
			//}
			
			super();	
		}
		
		//public function get world() {
			//return world;
		//}
		
		override protected function kill() {
			super.kill();
		}
		
		//override protected function onAddedToStage(e) {
			//super.onAddedToStage(e);
			//var _container:* = parent;
			//boxContainer = _container;
			//
				//
			//var heroBodyDef:b2BodyDef = new b2BodyDef();
			//heroBodyDef.type = b2Body.b2_dynamicBody;
			//heroBodyDef.linearDamping = 0;
			//var heroBody:b2Body = boxContainer.getBody(heroBodyDef);
			//
			////heroBody.SetPosition(new b2Vec2(50, 150));
			////heroBody.SetPosition(new b2Vec2(0,0));
			////heroBody.SetLinearDamping(0);
			//var circleShape:b2CircleShape = new b2CircleShape(0.2);
			//var fixtureDef:b2FixtureDef = new b2FixtureDef();
			//fixtureDef.shape = circleShape;
			//fixtureDef.density = 0.7;
			//fixtureDef.friction = 0;
			////heroBody.SetType(2);
//
			//var heroBodyFixture:b2Fixture = heroBody.CreateFixture(fixtureDef);
			//setBoxModelBody(heroBody);
		//}
		
		override protected function tick() {
			super.tick();
		}
		
		public function setBoxModelBody(body:b2Body) {
			boxModelBody = body;			
		}
	}
}


