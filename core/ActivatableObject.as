package beta.core {
	import flash.display.MovieClip;
	import flash.events.Event;
	import beta.events.MetaEvent;
	import beta.events.DamageEvent;
	import flash.events.EventDispatcher;
	
	public class ActivatableObject extends EventDispatcher
	{
		protected var activated = false;

		public function ActivatableObject() {
			super();
	
		}
		
		public function activate() {
			activated = true;
		}
	}
}


