package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import Box2D.Common.Math.b2Vec2;
	
	public class ThrustableObject extends PropellableObject
	{
		protected var thrustingRight:Boolean = false;
		protected var thrustingLeft:Boolean = false;
		protected var thrustingUp:Boolean = false;
		protected var thrustingDown:Boolean = false;
		protected var xThrusterPower = 0.2;
		protected var yThrusterPower = 0.2;
		
		protected var thrustForce:Number = 0.02;
		
		public function ThrustableObject(world) {
			super(world);	
		}
		
		
		override protected function tick() {
			super.tick();
			
			var vec:b2Vec2 = new b2Vec2(0, 0);
			
			
			if (thrustingRight) {
		
				vec.x = thrustForce;
			} else if (thrustingLeft) {
				vec.x = -thrustForce
			} 
			
			if (thrustingUp) {
				vec.y = -thrustForce;
			} else if (thrustingDown) {
				vec.y = thrustForce
			} 
			
			boxModelBody.SetLinearVelocity(vec);
			
			//if (thrustingRight) {
				//applyForceX(xThrusterPower);
				//stabilizersEnabledRight = false;
			//} else {
				//stabilizersEnabledRight = true;
			//}
			//
			//if (thrustingLeft) {
				//applyForceX( -xThrusterPower);
				//stabilizersEnabledLeft = false;
			//} else {
				//stabilizersEnabledLeft = true;
			//}
			//
//
			//if (thrustingUp) {
				//applyForceY( -yThrusterPower);
				//stabilizersEnabledUp = false;
			//} else {
				//stabilizersEnabledUp = true;				
			//}
			//
			//if (thrustingDown) {
				//applyForceY(yThrusterPower);
				//stabilizersEnabledDown = false;
			//} else {
				//stabilizersEnabledDown = true;				
			//}
		}
	}
}
