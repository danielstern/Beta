package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import beta.*;
	import beta.components.Debris;
	
	public class ExplodableObject extends FilterableObject
	{
		protected var explosionType = "debris";
		protected var explosionParticleCount = 5;
		protected var doesExplode = false;

		public function ExplodableObject() {
			super();
		}
		
		override protected function kill() {			
			if (doesExplode && !killed) {			
				explode();	
			}
			super.kill();
		}
		
		protected function explode() {
			for (var i = 0; i < explosionParticleCount; i++) {
				var debris = new Debris();
				parent.addChild(debris);
				
				var pos = entity.localToGlobal(new Point());
				debris.x = pos.x - parent.x;
				debris.y = pos.y - parent.y;
				
				var xForce = Math.random() * 100 - 50;
				var yForce = Math.random() * 100 - 50;
				
				debris.applyForceX(xForce);
				debris.applyForceY(yForce);
			}
			
		}
	}
}


