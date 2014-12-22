package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class ThornedObject extends DestructibleObject
	{
		protected var damage:Number = 5;
		protected var expireOnDamageDeal = false;
		protected var thorned = true;
		protected var applyForceOnImpact = true;
		
		public function ThornedObject() {
			super();
		}
		
		override protected function tick() {
		
			super.tick();
		
			if (collisions[0] && thorned) {
				
				var other:DestructibleObject = collisions[0];
				//trace(entity + " collided with... " + other);
				other.takeDamage(damage);
				
				if (applyForceOnImpact) {
					other.applyForceX(this.xInertia);			
					other.applyForceY(this.yInertia);	
					
					this.applyForceX( -this.xInertia);
					this.applyForceY( -this.yInertia);
				}
				
				if (expireOnDamageDeal) {
					kill();
				}
			}
			
		}
	}
}


