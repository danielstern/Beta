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
			
			mass = 1;
			xThrusterPower = 1;
			yThrusterPower = 1;
			stablizerPowerX = 3;
			stablizerPowerY = 3;
			
			
		}
	}
}


