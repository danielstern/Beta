package beta.units {
	import beta.components.Gun;
	
	public class EnemyGun extends Gun
	{
		public static var NAME = "enemyGun";
		public function EnemyGun() {
			super();
			cooldownTime = 100;			
			name = NAME;
		}
		
		
		override protected function getBullet() {
			trace("Enemy firing bullet");
			return new EnemyBullet();			
			
		}
	}
}


