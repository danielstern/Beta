package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class Gun extends DisplayableObject
	{
		protected var orientation:Number = 90;
		protected var cooldownTime = 20;
		protected var timeUntilCanShoot:Number = 0;
		protected var canShoot:Boolean = true;
		protected var firing:Boolean = true;
		
		public function Gun() {
			super();
		}
		
		public function startFiring() {
			firing = true;
		} 
		
		public function stopFiring() {
			firing = false;
		} 
		
		public function fire() {
			trace("Blam!");
			timeUntilCanShoot = cooldownTime;
		}
		
		override protected function tick() {
			super.tick();	
			if (timeUntilCanShoot <= 0) {
				canShoot = true;	
			} else {
				canShoot = false;
				timeUntilCanShoot--;
			}
			
			if (canShoot && firing) {
				fire();
			}
		}
	}
}


