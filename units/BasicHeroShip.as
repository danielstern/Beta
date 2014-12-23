package beta.units {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	import beta.components.Gunship;
	
	public class BasicHeroShip extends Hero
	{
		public function BasicHeroShip() {
			super();
			
			health = 25;

			var gun1 = addGun();
			var gun2 = addGun();
			
			gun1.y = -3;
			gun2.y = 3;

			gun1.orientation = 0;
			gun2.orientation = 0;
			
			doesExplode = true;
			explosionParticleCount = 45;
			
		}
	}
}


