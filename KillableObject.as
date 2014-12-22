package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class KillableObject extends DisplayableObject
	{
		protected var killed = false;

		public function KillableObject() {
			super();
		}
		
		protected function kill() {
			trace("Killed.");
			
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			killed = true;
			if (parent && stage) {
				parent.removeChild(this);
			}
			

		}
	}
}


