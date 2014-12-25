package beta.components.ships {
	
	import beta.events.SpawnedChildEvent;
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	import beta.components.guns.*;
	public class Gunship extends Ship
	{
		protected var guns = [];
		public function Gunship(world) {
			super(world);
			createShipFixtures();
			createGuns();
			//addGun(getBasicGun
		
		}
		
		protected function createShipFixtures() {
			addBoxModelCircleFixture(0.3);
		}
		
		protected function createGuns() {
			//var gun = addGun(new Gun(world));
		}
		
		public function addGun(gun:Gun, position = null, orientationOffset:Number = 0 ) {
			if (!position) {
				position = new b2Vec2(0, 0);
			}
			var fixture:b2Fixture = addBoxModelCircleFixture(0.1,position);
			gun.setFixture(fixture);
			guns.push(gun);
			gun.orientation = orientation + orientationOffset;
			gun.addEventListener(SpawnedChildEvent.SPAWNED, onGunshot);
			return gun;
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
			
			if (killed) {
				gunsStopFiring();
				return;
			}

			if (controlsAction1 && controlledViaOverride) {
				gunsStartFiring();
			} else {
				gunsStopFiring();
			}
			
		}
		
		private function onGunshot(e) {
			metaSpawnedChild(e.child);			
		}
	}
}


