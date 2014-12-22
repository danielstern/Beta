package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class Gunship extends Ship
	{
		protected var guns = [];
		public function Gunship() {
			super();
			mass += 0.2;
			
			var gun = new Gun();
			addChild(gun);
			guns.push(gun);
		}
		
		override protected function tick() {
			super.tick();
			
			if (controlsAction1) {
				guns.forEach(function(gun) {
					gun.startFiring();
				});
			} else {
				guns.forEach(function(gun) {
					gun.stopFiring();
				});
			}
			
		}
	}
}


