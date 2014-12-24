package beta.units {
	
	import beta.components.Gunship;
	
	public class Enemy extends Gunship
	{
		public static var NAME = "enemy";
		public function Enemy() {
			
			super();
			
			collisionType = 'enemy';
			collidesWith = 'friend';
			
			health = 10;
			damage = 4;
			mass = 40;
			
			
			
			killOffScreen = true;
			
			//enableCollisions();
			stabilizersEnabled = false;
			
			doesExplode = true;
			explosionParticleCount = 4;
			
			name = NAME;
			
		}
		
		override protected function getGun() {
			return new EnemyGun();
		}
	}
}


