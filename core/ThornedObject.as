package beta.core {
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
		
			if (collisions[0] && thorned) {
				
				var other:DestructibleObject = collisions[0];
				if (!other.killed) {					
					other.takeDamage(damage);
					
					if (applyForceOnImpact) {
						other.applyForceX(this.xInertia);			
						other.applyForceY(this.yInertia);	
						
						applyForceX( -this.xInertia);
						applyForceY( -this.yInertia);
					}
					
					if (expireOnDamageDeal) {
						kill();
					}
				}
			}
			
			super.tick();
			
		}
	}
}


