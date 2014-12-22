package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class Actor extends PropellableObject
	{
		protected var name = "unknown";
		protected var health = 100;
		protected var maxHealth = 100;
		
		public function Actor() {
			super();
			trace("I'm an actor.");
			
			addEventListener(Event.ENTER_FRAME, function() {
				
			})
		}
		
		public function takeDamage(damage:Number) {
			health -= damage;
			if (health < 0) {
				health = 0;
			}
		}
		
	}
}


