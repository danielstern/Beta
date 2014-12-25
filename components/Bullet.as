package beta.components {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import beta.core.*;
	
	public class Bullet extends ThornedObject
	{		
		public static var NAME = "bullet";
		
		public function Bullet(world) {
			
			super(world);
			
			addBoxModelCircleFixture(0.15, new b2Vec2(0, 0));
	
			damage = 10;
			
			//boxModelBody.GetFixtureList().SetDensity(1);
			
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


