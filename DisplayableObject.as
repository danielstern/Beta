package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class DisplayableObject extends MovieClip
	{
		protected var cycle = 0;
		protected var entity = this;

		public function DisplayableObject() {
			super();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		protected function onEnterFrame(e) {
			cycle++;
			tick();
		}
		
		protected function onAddedToStage(e) {
			
		}
		
		protected function tick() {

		}
	}
}


