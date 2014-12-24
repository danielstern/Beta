package beta.units {
	
	public class EnemyShip extends EnemyStaticUnit
	{
		public function EnemyShip() {
			
			super();
			health = 25;
			
			constrainToScreen = false;			
			stabilizersEnabled = false;
			
			xThrusterPower = 20;
			yThrusterPower = 20;
			stablizerPowerX = 0;
			stablizerPowerY = 10;
			maxInertiaX = 10;
			maxInertiaY = 10;
			mass = 3;			
			
		}
	}
}


