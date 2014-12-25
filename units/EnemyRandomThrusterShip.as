package beta.units {
	
	public class EnemyRandomThrusterShip extends EnemyBasicThrusterShip
	{
		protected var movesRandomly = true;
		protected var directionChangeFrequency = 200;
		
		protected static var MOVING_UP = 'movingUp';
		protected static var MOVING_DOWN = 'movingDown';
		protected static var MOVING_LEFT = 'movingLeft';
		
		private var randomDirection:String = MOVING_LEFT;
		
		public function EnemyRandomThrusterShip(world) {
			super(world);
		
		}
		
		override protected function tick() {
			super.tick();
			
			if (cycle % directionChangeFrequency === 0 && movesRandomly) {
				if (randomDirection === MOVING_UP || randomDirection === MOVING_DOWN) {
					randomDirection = MOVING_LEFT;
				} else {
					randomDirection = Math.random() > 0.5 ? MOVING_UP : MOVING_DOWN;
				}
				
				enemyAIThrustLeft = false;
				enemyAIThrustDown = false;
				enemyAIThrustUp = false;
				
				switch (randomDirection) {
					case MOVING_LEFT:
						enemyAIThrustLeft = true;
						break;
					case MOVING_UP:
						enemyAIThrustUp = true;
						break;
					case MOVING_DOWN:
						enemyAIThrustDown = true;
						break;
				}
			}
		}
	}
}


