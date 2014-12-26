package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	
	public class KillableObject extends MetaObject
	{
		public var killed = false;

		public function KillableObject() {
			super();
		}
		
		protected function kill() {
			killed = true;	
		}
		
		public function destroy() {
			kill();
		}
		
		
	}
}


