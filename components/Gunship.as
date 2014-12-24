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
			mass += 0.2;
			stabilizersEnabled = true;
			
		
		}
		
		public function addGun() {
	
			var circleShape:b2CircleShape = new b2CircleShape(0.1);
			circleShape.SetLocalPosition(new b2Vec2(2, 2));
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.shape = circleShape;
			var fixture:b2Fixture = boxModelBody.CreateFixture(fixtureDef);
			var gun = new Gun(fixture);
			//parent.addChild(gun);
			guns.push(gun);
			return gun;
		}
		
		protected function getGun() {
			
		}
		
		protected function gunsStartFiring() {
			trace("guns start firing.");
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
			
			//trace("should guns fire?", controlsAction1);
			
			if (controlsAction1) {
				//turnWhite();
				gunsStartFiring();
			} else {
				//clearFilters();
				gunsStopFiring();
			}
			
		}
	}
}


