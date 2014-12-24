package beta.core {
	import flash.display.*;
	import flash.events.Event;
	
	public class ControllableObject extends UpgradableObject
	{
		protected var controlsGoingRight = false;
		protected var controlsGoingLeft = false;
		protected var controlsGoingUp = false;
		protected var controlsGoingDown = false;
		protected var controlsAction1 = false;
		
		public function ControllableObject(world) {
			super(world);
		}
		
		public function startRight() {
			controlsGoingRight = true;
		}
		
		public function stopRight() {
			controlsGoingRight = false;
		}
		
		public function startLeft() {
			controlsGoingLeft = true;
		}
		
		public function stopLeft() {
			controlsGoingLeft = false;
		}
		
		public function startUp() {
			controlsGoingUp = true;
		}
		
		public function stopUp() {
			controlsGoingUp = false;
		}
		
		public function startDown() {
			controlsGoingDown = true;
		}
		
		public function stopDown() {
			controlsGoingDown = false;
		}
		
		public function startAction1() {
			controlsAction1 = true;
		}
		
		public function stopAction1() {
			controlsAction1 = false;
		}
	}
}


