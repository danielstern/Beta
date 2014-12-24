package beta.core {
	import flash.display.*;
	import flash.events.Event;
	import Box2D.Common.Math.b2Vec2;
	
	public class ThrustableObject extends StabilizingObject
	{
		protected var thrustingRight:Boolean = false;
		protected var thrustingLeft:Boolean = false;
		protected var thrustingUp:Boolean = false;
		protected var thrustingDown:Boolean = false;
		protected var xThrusterPower = 0.2;
		protected var yThrusterPower = 0.2;
		
		override protected function tick() {
			super.tick();
			
			if (thrustingRight) {
				//boxModelBody.SetLinearVelocity(new b2Vec2(0.01, 0));
				boxModelBody.SetSleepingAllowed(false);
				//boxModelBody.
				trace("setlinearvelocity...", boxModelBody.GetLinearVelocity().x,boxModelBody.GetInertia());
				boxModelBody.ApplyForce(new b2Vec2(boxModelBody.GetMass() / 1000, 0), boxModelBody.GetLocalCenter());
				//trace(boxModelBody.GetMass(),boxModelBody.GetLinearVelocity().x);
			}
			
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
