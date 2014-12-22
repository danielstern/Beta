package beta
{
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
			if (health < 0) {
				health = 0;
				dispatchEvent(new Event("destroyed"));
			}
		}
		
		public function restoreHealth(restorationAmount:Number) {
			health += restorationAmount;
			if (health > maxHealth) {
				health = maxHealth;
			}
		}
	}
}


