package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class StabilizingObject extends PropellableObject
	{
		protected var stablizerPowerX = 1;
		protected var stablizerPowerY = 1;
		protected var stabilizersEnabledLeft = true;
		protected var stabilizersEnabledRight = true;
		protected var stabilizersEnabledUp = true;
		protected var stabilizersEnabledDown = true;
		
		protected var stabilizersEnabled = false;
		
		public function StabilizingObject() {
			super();			
		}
		
		
		override protected function tick() {
			super.tick();
			
			if (stabilizersEnabled) {
						
				var xForceToApply = stablizerPowerX;
				if (Math.abs(xInertia) < stablizerPowerX) {
					xForceToApply = Math.abs(xInertia);		
				}
				
				if (xInertia > 0) {
					if (stabilizersEnabledRight) {
						applyForceX(-xForceToApply);
					}
					
				} else {
					if (stabilizersEnabledLeft) {
						applyForceX(xForceToApply);
					}
				}				

				
				var yForceToApply = stablizerPowerY;
				if (Math.abs(yInertia) < stablizerPowerY) {
					yForceToApply = Math.abs(yInertia);		
				}
				
				if (yInertia > 0) {
					if (stabilizersEnabledDown) {
						applyForceY(-yForceToApply);
					}
				} else {
					if (stabilizersEnabledUp) {
						applyForceY(yForceToApply);
					}
				}
			}
			
		}
	}
}


