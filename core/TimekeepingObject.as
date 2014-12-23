package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class TimekeepingObject extends KillableObject
	{
		protected var entity = this;
		
		protected var cycle = 0;
		private var timers = [];

		public function TimekeepingObject() {
			super();	
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		protected function onEnterFrame(e) {
			if (activated && !killed) {			
				cycle++;
				tick();
			}
		}
		
		public function doAfter(frames, callback, arg = undefined) {
			timers.push( {
				framesUntilResolve:frames,
				callback:callback,
				arg:arg
			})			
		}
		
		protected function tick() {
			timers.forEach(function(timer) {
				timer.framesUntilResolve--;
				if (timer.framesUntilResolve === 0) {
					timer.callback();
				}
			})
			
			for (var i = timers.length; i > 0; i--) {	
				var timer = timers[i-1]
				if (timer.framesUntilResolve === 0) {
					timers.splice(i - 1, 1);
				}
			}
			
		}
		
		override protected function kill() {
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			super.kill();
		}
	}
}


