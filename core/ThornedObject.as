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
				other.takeDamage(damage);
				
				//buggy
				//if (applyForceOnImpact) {
				//	other.applyForceX(this.xInertia);			
				//	other.applyForceY(this.yInertia);	
					
				//	applyForceX( -this.xInertia);
				//	applyForceY( -this.yInertia);
				//}
				
				if (expireOnDamageDeal) {
					health = 0;
				}
			}
			
			super.tick();
			
		}
	}
}


