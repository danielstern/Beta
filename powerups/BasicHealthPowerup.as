package beta.powerups {
	import beta.upgrades.BasicHealthRestoreUpgrade;
	import beta.upgrades.Upgrade;
	import beta.powerups.Powerup;
	
	public class BasicHealthPowerup extends Powerup
	{
		public function BasicHealthPowerup(world) {
			super(world);
		}
		
		override protected function getUpgrade():Upgrade {
			return new BasicHealthRestoreUpgrade();
		}
	}
}


