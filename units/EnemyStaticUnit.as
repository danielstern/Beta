package beta.units {
	
	import beta.components.Gunship;
	
	public class EnemyStaticUnit extends Enemy
	{
		public static var NAME = "enemy";
		public function EnemyStaticUnit() {
			
			super();
		
			health = 10;
			damage = 4;
			mass = 5;			
			
			killOffScreen = true;
			stabilizersEnabled = false;
			
			doesExplode = true;
			explosionParticleCount = 4;
			
			name = NAME;
			
		}
	}
}


