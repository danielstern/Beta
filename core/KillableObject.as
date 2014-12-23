package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	
	public class KillableObject extends ActivatableObject
	{
		public var killed = false;

		public function KillableObject() {
			super();
		}
		
		protected function kill() {
			killed = true;	
		}
		
		
	}
}


