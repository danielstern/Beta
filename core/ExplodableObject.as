package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import beta.*;
	import beta.components.Debris;
	
	public class ExplodableObject extends ConstrainableObject
	{
		protected var explosionType = "debris";
		protected var explosionParticleCount = 5;
		protected var doesExplode = false;

		public function ExplodableObject(world) {
			super(world);
		}
		
		override protected function kill() {			
			if (doesExplode && !killed) {			
				explode();	
			}
			super.kill();
		}
		
		protected function explode() {
			for (var i = 0; i < explosionParticleCount; i++) {
				var debris:Debris = new Debris(world);
				debris.setBoxModelPosition(getBoxModelPosition());
				
				var xForce = Math.random() * 100 - 50;
				var yForce = Math.random() * 100 - 50;
				
				debris.applyForceX(xForce);
				debris.applyForceY(yForce);
			}
			
		}
	}
}


