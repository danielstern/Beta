package beta.core {
	import Box2D.Common.Math.b2Vec2;
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
			
			var x = getBoxModelPosition().x;
			var y = getBoxModelPosition().y;
			
			if (constrainToScreen) {		
				if (x < minX) {
					boxModelBody.SetPosition(new b2Vec2(minX, y));
				} else if (x > maxX) {
					boxModelBody.SetPosition(new b2Vec2(maxX, y));
				}
				
				if (y < minY) {
					boxModelBody.SetPosition(new b2Vec2(x, minY));
				} else if (y > maxY) {
					boxModelBody.SetPosition(new b2Vec2(x, maxY));
				}
			} else {	
				if (x < minX || x >= maxX || y < minY || y >= maxY) {
					isOffScreen = true;
				};
			}		
			
			super.tick();
			
			if (isOffScreen && killOffScreen) {
				kill();
			}
			
		}
	}
}


