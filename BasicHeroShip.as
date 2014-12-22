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
			
		
		}
	}
}


