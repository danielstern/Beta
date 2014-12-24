package beta.components {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class Bullet extends UpgradableObject
	{		
		public static var NAME = "bullet";
		
		public function Bullet() {
			
			super();
			
			enableCollisions();
			
			mass = 10;		
			damage = 10;
			
			expireOnDamageDeal = true;

			killOffScreen = true;
			
			maxVelocityX = 1000;
			maxInertiaX = 1000;
			
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


