package beta.units {
	
	import beta.components.Gunship;
	
	public class Enemy extends Gunship
	{
		public static var NAME = "enemy";
		public function Enemy() {
			
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
			explosionParticleCount = 4;
			
			name = NAME;
			
		}
	}
}


