package beta
{
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class EnemyCurvyThrusterShip extends EnemyBasicThrusterShip
	{
		public function EnemyCurvyThrusterShip() {
			super();

			thrustLeft = true;
			
		}
		
		override protected function tick() {
			super.tick();
			
			var direction = Math.sin(cycle / 20);
			
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


