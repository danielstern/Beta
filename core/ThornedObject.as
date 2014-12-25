package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class ThornedObject extends DestructibleObject
	{
		protected var damage:Number = 5;
		protected var expireOnDamageDeal = false;
		protected var thorned = true;
		protected var applyForceOnImpact = true;
		
		public function ThornedObject(world) {
			super(world);
		}
		
		override protected function tick() {
		
			if (collisions[0] && thorned) {
				
				var other:ThornedObject = collisions[0];		
				
					trace(entity, "Dealing damage to", other, damage);
					if (collidesWith === other.collisionType && !killed && !other.killed) {
						other.takeDamage(damage);
				
						if (expireOnDamageDeal) {
							health = 0;
						}
					}				
			}
			
			super.tick();
			
		}
	}
}


