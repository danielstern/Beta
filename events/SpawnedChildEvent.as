package beta.events {
	import beta.core.ThornedObject;
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	
	public class SpawnedChildEvent extends MetaEvent
	{
		public var child:ThornedObject;
		public static var SPAWNED = 'spawned';
		public function SpawnedChildEvent (type:String, bubbles:Boolean = true, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
}


