package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import com.coreyoneil.collision.CollisionList;
	import flash.geom.Point;
	public class CollidableObject extends ExplodableObject
	{	
		protected var collisionList:CollisionList;
		
		protected var collisionType = 0;
		protected var collidesWith = 0;
		public var collisions:Array = [];
		private var collidable = false;

		public function CollidableObject(world) {
			super(world);	
		}
		
		public function enableCollisions() {
			collisionList = new CollisionList(this);
			collidable = true;
		}
		//
		//override protected function onAddedToStage(e) {
			//if (collidable) {					
				//super.onAddedToStage(e);
				//dispatchEvent(new Event("collidableObject", true));
				//stage.addEventListener("collidableObject", function(e) {
					//var other = e.target;
					//if (other.collisionType === collidesWith && other.collidable) {
						//collisionList.addItem(other);
					//}
				//})
			//}
		//}
		
		override protected function kill() {
			if (collidable) {
				collisionList.dispose();
				collidable = false;			
			}
			
			super.kill();
			
		}
		
		override protected function tick() {
			super.tick();
			if (collidable) {			
				collisions = [];
				
				var collisionsThisFrame = collisionList.checkCollisions();
				
				collisionsThisFrame.forEach(function(collision) {
					var other = collision.object1 === entity ? collision.object2 : collision.object1;
					if (other.collisionType === collidesWith) {
						collisions.push(other);
						other.collisions.push(entity);
					}
				});
			}
		}
	}
}


