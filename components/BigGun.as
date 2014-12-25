package beta.components 
{
	/**
	 * ...
	 * @author daniel
	 */
	public class BigGun extends Gun 
	{
		
		public function BigGun(world) 
		{
			super(world);
			cooldownTime = 799;
			
		}
		
			
		override protected function getBullet() {
			return new BigBullet(world);			
		}
		
	}

}