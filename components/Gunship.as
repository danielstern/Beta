package beta.components {
	
	public class Gunship extends Ship
	{
		protected var guns = [];
		public function Gunship(world) {
			super(world);
			mass += 0.2;
			stabilizersEnabled = true;
			
		
		}
		
		public function addGun() {
			var gun = getGun();
			//parent.addChild(gun);
			guns.push(gun);
			return gun;
		}
		
		protected function getGun() {
			return new Gun(this);
		}
		
		protected function gunsStartFiring() {
			guns.forEach(function(gun) {
				gun.startFiring();
			});
		}
		
		protected function gunsStopFiring() {
			guns.forEach(function(gun) {
				gun.stopFiring();
			});
		}
		
		override protected function tick() {
			super.tick();			
			
			if (controlsAction1) {
				//turnWhite();
				gunsStartFiring();
			} else {
				//clearFilters();
				gunsStopFiring();
			}
			
		}
	}
}


