package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class ControllableObject extends TimekeepingObject
	{
		protected var controlsRight:Boolean = false;
		protected var controlsLeft:Boolean = false;
		protected var controlsUp:Boolean = false;
		protected var controlsDown:Boolean = false;
		protected var controlsAction1:Boolean = false;
		
		
		
		public function ControllableObject() {
			super();
		}
		
		public function startRight() {
			controlsRight = true;
		}
		
		public function stopRight() {
			controlsRight = false;
		}
		
		public function startLeft() {
			controlsLeft = true;
		}
		
		public function stopLeft() {
			controlsLeft = false;
		}
		
		public function startUp() {
			controlsUp = true;
		}
		
		public function stopUp() {
			controlsUp = false;
		}
		
		public function startDown() {
			controlsDown = true;
		}
		
		public function stopDown() {
			controlsDown = false;		
		}
		
		public function startAction1() {
			controlsAction1 = true;
		}
		
		public function stopAction1() {
			controlsAction1 = false;
		}
		
	}
	
	
}


