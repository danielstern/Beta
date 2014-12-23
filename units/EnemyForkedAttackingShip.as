package beta.units {
	
	public class EnemyForkedAttackingShip extends EnemyBasicAttackingShip
	{
		public function EnemyForkedAttackingShip() {
			super();		
			maxVelocityX = 0.2;
		}
		
		override protected function addGuns() {
			
			var gun1 = addGun();
			var gun2 = addGun();
			gun1.orientation = 135;
			gun2.orientation = 215;
			gun1.y = -3;
			gun2.y = 3;
		}
		
	}
}


