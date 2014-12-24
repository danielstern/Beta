package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class ConstrainableObject extends ExplodableObject
	{

		protected var maxX;
		protected var minX;
		protected var maxY;
		protected var minY:Number;
		protected var killOffScreen:Boolean = false;
		protected var isOffScreen:Boolean = false;
		protected var constrainToScreen = false;

		public function ConstrainableObject() {
			super();
		}
		
		override protected function onAddedToStage(e) {
			
			minX = 0;
			minY = 10;
			maxX = parent.width;
			maxY = parent.height;
			
			super.onAddedToStage(e);
		}
		
		override protected function tick() {
			super.tick();
			
			if (constrainToScreen) {		
				if (x < minX) {
					x = minX;
				} else if (x > maxX) {
					x = maxX;
				}
				
				if (y < minY) {
					y = minY;
				} else if (y > maxY) {
					y = maxY;
				}
			} else {
				if (parent) {
					if (x < 0 || x > parent.width || y < 0 || y > parent.height) {
						isOffScreen = true;
					};
				}
			}			
			
			if (isOffScreen && killOffScreen) {
				kill();
			}
			
		}
	}
}


