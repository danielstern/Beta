package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	public class TimekeepingObject
	{		
		protected var cycle = 0;
		protected var timer;

		public function TimekeepingObject() {
			super();	
			timer = setInterval(onEnterFrame, 1);
		}
		
		protected function onEnterFrame() {
			tick();
		}
		

		protected function tick() {
			cycle++;
		}
		
		protected function kill() {
			clearInterval(timer);
		}
	}
}


