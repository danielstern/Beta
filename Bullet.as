package beta
{
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class Bullet extends ThornedObject
	{		
		public function Bullet() {
			
			super();
			
			maxVelocityX = 7;
			maxVelocityY = 7;
			mass = 0.2;		
			
			expireOnDamageDeal = true;
			killOffScreen = true;
			damage = 10;
		}
		
		override protected function kill() {
			
			super.kill();
		}
		
	}
	
	
}


