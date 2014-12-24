package beta.events {
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	
	public class DamageEvent extends MetaEvent
	{
		public var damageDealt:Number = 0;
		public var damageX:Number = 0;
		public var damageY:Number = 0;
		public function DamageEvent (type:String, bubbles:Boolean = true, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}


