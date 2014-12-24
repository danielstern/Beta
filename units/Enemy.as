package beta.units {
	
	import beta.components.Gunship;
	
	public class Enemy extends Gunship
	{
		public static var NAME = "enemy";
		public function Enemy(world) {
			
			super(world);
			
			collisionType = 'enemy';
			collidesWith = 'friend';
			
			health = 10;
			damage = 4;

			killOffScreen = true;
						
			doesExplode = true;
			explosionParticleCount = 4;
			
			name = NAME;
			
		}
		
		override protected function getGun() {
			return new EnemyGun(this);
		}
	}
}


