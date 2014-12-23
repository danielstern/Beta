package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class DestructibleObject extends ThrustableObject
	{
		protected var health = 100;
		protected var maxHealth = 100;
		
		public function DestructibleObject() {
			super();
		}
		
		public function takeDamage(damage:Number) {
			health -= damage;
			turnRed();
			clearFiltersAfter(5);
			trace(entity, "Health:", health);
			
		}
		
		public function restoreHealth(restorationAmount:Number) {
			health += restorationAmount;
			if (health > maxHealth) {
				health = maxHealth;
			}
		}
		
		override protected function tick() {
			if (health < 0 && !killed) {
				health = 0;
				trace("Kill", entity);
				kill();
			}
			super.tick();
		}
	}
}


