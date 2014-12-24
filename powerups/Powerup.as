package beta.powerups {
	
	import beta.core.ThornedObject;
	import beta.upgrades.BasicHealthRestoreUpgrade;
	
	public class Powerup extends ThornedObject
	{
		public static var NAME = "powerup";
		public static var FULFILL = 'fulfill';
		public function Powerup() {
			
			super();
			
			collisionType = 'enemy';
			collidesWith = 'friend';
			
			stabilizersEnabled = false;
			
			health = 25;
			damage = 0;
			mass = 40;
			
			applyForceX(-1000);
			killOffScreen = true;
			
			enableCollisions();
			
			doesExplode = true;
			explosionParticleCount = 4;
			metaShowsDamage = false;
			thorned = false;
			
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
				meta(FULFILL);
			}
			super.tick();
		}
	}
}


