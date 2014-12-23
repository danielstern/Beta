package beta
{
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class Debris extends ThornedObject
	{		
		public function Debris() {
			
			mass = 5;		
			killOffScreen = true;
			thorned = false;
			doesExplode = false;
			
			doAfter(100, kill);
			activate();
			
		
		}
		
	}
}


