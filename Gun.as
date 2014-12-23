package beta
{
	import flash.display.*;
	import flash.events.Event;
	import flash.geom.Point;
	import beta.core.*;
	
	public class Gun extends DisplayableObject
	{
		protected var cooldownTime = 20;
		protected var timeUntilCanShoot:Number = 0;
		protected var canShoot:Boolean = true;
		protected var firing:Boolean = false;
		
		public function Gun() {
			super();
			activate();
		}
		
		public function startFiring() {
			firing = true;
		} 
		
		public function stopFiring() {
			firing = false;
		} 
		
		public function fire() {
			
			if (parent && parent.parent) {	
				
				var bullet = getBullet();
				var container = parent.parent;
				container.addChild(bullet);
				
				var bulletPos = this.localToGlobal(new Point());
				bullet.x = bulletPos.x - container.x;
				bullet.y = bulletPos.y - container.y;
				
				var angleRadians = 2 * Math.PI * (orientation) / 360;
				var baseForce = 250;
						
				var xForce = Math.cos(angleRadians) *baseForce;
				var yForce = Math.sin(angleRadians) *baseForce;
				
				bullet.applyForceX(xForce);
				bullet.applyForceY(yForce);
				
				timeUntilCanShoot = cooldownTime;
			}
		}
		
		protected function getBullet() {
			return new ShipBullet();			
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


