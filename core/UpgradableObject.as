package beta.core {
	import beta.upgrades.Upgrade;
	
	public class UpgradableObject extends ThornedObject
	{
		public static var UPGRADED = 'upgrade';
		public var upgradable = false; 
		
		protected var upgradeGunCountLevel:Number = 0;
		protected var upgrades = [];
		
		public function UpgradableObject(world) {
			super(world);
		}
		
		public function upgrade(scheme:Upgrade) {
			if (upgradable) {			
				upgrades.push(scheme);
				if (scheme.health) {
					restoreHealth(health);
				}
				
				if (scheme.gunCount) {
					upgradeGunCountLevel += scheme.gunCount;
				}
				
				meta(UPGRADED);
			}
		}
	}
}


