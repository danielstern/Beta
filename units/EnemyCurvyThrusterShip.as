package beta.units {
	
	public class EnemyCurvyThrusterShip extends EnemyBasicThrusterShip
	{
		protected var enemyAICurves:Boolean = true;
		public function EnemyCurvyThrusterShip() {
			super();
		}
		
		override protected function tick() {
			super.tick();
			
			var direction = Math.sin(cycle / 20);
			
			if (enemyAICurves) {
							
				if (direction <= 0) {
					thrustingUp = true;	
					thrustingDown = false;
				} else {
					thrustingDown = true;	
					thrustingUp = false;	
				}
			}
		}
	}
}


