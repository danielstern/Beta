package beta.components {
	import Box2D.Dynamics.b2Body;
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class Bullet extends ThornedObject
	{		
		public static var NAME = "bullet";
		
		public function Bullet(gun:Gun) {
			
			//setBoxModelBody(body);
			super(gun.world);
			
			
			
			enableCollisions();
			
			mass = 10;		
			damage = 10;
			
			expireOnDamageDeal = true;

			killOffScreen = true;
			
			//maxVelocityX = 1000;
			//maxInertiaX = 1000;
			
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


