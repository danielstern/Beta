package beta
{
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class Gunship extends Ship
	{
		protected var guns = [];
		public function Gunship() {
			super();
			mass += 0.2;
			stabilizersEnabled = true;
			
		
		}
		
		public function addGun() {
			var gun = new Gun();
			addChild(gun);
			guns.push(gun);
			return gun;
		}
		
		override protected function tick() {
			super.tick();
			
			
			
			if (controlsAction1) {
				turnWhite();
				guns.forEach(function(gun) {
					gun.startFiring();
				});
			} else {
				clearFilters();
				guns.forEach(function(gun) {
					gun.stopFiring();
				});
			}
			
		}
	}
}


