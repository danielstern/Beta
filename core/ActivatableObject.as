package beta.core {
	import flash.display.MovieClip;
	import flash.events.Event;
	import beta.events.MetaEvent;
	import beta.events.DamageEvent;
	
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
	}
}


