package beta.powerups {
	import beta.upgrades.BasicGunCountUpgrade;
	import beta.upgrades.Upgrade;
	import beta.powerups.Powerup;
	
	public class BasicGunCountPowerup extends Powerup
	{
		public function BasicGunCountPowerup() {
			super();
		}
		
		override protected function getUpgrade():Upgrade {
			return new BasicGunCountUpgrade();
		}
	}
}


