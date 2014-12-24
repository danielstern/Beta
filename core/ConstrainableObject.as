package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class ConstrainableObject extends BoxModelObject
	{

		protected var maxX = 500;
		protected var minX = 0;
		protected var maxY = 500;
		protected var minY:Number = 0;
		protected var killOffScreen:Boolean = false;
		protected var isOffScreen:Boolean = false;
		protected var constrainToScreen = false;

		public function ConstrainableObject(world) {
			super(world);
		}
		
		
		override protected function tick() {
			super.tick();
			var x = getBoxModelPosition().x;
			var y = getBoxModelPosition().y;
			
			if (constrainToScreen) {		
				if (x < minX) {
					//x = minX;
				} else if (x > maxX) {
					//x = maxX;
				}
				
				if (y < minY) {
					//y = minY;
				} else if (y > maxY) {
					//y = maxY;
				}
			} else {	
				if (x < minX || x >= maxX || y < minY || y >= maxY) {
					isOffScreen = true;
				};
			}			
			//
			if (isOffScreen && killOffScreen) {
				kill();
			}
			
		}
	}
}


