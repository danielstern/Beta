package beta.core {
	import beta.upgrades.Upgrade;
	
	public class UpgradableObject extends ThornedObject
	{
		protected var upgradeGunCountLevel:Number = 0;
		
		protected var upgrades = [];
		public static var UPGRADED = 'upgrade';
		public var upgradable = false; 
		public function UpgradableObject() {
			super();
		}
		
		public function upgrade(scheme:Upgrade) {
			if (upgradable) {			
				trace("Power up!", scheme);
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


