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
			
			maxVelocityX = 7;
			maxVelocityY = 7;
			mass = 0.2;		
			
			expireOnDamageDeal = true;
			killOffScreen = true;
			damage = 10;
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


