package beta.events {
	import flash.events.Event;
	
	public class MetaEvent extends Event
	{
		public var origin;
		public function MetaEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}


