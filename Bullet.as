package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class Bullet extends ThornedObject
	{		
		public function Bullet() {
			super();
			stabilizersOff();
			maxVelocityX = 7;
			maxVelocityY = 7;
			mass = 0.2;		
			
			expireOnDamageDeal = true;
			damage = 10;
		}
		
		override protected function tick() {
		
			super.tick();			
			
		}
	}
}


