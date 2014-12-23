package beta.units {
	
	import beta.core.ThornedObject;
	import beta.upgrades.BasicHealthRestoreUpgrade;
	
	public class Powerup extends ThornedObject
	{
		public static var NAME = "powerup";
		public function Powerup() {
			
			super();
			
			collisionType = 'enemy';
			collidesWith = 'friend';
			
			stabilizersEnabled = false;
			
			health = 100;
			damage = 0;
			mass = 40;
			
			applyForceX(-1000);
			killOffScreen = true;
			
			enableCollisions();
			
			doesExplode = true;
			explosionParticleCount = 4;
			
			name = NAME;	
		}
		
		override protected function tick() {
			if (collisions[0] && collisions[0].upgradable) {
				doesExplode = false;
				var hero = collisions[0];
				var upgrade = new BasicHealthRestoreUpgrade();
				upgrade.health = 25;
				hero.upgrade(upgrade);
				kill();
			}
			super.tick();
		}
	}
}


