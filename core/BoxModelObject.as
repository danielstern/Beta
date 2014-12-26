package beta.core {
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
	import Box2D.Dynamics.*;

	public class BoxModelObject  extends TimekeepingObject
	{	
		public var boxModelBody:b2Body;
		public var world:b2World;
		public var orientation = 0;


		public function BoxModelObject(_world) {
			world = _world;
					
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;
			var body:b2Body = world.CreateBody(bodyDef);

			boxModelBody = body;
			body.SetUserData( { entity:this } );
			
			super();	
		}
		
		public function addBoxModelCircleFixture(radius, offset = null) {
			var circleShape:b2CircleShape = new b2CircleShape(radius);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.shape = circleShape;
			
			if (offset) {
				circleShape.SetLocalPosition(offset);
			}
			
			
			
			fixtureDef.filter.categoryBits = 0;

			var fixture:b2Fixture = boxModelBody.CreateFixture(fixtureDef);			

			
			//fixture.SetSensor(true);
			
			
			return fixture;
		}
		
		public function addBoxModelSquareFixture(sideLength:Number, offset = null) {
			var polygon:b2PolygonShape = new b2PolygonShape();
			polygon.SetAsBox(sideLength, sideLength);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.shape = polygon;
			var fixture:b2Fixture = boxModelBody.CreateFixture(fixtureDef);
			fixture.SetSensor(true);
			
			return fixture;
		}
		
		override protected function kill() {
			while (boxModelBody.GetFixtureList()) {
				boxModelBody.DestroyFixture(boxModelBody.GetFixtureList());
			}
			
			world.DestroyBody(boxModelBody);
			
			super.kill();
		}
		
		public function getBoxModelPosition() {
			return boxModelBody.GetPosition();
		}
		
		public function setBoxModelPosition(pos) {
			boxModelBody.SetPosition(pos);	
		}
		
	
		override protected function tick() {
			super.tick();
		}
	}
}


