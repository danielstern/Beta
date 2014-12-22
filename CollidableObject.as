package beta
{
	import flash.display.*;
	import flash.events.Event;
	public class CollidableObject extends DisplayableObject
	{
		public static var COLLISION_NONE = 'none';
		protected var collisionType = CollidableObject.COLLISION_NONE;
		public function CollidableObject() {
			super();
			trace("I'm a collidable object.");
		}
		
		override protected function tick() {
			super.tick();
		}
	}
}


