package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class Bullet extends DestructibleObject
	{
		protected var damage = 10;
		
		public function Bullet() {
			super();
			stabilizersOff();
			maxVelocityX = 7;
			maxVelocityY = 7;
			mass = 0.2;		
			
			collisionType = 'friend';
			collidesWith = 'enemy';			
		}
		
		override protected function tick() {
		
			super.tick();
			if (isOffScreen) {
				kill();
			}
			
			//trace("Bullet tick.",collisions);
			if (collisions[0]) {
				trace("bullet collided with something", collisions);
				//collisions[0].takeDamage(damage);
				kill();
			}
			

			
			
		}
	}
}


