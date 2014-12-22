package beta
{
	import flash.display.*;
	import flash.events.Event;
	import com.coreyoneil.collision.CollisionList;
	public class CollidableObject extends ConstrainableObject
	{	
		protected static var allCollidableObjects = [];
		
		protected var collisionType = 0;
		protected var collidesWith = 0;
		public var collisions:Array;

		public function CollidableObject() {
			super();			
			allCollidableObjects.push(this);
		}
		
		override protected function onAddedToStage(e) {
			super.onAddedToStage(e);
			dispatchEvent(new Event("collidableObject", true));
		}
		
		override protected function kill() {
			var all = CollidableObject.allCollidableObjects;
			all.splice(all.indexOf(entity), 1);
			
			super.kill();
		}
		
		override protected function tick() {
			super.tick();
			collisions = [];
			
			var collisionList = new CollisionList(this);
			CollidableObject.allCollidableObjects.forEach(function(object) {
				collisionList.addItem(object);
			})
			
			var collisionsThisFrame = collisionList.checkCollisions();
			
			collisionsThisFrame.forEach(function(collision) {
				var other = collision.object1 === entity ? collision.object2 : collision.object1;
				if (other.collisionType === collidesWith) {
					collisions.push(other);
				}
			});
		}
	}
}


