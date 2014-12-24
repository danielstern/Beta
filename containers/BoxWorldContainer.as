package beta.containers 
{
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2World;
	import flash.utils.setInterval;
		import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	public class BoxWorldContainer extends MetaDisplayingContainer 
	{
		protected var world:b2World;
	
		public function BoxWorldContainer() 
		{
			super();
			
			world = new b2World(new b2Vec2(0, 0), true); 
			var debug:b2DebugDraw = new b2DebugDraw();
			debug.SetSprite(this);
			debug.SetDrawScale(1);
			debug.SetAlpha(1);
			debug.SetFillAlpha(1);
			debug.SetLineThickness(1);
			debug.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit | b2DebugDraw.e_aabbBit | b2DebugDraw.e_pairBit | b2DebugDraw.e_centerOfMassBit);

			world.SetDebugDraw(debug);
			setInterval(function(world) {
				world.Step(5, 5, 5);
				world.DrawDebugData();
				//trace("World update.");			
			
			}, 25,world);
			
		}
		
		public function getBody() {
			return world.CreateBody(new b2BodyDef());
		}
		

			
	}

}