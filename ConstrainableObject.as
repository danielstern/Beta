package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class ConstrainableObject extends KillableObject
	{

		protected var maxX;
		protected var minX;
		protected var maxY;
		protected var minY:Number;
		protected var killOffScreen:Boolean = false;
		protected var isOffScreen:Boolean = false;

		public function ConstrainableObject() {
			super();
		}
		
		override protected function tick() {
			super.tick();
			
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
			
			if (stage) {
				var stageWidth = stage.stageWidth;
				var stageHeight = stage.height;
				if (x < 0 || x > stageWidth) {
					isOffScreen = true;
				};
			}
			
			if (isOffScreen && killOffScreen) {
				kill();
			}

			
		}
	}
}

