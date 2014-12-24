package beta.components {
	import Box2D.Dynamics.b2Body;
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class Bullet extends ThornedObject
	{		
		public static var NAME = "bullet";
		
		public function Bullet(world) {
			
			//hasFixture = false;
			boxModelRadius = 0.1;
			
			//setBoxModelBody(body);
			super(world);
			
					
			
			//var bodyDef:b2BodyDef = new b2BodyDef();
			//bodyDef.type = b2Body.b2_dynamicBody;
//
			//var body:b2Body = world.CreateBody(bodyDef);
//
			//var circleShape:b2CircleShape = new b2CircleShape(0.2);
			//var fixtureDef:b2FixtureDef = new b2FixtureDef();
			//fixtureDef.shape = circleShape;
//
			//var fixture:b2Fixture = body.CreateFixture(fixtureDef);
			//setBoxModelBody(body);
			
			
			
			mass = 10;		
			damage = 10;
			
			expireOnDamageDeal = true;
			killOffScreen = true;
			
			doesExplode = true;
			explosionParticleCount = 2;
			activate();
			
			name = NAME;
		}
		
		override protected function kill() {
			
			super.kill();
		}
		
	}
	
	
}


