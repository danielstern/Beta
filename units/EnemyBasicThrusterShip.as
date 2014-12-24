package beta.units {

	public class EnemyBasicThrusterShip extends EnemyShip
	{
		protected var enemyAIThrustLeft = true;
		public function EnemyBasicThrusterShip() {
			super();
		}
		
		override protected function tick() {
			
			if (enemyAIThrustLeft) {
				thrustingLeft = true;
			}
			super.tick();
		}
	}
}


