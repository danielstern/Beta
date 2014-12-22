package beta
{
	import flash.display.*;
	import flash.events.Event;
	import com.coreyoneil.collision.CollisionList;
	public class CollidableObject extends ConstrainableObject
	{	
		protected var collisionType = 0;
		protected var collidesWith = 0;
		protected static var allObjects = [];
		protected var collisionList:CollisionList;
		public var collisions:Array;

		public function CollidableObject() {
			super();			
			collisionList = new CollisionList(this);
			allObjects.push(this);
		}
		
		override protected function onAddedToStage(e) {
			super.onAddedToStage(e);
			dispatchEvent(new Event("collidableObject", true));
			var entity = this;
			
		//	stage.addEventListener("collidableObject", function(e) {
		//		trace("Collidable object added,", entity, e.target);
		//		collisionList.addItem(e.target);				
		//	})
		}
		
		override protected function tick() {
			super.tick();
			collisions = [];
			collisionList = new CollisionList(this);
			CollidableObject.allObjects.forEach(function(object) {
				collisionList.addItem(object);
			})
			
			var collisionsThisFrame = collisionList.checkCollisions();
			
			collisionsThisFrame.forEach(function(collision) {
			//	trace("Collisions this frame?", entity);
				var other = collision.object1 === entity ? collision.object2 : collision.object1;
				if (other.collisionType === collidesWith) {
					collisions.push(other);
				}
				
			});
			//collisions.push("?");
		}
	}
}


