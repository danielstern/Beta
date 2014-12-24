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
			damage = 0;

			var gun1 = addGun();
			var gun2 = addGun();
			var gun3 = addGun();
			var gun4 = addGun();
			var gun5 = addGun();
			
			gun1.y = -6;
			gun1.orientation = 20;
			
			gun2.y = 6;
			gun2.orientation = -20;
			
			gun4.y = -12;
			gun4.orientation = -45;
			gun5.y = 12;
			gun5.orientation = 45;
			
			
			
			doesExplode = true;
			explosionParticleCount = 45;
			
			xThrusterPower = 10;
			yThrusterPower = 10;
			stablizerPowerX = 10;
			stablizerPowerY = 10;
			maxInertiaX = 5;
			maxInertiaY = 5;
			mass = 1;
			
			upgradable = true;
			controlledViaOverride = true;
			
		}
	}
}


