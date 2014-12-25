package beta.components {
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Transform;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Fixture;
	import flash.display.*;
	import flash.events.Event;
	import flash.geom.Point;
	import beta.core.*;
	import beta.units.ShipBullet;
	import beta.core.BoxModelObject;
	
	public class Gun extends BoxModelObject
	{
		public var cooldownTime = 5;
		protected var timeUntilCanShoot:Number = 0;
		protected var canShoot:Boolean = true;
		protected var firing:Boolean = false;
		public static var SHOOT:String = "shoot";
		public static var NAME:String = "gun";
		public var bulletsCollideWith = -1;
		var fixture:b2Fixture;
		
		public function Gun(_fixture:b2Fixture) {
			fixture = _fixture;
			super(fixture.GetBody().GetWorld());
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
			
			var aabb:b2AABB = new b2AABB();
			fixture.GetShape().ComputeAABB(aabb, fixture.GetBody().GetTransform());

			var bullet:Bullet = getBullet();			
			bullet.collidesWith = bulletsCollideWith;			
			bullet.boxModelBody.SetPosition(aabb.GetCenter());
			
			var totalForce = 1 * bullet.boxModelBody.GetMass();
			var forceX = Math.sin(orientation) * totalForce;
			var forceY = Math.cos(orientation) * totalForce;
			bullet.applyForce(new b2Vec2(forceX,forceY));
			
			timeUntilCanShoot = cooldownTime;
			
			meta(Gun.SHOOT);
			metaSpawnedChild(bullet);
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


