package beta.events {
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	
	public class HealingEvent extends MetaEvent
	{
		public var recoveryAmount:Number = 0;
		public function HealingEvent (type:String, bubbles:Boolean = true, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}


