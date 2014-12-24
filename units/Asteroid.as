package beta.units {
	
	public class Asteroid extends Enemy
	{
		public static var NAME = "asteroid";
		public function Asteroid() {
			super(world);
			
			health = 10;
			damage = 4;
			mass = 40;
			
			applyForceX(-1000);

			doesExplode = true;
			explosionParticleCount = 6;
			
			name = NAME;
		}
	}
}


