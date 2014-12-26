package beta.core {
	import beta.events.HealingEvent;
	import beta.events.SpawnedChildEvent;
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
			var mainEvent:MetaEvent = new MetaEvent(type, true);
			dispatchEvent(mainEvent);						
		}
		
		public function metaSpawnedChild(child:ThornedObject) {
			var event:SpawnedChildEvent = new SpawnedChildEvent(SpawnedChildEvent.SPAWNED);
			event.child = child;
			dispatchEvent(event);
		}
		
		public function metaTookDamage(damage) {
			var damageEvent:DamageEvent = new DamageEvent('damage');
			damageEvent.damageDealt = damage;
			dispatchEvent(damageEvent);
		}
		
		public function metaRecoveredHealth(recoveryAmount) {
			var healEvent:HealingEvent = new HealingEvent('heal');
			healEvent.recoveryAmount = recoveryAmount;
			healEvent.origin = this;			
		}
	}
}


