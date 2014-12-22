package beta
{
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	
	public class ExplodableObject extends FilterableObject
	{
		protected var explosionType = "debris";
		protected var explosionParticleCount = 5;
		protected var doesExplode = true;

		public function ExplodableObject() {
			super();
		}
		
		override protected function kill() {
			
			if (doesExplode && !killed) {			
	
				for (var i = 0; i < explosionParticleCount; i++) {
					var debris = new Debris();
					stage.addChild(debris);
					
					var pos = entity.localToGlobal(new Point());
					debris.x = pos.x;
					debris.y = pos.y;
					
					var xForce = Math.random() * 100 - 50;
					var yForce = Math.random() * 100 - 50;
					
					debris.applyForceX(xForce);
					debris.applyForceY(yForce);
				}
				
			}
			
			super.kill();				
		}
	}
}


