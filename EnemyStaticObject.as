package beta
{
	import flash.display.*;
	import beta.core.*;
	
	public class EnemyStaticObject extends Gunship
	{
		public static var NAME = "enemy";
		public function EnemyStaticObject() {
			super();
			
			collisionType = 'enemy';
			collidesWith = 'friend';
			
			stabilizersEnabled = false;
			
			health = 10;
			damage = 4;
			mass = 40;
			
			applyForceX(-1000);
			killOffScreen = true;
			
			enableCollisions();
			
			doesExplode = true;
			explosionParticleCount = 6;
			
			name = NAME;
			
		}
	}
}


