package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import com.coreyoneil.collision.CollisionList;
	import flash.geom.Point;
	public class CollidableObject extends ConstrainableObject
	{	
		//protected var collidableObjects = [];
		protected var collisionList:CollisionList;
		
		protected var collisionType = 0;
		protected var collidesWith = 0;
		public var collisions:Array = [];
		private var collidable = false;

		public function CollidableObject() {
					
			//if (collidable) {
			//	trace("New collidable object...", this);
			//	allCollidableObjects.push(this);
			//} else {
			//	trace("Collidable?", collidable);
			//}
			super();	
		}
		
		public function enableCollisions() {
			//CollidableObject.allCollidableObjects.push(this);
			collisionList = new CollisionList(this);
			collidable = true;
		}
		
		override protected function onAddedToStage(e) {
			if (collidable) {				
				
				super.onAddedToStage(e);
				dispatchEvent(new Event("collidableObject", true));
				stage.addEventListener("collidableObject", function(e) {
					collisionList.addItem(e.target);
				})
			}
		}
		
		override protected function kill() {
			if (collidable) {
				collisionList.dispose();
			//	var all = CollidableObject.allCollidableObjects;
			
			//	trace("Killing collision object...",all.indexOf(entity),all,entity)
			//	all.splice(all.indexOf(entity), 1);
				//trace(all.length);
			//}
				collidable = false;
			
				
			}
			
			super.kill();
			
		}
		
		override protected function tick() {
			super.tick();
			if (collidable) {			
				collisions = [];
				
				
				//var collisionList = new CollisionList(this);
				//var objectsOfConcern = CollidableObject.allCollidableObjects.filter(function(other) {
				//	var distance = Point.distance(new Point(other.x, other.y), new Point(x, y));
	//
				//	if (other.collisionType === collidesWith && distance < 100 && other.collidable) {
				//		return true;
			//		}
			//	});
							
				//objectsOfConcern.forEach(function(object) {
//					collisionList.addItem(object);
	//			})
				
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


