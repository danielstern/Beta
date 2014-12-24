package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class DestructibleObject extends ThrustableObject
	{
		protected var health = 25;
		protected var maxHealth = 25;
		public static var TAKE_DAMAGE = "takeDamage";
		public static var DESTROYED = "destroyed";
		
		public function DestructibleObject() {
			super();
		}
		
		public function takeDamage(damage:Number) {
			health -= damage;
			turnRed();
			clearFiltersAfter(5);
			meta(DestructibleObject.TAKE_DAMAGE);
			metaTookDamage(damage);
		}
		
		public function restoreHealth(restorationAmount:Number) {
			health += restorationAmount;
			if (health > maxHealth) {
				health = maxHealth;
			}
		}
		
		override protected function tick() {
			if (health <= 0) {
				health = 0;
				meta(DestructibleObject.DESTROYED);
				kill();				
			}
			super.tick();
		}
	}
}


