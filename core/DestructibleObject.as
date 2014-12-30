package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class DestructibleObject extends TimekeepingObject
	{
		protected var health = 25;
		protected var maxHealth = 25;
		public static var TAKE_DAMAGE = "takeDamage";
		public static var RESTORE_HEALTH = "restoreHealth";
		protected static var destroyed = false;
		public static var DESTROYED = "destroyed";
		
		public function DestructibleObject() {
			super();
		}
		
		public function takeDamage(damage:Number) {
			health -= damage;
		}
		
		public function restoreHealth(restorationAmount:Number) {
			health += restorationAmount;
			if (health > maxHealth) {
				health = maxHealth;
			}
		}
		
		public function destroy() {
			takeDamage(maxHealth);
		}
		
		override protected function tick() {
			if (health <= 0) {
				health = 0;
				destroyed = true;
				kill();				
			}
			super.tick();
		}
	}
}


