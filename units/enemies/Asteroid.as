package beta.units.enemies {
	
	public class Asteroid extends Enemy
	{
		public static var NAME = "asteroid";
		public function Asteroid(world) {
			super(world);
			
			health = 10;
			damage = 4;

			applyForceX(-0.01);

			doesExplode = true;
			explosionParticleCount = 6;
			
			name = NAME;
		}
	}
}


