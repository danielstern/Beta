package beta.units {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	import beta.components.Gunship;
	
	public class BasicHeroShip extends Hero
	{
		protected var gunCountLevel = 1;
		var gun1;
		var gun2;
		var gun3;
		var gun4;
		var gun5;
		var gun6;
		var gun7;
		
		public function BasicHeroShip(world) {
			super(world);
			
			health = 25;
			damage = 0;

			gun1 = addGun();
			gun2 = addGun();
			gun3 = addGun();
			gun4 = addGun();
			gun5 = addGun();
			gun6 = addGun();
			gun7 = addGun();
			
			gun2.y = -6;
			gun2.orientation = 0;
			
			gun3.orientation = 0;
			gun5.y = 6;
			
			gun4.y = -9;
			gun4.orientation = 20;
			
			gun5.orientation = -20;
			gun5.y = 9;
			
			gun6.y = -12;
			gun6.orientation = -45;
			
			gun7.y = 12;
			gun7.orientation = 45;
			
			
			
			
			
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
		
		override protected function gunsStartFiring() {
			switch (gunCountLevel + upgradeGunCountLevel) {
				case 1:
					gun1.startFiring();
					break;
				case 2:
					gun2.startFiring();
					gun3.startFiring();
					break;
				case 3:
					gun1.startFiring();
					gun4.startFiring();
					gun5.startFiring();
					break;
				case 4:
					gun2.startFiring();
					gun3.startFiring();
					gun4.startFiring();
					gun5.startFiring();
					break;
				case 5:
					gun1.startFiring();
					gun4.startFiring();
					gun5.startFiring();
					gun6.startFiring();
					gun7.startFiring();
					break;
				default:
					super.gunsStartFiring();
					break;
			}
		}
	}
}


