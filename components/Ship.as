package beta.components {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.AutoControlMappingObject;
	
	public class Ship extends AutoControlMappingObject
	{
		public function Ship(world) {
		
			super(world);
			
			enableCollisions();
			doesExplode = true;
			explosionParticleCount = 4;
			
			
		}
		
			
		protected function createFixtures() {
			addBoxModelCircleFixture(0.3);
		}
	}
}


