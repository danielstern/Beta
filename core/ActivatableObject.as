package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	
	public class ActivatableObject extends MovieClip
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


