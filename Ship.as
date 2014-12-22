package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class Ship extends ControllableObject
	{
		protected var guns = [new Gun(),new Gun()];
		public function Ship() {
			super();
			mass = 1.2;
			xThrusterPower = 0.7;
			yThrusterPower = 0.7;
			stablizerPowerX = 5;
			stablizerPowerY = 5;
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
			
			if (controlsAction1) {
				guns.forEach(function(gun) {
					gun.startFiring();
				});
			} else {
				guns.forEach(function(gun) {
					gun.stopFiring();
				});
			}
			
		}
	}
}


