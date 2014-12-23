package beta
{
	import flash.display.*;
	import beta.core.*;
	
	public class Asteroid extends EnemyStaticObject
	{
		public static var NAME = "astroid";
		public function Asteroid() {
			super();
			
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


