package beta.units {

	public class EnemyBasicThrusterShip extends Enemy
	{
		protected var enemyAIThrustLeft:Boolean = true;
		protected var enemyAIThrustDown:Boolean = false;
		protected var enemyAIThrustUp:Boolean = false;
		protected var enemyAIThrustRight:Boolean = false;
		public function EnemyBasicThrusterShip(world) {
			super(world);
		}
		
		override protected function tick() {
			if (enemyAIThrustRight) {
				thrustingRight = true;
			} else {
				thrustingRight = false;
			}
			
			if (enemyAIThrustLeft) {
				thrustingLeft = true;
			} else {
				thrustingLeft = false;
			}
			

			if (enemyAIThrustUp) {
				thrustingUp = true;
			} else {
				thrustingUp = false;
			}
			
			if (enemyAIThrustDown) {
				thrustingDown = true;
			} else {
				thrustingDown = false;			
			}
			super.tick();
		}
	}
}


