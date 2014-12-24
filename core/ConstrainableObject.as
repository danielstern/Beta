package beta.core {
	import beta.containers.BoxWorldContainer;
	import flash.display.*;
	import flash.events.Event;
	
	public class ConstrainableObject extends BoxModelObject
	{

		protected var maxX;
		protected var minX;
		protected var maxY;
		protected var minY:Number;
		protected var killOffScreen:Boolean = false;
		protected var isOffScreen:Boolean = false;
		protected var constrainToScreen = false;
		protected var container:BoxWorldContainer;

		public function ConstrainableObject(world) {
			super(world);
		}
		
		//override protected function onAddedToStage(e) {
			//
			//var _container:* = parent;
			//container = _container;
			//
			//minX = 0;
			//minY = 10;
			//maxX = container.containerWidth;
			//maxY = container.containerHeight - height;
			//
			//super.onAddedToStage(e);
		//}
		
		override protected function tick() {
			super.tick();
			
			//
			//if (constrainToScreen) {		
				//if (x < minX) {
					//x = minX;
				//} else if (x > maxX) {
					//x = maxX;
				//}
				//
				//if (y < minY) {
					//y = minY;
				//} else if (y > maxY) {
					//y = maxY;
				//}
			//} else {
				//if (parent) {
					//
					//if (x < 0 || x >= parent.width - 10 || y < 0 || y >= parent.height - 10) {
						//isOffScreen = true;
					//};
				//}
			//}			
			//
			//if (isOffScreen && killOffScreen) {
				//kill();
			//}
			
		}
	}
}


