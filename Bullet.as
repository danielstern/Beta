package beta
{
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class Bullet extends ThornedObject
	{		
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
		}
		
		override protected function kill() {
			
			super.kill();
		}
		
	}
	
	
}


