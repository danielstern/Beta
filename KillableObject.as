package beta
{
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	
	public class KillableObject extends MovieClip
	{
		protected var killed = false;

		public function KillableObject() {
			super();
		}
		
		protected function kill() {
			killed = true;	
		}
	}
}


