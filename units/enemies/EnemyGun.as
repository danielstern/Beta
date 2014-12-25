package beta.units.enemies {
	import beta.components.guns.Gun;
	
	public class EnemyGun extends Gun
	{
		public static var NAME = "enemyGun";
		public function EnemyGun(ship) {
			super(ship);
			cooldownTime = 100;			
			name = NAME;
		}
		
		
		override protected function getBullet() {
			return new EnemyBullet(world);			
		}
	}
}


