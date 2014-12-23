package beta.units {
	import beta.components.Gun;
	public class EnemyBasicAttackingShip extends EnemyCurvyThrusterShip
	{
		protected var attackFrequency = 100;
		protected var timeSinceLastAttack = 0;
		protected var attacks = false;
		public function EnemyBasicAttackingShip() {
			super();
			
			//addGun();
			attacks = true;
			enemyAICurves = false;
			addGuns();
		
		}
		
		protected function addGuns() {
			var gun:Gun = addGun();
			gun.orientation = 180;
		}
		
		override protected function tick() {
			super.tick();
			timeSinceLastAttack += 1;
			if (timeSinceLastAttack === attackFrequency) {
				timeSinceLastAttack = 0;
				if (attacks) {
					gunsStartFiring();
				}
			}
		}
		
		override protected function getGun() {
			return new EnemyGun();
		}
	}
}


