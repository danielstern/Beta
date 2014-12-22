package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class PropellableObject extends CollidableObject
	{
		protected var mass:Number = 10;
		protected var xInertia:Number = 0;
		protected var yInertia:Number = 0;
		protected var xVelocity:Number = 0;
		protected var yVelocity:Number = 0;
		
		protected var maxVelocityY:Number = 5;
		protected var maxVelocityX:Number = 5;
		
		public function PropellableObject() {
			super();			
		}
		
		public function applyForceX(x:Number) {
			xInertia += x;
		}
		
		public function applyForceY(y:Number) {
			yInertia += y;
		}
		
		override protected function tick() {
			super.tick();
			  
			xVelocity = xInertia / Math.pow(mass,2);
			yVelocity = yInertia / Math.pow(mass, 2);
			
			if (xVelocity > maxVelocityX) {
				xVelocity = maxVelocityX;
			} else if (xVelocity < -maxVelocityX) {
				xVelocity = -maxVelocityX;
			}
			
			if (yVelocity > maxVelocityY) {
				yVelocity = maxVelocityY;
			} else if (yVelocity < -maxVelocityY) {
				yVelocity = -maxVelocityY;
			}
			  
			x += xVelocity;
			y += yVelocity;
		}
	}
}


