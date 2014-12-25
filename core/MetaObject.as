package beta.core {
	import beta.events.HealingEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import beta.events.MetaEvent;
	import beta.events.DamageEvent;
	
	public class MetaObject extends ActivatableObject
	{
		protected var metaShowsDamage:Boolean = true;
		public var name = 'meta-object';
		public function MetaObject() {
			super();
		}
		
		public function meta(type) {
			var origin = name + ":" + type;
			//var mainEvent:Event = new Event(origin, true);
			var mainEvent:Event = new Event(type, true);
			//var audioEvent:MetaEvent = new MetaEvent("audio", true);
			//audioEvent.origin = origin;
			//trace("Meta event...", origin);
			dispatchEvent(mainEvent);			
			//dispatchEvent(audioEvent);			
		}
		
		public function metaTookDamage(damage) {
			//if (metaShowsDamage) {
				//var damageEvent:DamageEvent = new DamageEvent('damage');
				//damageEvent.damageDealt = damage;
				//damageEvent.damageX = x;
				//damageEvent.damageY = y;
				//damageEvent.origin = this;
				////dispatchEvent(damageEvent);
			//}
		}
		
		public function metaRecoveredHealth(recoveryAmount) {
			//if (metaShowsDamage) {
				//var healEvent:HealingEvent = new HealingEvent('heal');
				//healEvent.recoveryAmount = recoveryAmount;
				//healEvent.origin = this;
				////dispatchEvent(healEvent);
			//}
		}
	}
}


