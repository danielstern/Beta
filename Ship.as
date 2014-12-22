package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class Ship extends ControllableObject
	{
		public function Ship() {
			super();
			mass = 1.2;
			xThrusterPower = 0.7;
			yThrusterPower = 0.7;
			stablizerPowerX = 10;
			stablizerPowerY = 10;
			
			minY = 10;
			minX = 10;
			maxX = 590;
			maxY = 490;
		}
		
		override protected function tick() {
			super.tick();
			if (controlsGoingRight) {
				thrustingRight = true;
			} else {
				thrustingRight = false;
			}
			
			if (controlsGoingLeft) {
				thrustingLeft = true;
			} else {
				thrustingLeft = false;
			}
			

			if (controlsGoingUp) {
				thrustingUp = true;
			} else {
				thrustingUp = false;
			}
			
			if (controlsGoingDown) {
				thrustingDown = true;
			} else {
				thrustingDown = false;			
			}			
		}
	}
}


