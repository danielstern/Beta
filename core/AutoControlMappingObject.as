package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class AutoControlMappingObject extends ControllableObject
	{
		public function AutoControlMappingObject() {
			
			super();
			
		}
		
		override protected function tick() {
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
			
			super.tick();
		}
	}
}


