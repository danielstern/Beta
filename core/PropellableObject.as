package beta.core {
	import Box2D.Common.Math.b2Vec2;
	import flash.display.*;
	import flash.events.Event;
	
	public class PropellableObject extends CollidableObject
	{	
		public function PropellableObject(world) {
			super(world);		
		}
		
		public function applyForceX(x:Number) {
			boxModelBody.ApplyForce(new b2Vec2(x * boxModelBody.GetMass(), 0), boxModelBody.GetLocalCenter());
		}
		
		public function applyForceY(y:Number) {
			boxModelBody.ApplyForce(new b2Vec2(0, y * boxModelBody.GetMass()), boxModelBody.GetLocalCenter());
		}
		
		public function applyForce(vec:b2Vec2) {
			boxModelBody.ApplyForce(vec,boxModelBody.GetLocalCenter());
		}
		
		override protected function kill() {
			super.kill();
		}
	}
}


