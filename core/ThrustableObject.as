package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class ThrustableObject extends StabilizingObject
	{
		protected var thrustingRight:Boolean = false;
		protected var thrustingLeft:Boolean = false;
		protected var thrustingUp:Boolean = false;
		protected var thrustingDown:Boolean = false;
		protected var xThrusterPower = 0.2;
		protected var yThrusterPower = 0.2;
		
		override protected function tick() {
			super.tick();
			
			if (thrustingRight) {
				applyForceX(xThrusterPower);
				stabilizersEnabledRight = false;
			} else {
				stabilizersEnabledRight = true;
			}
			
			if (thrustingLeft) {
				applyForceX( -xThrusterPower);
				stabilizersEnabledLeft = false;
			} else {
				stabilizersEnabledLeft = true;
			}
			

			if (thrustingUp) {
				applyForceY( -yThrusterPower);
				stabilizersEnabledUp = false;
			} else {
				stabilizersEnabledUp = true;				
			}
			
			if (thrustingDown) {
				applyForceY(yThrusterPower);
				stabilizersEnabledDown = false;
			} else {
				stabilizersEnabledDown = true;				
			}
		}
	}
}
