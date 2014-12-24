package beta.components {
	
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	public class Gunship extends Ship
	{
		protected var guns = [];
		public function Gunship(world) {
			super(world);
			addBoxModelCircleFixture(0.3);
	
			addGun(new b2Vec2(0.5, 0.5));
			addGun(new b2Vec2(0.5, -0.5));		
		}
		
		public function addGun(position) {
			
			var fixture:b2Fixture = addBoxModelCircleFixture(0.1,position);
			var gun = new Gun(fixture);
			guns.push(gun);
			return gun;
		}
		
		protected function getGun() {
			
		}
		
		protected function gunsStartFiring() {
			guns.forEach(function(gun) {
				gun.startFiring();
			});
		}
		
		protected function gunsStopFiring() {
			
			guns.forEach(function(gun) {
				gun.stopFiring();
			});
		}
		
		override protected function tick() {
			super.tick();			

			if (controlsAction1) {
				gunsStartFiring();
			} else {
				gunsStopFiring();
			}
			
		}
	}
}


