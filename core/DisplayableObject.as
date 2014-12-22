package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class DisplayableObject extends TimekeepingObject
	{
		public function DisplayableObject() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		protected function onAddedToStage(e) {
			
		}
		
		override protected function kill() {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			//trace("displayable object kill.",entity);
			if (parent && stage) {
				parent.removeChild(entity);
			}		
			
			super.kill();
		}
	}
}


