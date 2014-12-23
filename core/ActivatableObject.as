package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	import flash.utils.getAliasName;
	import flash.utils.getQualifiedClassName;
	import beta.events.MetaEvent;
	
	public class ActivatableObject extends MovieClip
	{
		protected var activated = false;

		public function ActivatableObject() {
			super();
			name = 'object';
		}
		
		public function activate() {
			activated = true;
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
	}
}


