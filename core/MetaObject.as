package beta.core {
	import flash.display.MovieClip;
	import flash.events.Event;
	import beta.events.MetaEvent;
	import beta.events.DamageEvent;
	
	public class MetaObject extends ActivatableObject
	{
		protected var metaShowsDamage:Boolean = true;
		public function MetaObject() {
			super();
		}
		
		public function meta(type) {
			var origin = name + ":" + type;
			var mainEvent:Event = new Event(origin, true);
			var audioEvent:MetaEvent = new MetaEvent("audio", true);
			audioEvent.origin = origin;
			//trace("Meta event...", origin);
			dispatchEvent(mainEvent);			
			dispatchEvent(audioEvent);			
		}
		
		public function metaTookDamage(damage) {
			if (metaShowsDamage) {
				var damageEvent:DamageEvent = new DamageEvent('damage');
				damageEvent.damageDealt = damage;
				damageEvent.damageX = x;
				damageEvent.damageY = y;
				damageEvent.origin = this;
				dispatchEvent(damageEvent);
			}
		}
	}
}


