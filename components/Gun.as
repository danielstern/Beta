package beta.components {
	import flash.display.*;
	import flash.events.Event;
	import flash.geom.Point;
	import beta.core.*;
	import beta.units.ShipBullet;
	
	public class Gun extends BoxModelObject
	{
		protected var cooldownTime = 20;
		protected var timeUntilCanShoot:Number = 0;
		protected var canShoot:Boolean = true;
		protected var firing:Boolean = false;
		public static var SHOOT:String = "shoot";
		public static var NAME:String = "gun";
		public var orientation = 0;
		
		public function Gun(ship:Gunship) {
			super(ship.world);
			activate();
			name = NAME;
		}
		
		public function startFiring() {
			firing = true;
		} 
		
		public function stopFiring() {
			firing = false;
		} 
		
		public function fire() {
			
			//dispatchEvent(new Event(Gun.SHOOT,true));
			//return;
			
				
				var bullet = getBullet();
				//var container = parent.parent;
				//container.addChild(bullet);
				
				//var bulletPos = entity.localToGlobal(new Point());
				//bullet.x = bulletPos.x - container.x;
				//bullet.y = bulletPos.y - container.y;
				
				//var angleRadians = 2 * Math.PI * (orientation) / 360;
				//var baseForce = 250;
						
				//var xForce = Math.cos(angleRadians) *baseForce;
				//var yForce = Math.sin(angleRadians) *baseForce;
				
				//bullet.applyForceX(xForce);
				//bullet.applyForceY(yForce);
				
				timeUntilCanShoot = cooldownTime;
				
				meta(Gun.SHOOT);
		}
		
		protected function getBullet() {
			return new ShipBullet(world);			
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


