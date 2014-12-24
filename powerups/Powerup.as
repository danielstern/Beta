package beta.powerups {
	
	import beta.core.ThornedObject;
	import beta.units.Hero;
	import beta.upgrades.BasicHealthRestoreUpgrade;
	import beta.upgrades.Upgrade;
	
	public class Powerup extends ThornedObject
	{
		public static var NAME = "powerup";
		public static var FULFILL = 'fulfill';
		public function Powerup(world) {
			
			super(world);
			
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
		
		protected function getUpgrade():Upgrade {
			return new Upgrade();
		}
		
		override protected function tick() {
			var hero:Hero;
			var upgrade:Upgrade;
			
			if (collisions[0] && collisions[0].upgradable) {
				upgrade = getUpgrade();
				hero = collisions[0];
			
				doesExplode = false;
				
				hero.upgrade(upgrade);
				kill();
				meta(FULFILL);
			}
			super.tick();
		}
	}
}


