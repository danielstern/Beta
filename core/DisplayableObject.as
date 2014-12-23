package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class DisplayableObject extends TimekeepingObject
	{
		protected var _orientation = 0;
		public var container:MovieClip;
		public function DisplayableObject() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		protected function onAddedToStage(e) {
			
		}
		
		public function appendTo(_container:MovieClip) {
			container = _container;
			container.addChild(this);
		}
		
		public function set orientation(val) {
			_orientation = val;
		}
		
		public function get orientation() {
			return _orientation;
		}
		
		override protected function kill() {
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			if (parent) {
				parent.removeChild(entity);
			}		
			
			super.kill();
		}
	}
}


