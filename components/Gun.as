package beta.components {
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
		protected var cooldownTime = 5;
		protected var timeUntilCanShoot:Number = 0;
		protected var canShoot:Boolean = true;
		protected var firing:Boolean = false;
		public static var SHOOT:String = "shoot";
		public static var NAME:String = "gun";
		public var orientation = 0;
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

			var bullet:Bullet = getBullet();
			bullet.collidesWith = bulletsCollideWith;
			var targetPosition:b2Vec2 = fixture.GetBody().GetPosition();
			var transform:b2Transform = fixture.GetBody().GetTransform();
			
			targetPosition.x += fixture.GetUserData().localPosition.x;
			targetPosition.y += fixture.GetUserData().localPosition.y;
			bullet.boxModelBody.SetPosition(targetPosition);
			bullet.applyForce(new b2Vec2(2.5 * bullet.boxModelBody.GetMass(),0));
			
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


