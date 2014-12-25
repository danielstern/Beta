package beta.core {
	import Box2D.Dynamics.Contacts.b2CircleContact;
	import Box2D.Dynamics.Contacts.b2Contact;
	import flash.display.*;
	import flash.events.Event;
	import flash.geom.Point;
	public class CollidableObject extends ExplodableObject
	{	
		protected var collisionType = -1;
		public var collidesWith = -1;
		public var collisions:Array = [];
		protected var collidable = true;

		public function CollidableObject(world) {
			super(world);	
		}
		
		public function enableCollisions() {
			collidable = true;
		}
		
		override protected function kill() {
			if (collidable) {
				collidable = false;			
			}
			
			super.kill();
			
		}
		
		override protected function tick() {
			super.tick();
			if (collidable) {			
				collisions = [];
				if (boxModelBody.GetContactList()) {
					var contact:b2Contact = boxModelBody.GetContactList().contact;
					while (contact) {
						var entity1 = contact.GetFixtureA().GetBody().GetUserData().entity;
						var entity2 = contact.GetFixtureB().GetBody().GetUserData().entity;
						var other:CollidableObject;
						
						if (entity1 === entity || entity2 === entity) {
							//trace("nothing doing.");						
						
							if (entity1 === entity) {
								other = entity2;		
							} else {
								other = entity1;		
							}

							if (collidable && other.collidable && collidesWith === other.collisionType && other.collisionType !== -1 && contact.IsTouching()) {
							//if (collidesWith === other.collisionType && other.collisionType !== -1) {
								collisions.push(other);
								trace(entity, "Collide with..", other);
							}						
						}
		
						contact = contact.GetNext();
					}
				}
			}
		}
	}
}


