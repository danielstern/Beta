package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class ThornedObject extends DestructibleObject
	{
		protected var damage:Number = 5;
		protected var expireOnDamageDeal = false;
		protected var thorned = true;
		
		public function ThornedObject() {
			super();
		}
		
		override protected function tick() {
		
			super.tick();
		
			if (collisions[0] && thorned) {
				trace("Taking damage from...", collisions[0]);
				collisions[0].takeDamage(damage);
				
				if (expireOnDamageDeal) {
					kill();
				}
			}
			
		}
	}
}


