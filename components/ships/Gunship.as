package beta.components.ships {
	
	import beta.events.SpawnedChildEvent;
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	import beta.components.guns.*;
	import Box2D.Dynamics.b2World;
	public class Gunship extends Ship
	{
		protected var guns:Array = new Array();
		public function Gunship(world:b2World) {
			super(world);
			createShipFixtures();
			createGuns();
		}
		
		protected function createShipFixtures() {
			addBoxModelCircleFixture(0.3);
		}
		
		
		protected function createGuns() {
			addGun(getGun());
		}
		
		protected function getGun():Gun {
			return new Gun(world);
		}
		
		public function addGun(gun:Gun, position:b2Vec2 = null, orientationOffset:Number = 0 ) {
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
		
		override protected function kill() {
			gunsStopFiring();
			guns.forEach(function(gun) {
				gun.destroy();
			});
			super.kill();
		}
		
		protected function gunsStopFiring() {
			guns.forEach(function(gun) {
				gun.stopFiring();
			},null);
		}
		
		override protected function tick() {
			super.tick();	

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


