package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class RepresentableObject extends TimekeepingObject
	{
		public function RepresentableObject() {
			super();
	
		}
		
		override protected function kill() {
			//removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			//if (parent) {
				//parent.removeChild(entity);
			//}		
			//
			super.kill();
		}
	}
}


