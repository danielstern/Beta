package beta
{
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class BasicHeroShip extends Gunship
	{
		public function BasicHeroShip() {
			super();
			/*
			 */
			var gun1 = addGun();
			var gun2 = addGun();
			
			gun1.y = -3;
			gun2.y = 3;
			
			gun1.orientation = 0;
			gun2.orientation = 0;
			
			//orientation = 90;
			
			constrainToScreen = true;
			doesExplode = true;
			explosionParticleCount = 25;
			
		
		}
		
		override protected function kill() {
			super.kill();
			trace("Killed main hsip.");
		}
	}
}


