package beta.units {

	public class EnemyBasicThrusterShip extends EnemyShip
	{
		protected var enemyAIThrustLeft = true;
		public function EnemyBasicThrusterShip() {
			super();
			
			xThrusterPower = 0.05;
			yThrusterPower = 0.03;
			maxVelocityX = 1.2;
			maxVelocityY = 1;
			mass = 0.7;
			stabilizersEnabled = false;
			stablizerPowerY = 0.2;
		}
		
		override protected function tick() {
			super.tick();
			if (enemyAIThrustLeft) {
				thrustingLeft = true;
			}
		}
	}
}


