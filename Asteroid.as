package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class Asteroid extends DestructibleObject
	{
		protected var damage = 4;
		public function Asteroid() {
			super();
			collisionType = 'enemy';
			collidesWith = 'friend';
			applyForceX(-100);
			stabilizersOff();
		}
		
		override protected function tick() {
		
			super.tick();
			if (isOffScreen) {
				kill();
			}
			
			//trace("asteroid tick", collisions);
			
			if (collisions[0]) {
				trace("astreroid collided with something", collisions);
				//collisions[0].takeDamage(damage);
				//kill();
			}
			
		}
	}
}


