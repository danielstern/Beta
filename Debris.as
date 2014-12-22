package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class Debris extends ThornedObject
	{		
		public function Debris() {
			super();
			stabilizersOff();
			mass = 5;		
			//damage = 0;
			killOffScreen = true;
			collidesWith = 'none';
			collisionType = 0;
			thorned = false;
			doesExplode = false;
			
			doAfter(100, kill);
		}
		
	}
}


