package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	public class TimekeepingObject extends KillableObject
	{
		protected var entity = this;
		
		protected var cycle = 0;
		protected var timer;
		private var timers = [];

		public function TimekeepingObject() {
			super();	
			timer = setInterval(onEnterFrame, 50);
		}
		
		protected function onEnterFrame() {
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
			clearInterval(timer);
			super.kill();
		}
	}
}


