package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class DisplayableObject extends MovieClip
	{
		//protected var x:Number;
		protected var cycle = 0;
		//protected var y:Number;
		protected var displayState = {
			
		}
		public function DisplayableObject() {
			super();
			
			addEventListener(Event.ENTER_FRAME, function() {
			  cycle++;
			  tick();
			})
		}
		
		protected function tick() {
			
		}
	}
}


