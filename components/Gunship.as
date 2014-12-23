package beta.components {
	
	public class Gunship extends Ship
	{
		protected var guns = [];
		public function Gunship() {
			super();
			mass += 0.2;
			stabilizersEnabled = true;
			
		
		}
		
		public function addGun() {
			var gun = getGun();
			addChild(gun);
			guns.push(gun);
			return gun;
		}
		
		protected function getGun() {
			return new Gun();
		}
		
		protected function gunsStartFiring() {
			guns.forEach(function(gun) {
				gun.startFiring();
			});
		}
		
		override protected function tick() {
			super.tick();			
			
			if (controlsAction1) {
				turnWhite();
				gunsStartFiring();
			} else {
				clearFilters();
				guns.forEach(function(gun) {
					gun.stopFiring();
				});
			}
			
		}
	}
}


