package beta.units.enemies {

	import beta.components.bullets.Bullet;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2World;
	import flash.geom.Point;
	
	public class Mine extends Enemy
	{
		public static var NAME = "mine";
		public function Mine(world:b2World) {
			super(world);
						
			health = 5;
			damage = 5;
			
			expireOnDamageDeal = true;
			
			doesExplode = true;
			explosionType = 'mine';
			
			applyForceX(-0.01);
			killOffScreen = true;
			
			explosionParticleCount = 4;
			name = NAME;
			
		}
		
		override protected function getDebris() {
			var bullet:Bullet = new Bullet(world);
			bullet.collidesWith = 'friend';
			return bullet;
		}
		
		override protected function getDebrisVector(i):b2Vec2 {
			
			var angleRadians = 2 * Math.PI * (i + 1) / explosionParticleCount + 1 / 4 * Math.PI;
			
			var xForce = Math.cos(angleRadians) * 0.01;
			var yForce = Math.sin(angleRadians) * 0.01;
			return new b2Vec2(xForce,yForce);
			
		}
	}
}


