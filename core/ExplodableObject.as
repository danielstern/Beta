package beta.core {
	import Box2D.Common.Math.b2Vec2;
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import beta.*;
	import beta.components.misc.Debris;
	
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
			if (!isOffScreen) {			
				for (var i = 0; i < explosionParticleCount; i++) {
					var debris:ThornedObject = getDebris();
					var vector = getDebrisVector(i);
					
					debris.setBoxModelPosition(getBoxModelPosition());
					debris.boxModelBody.SetAngularVelocity(Math.random() * Math.PI / 50 - Math.PI / 100);
					
					debris.applyForce(vector);
				}		
			}
		}
		
		protected function getDebris() {
			return new Debris(world);
		}
		
		protected function getDebrisVector(i):b2Vec2 {
			var debrisForce = 0.005;
			var xForce = Math.random() * debrisForce - debrisForce / 2;
			var yForce = Math.random() * debrisForce - debrisForce / 2;
			return new b2Vec2(xForce,yForce);
		}
	}
}


