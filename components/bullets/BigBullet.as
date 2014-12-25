package beta.components.bullets {
	import Box2D.Common.Math.b2Vec2;
	public class BigBullet extends Bullet 
	{
		
		
		public function BigBullet(world) 
		{
			super(world);
			damage = 25;
			
		}
		
		override protected function addBulletFixtures() {
			addBoxModelCircleFixture(0.35, new b2Vec2(0, 0));
		}
		
		
	}

}