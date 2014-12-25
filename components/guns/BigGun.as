package beta.components.guns {
	import beta.components.bullets.*;
	
	public class BigGun extends SmartGun 
	{
		
		public function BigGun(world) 
		{
			super(world);
			cooldownTime = 799;
			trackTarget = false;
			
		}
		
			
		override protected function getBullet() {
			return new BigBullet(world);			
		}
		
	}

}