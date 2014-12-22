package beta
{
	import flash.display.*;
	import flash.events.Event;
	import flash.geom.Point;
	import beta.core.*;
	
	public class Gun extends DisplayableObject
	{
		protected var orientation:Number = 90;
		protected var cooldownTime = 20;
		protected var timeUntilCanShoot:Number = 0;
		protected var canShoot:Boolean = true;
		protected var firing:Boolean = false;
		
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
			
			var bullet = new ShipBullet();
			stage.addChild(bullet);
			
			var bulletPos = localToGlobal(new Point(x, y));
			bullet.x = bulletPos.x;
			bullet.y = bulletPos.y;
			
			bullet.applyForceX(250);
			
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


