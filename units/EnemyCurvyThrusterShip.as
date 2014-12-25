package beta.units {
	
	public class EnemyCurvyThrusterShip extends EnemyBasicThrusterShip
	{
		protected var enemyAICurves:Boolean = true;
		public function EnemyCurvyThrusterShip(world) {
			super(world);
		}
		
		override protected function tick() {
			super.tick();
			
			var direction = Math.sin(cycle / 200);
			
			if (enemyAICurves) {
							
				if (direction <= 0) {
					enemyAIThrustUp = true;	
					enemyAIThrustDown = false;
				} else {
					enemyAIThrustDown = true;	
					enemyAIThrustUp = false;	
				}
			}
		}
	}
}


