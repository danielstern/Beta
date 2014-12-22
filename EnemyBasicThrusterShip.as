package beta
{
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class EnemyBasicThrusterShip extends EnemyShip
	{
		protected var thrustLeft = true;
		public function EnemyBasicThrusterShip() {
			super();
			
			xThrusterPower = 0.05;
			yThrusterPower = 0.03;
			maxVelocityX = 0.3;
			maxVelocityY = 1;
			mass = 0.7;
			stabilizersEnabled = true;
			stablizerPowerY = 0.2;
		}
		
		override protected function tick() {
			super.tick();
			if (thrustLeft) {
				thrustingLeft = true;
			}
		}
	}
}


