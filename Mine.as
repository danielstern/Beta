package beta
{
	import flash.display.*;
	import beta.core.*;
	import flash.geom.*;
	
	public class Mine extends EnemyStaticObject
	{
		public static var NAME = "mine";
		public function Mine() {
			super();
						
			health = 5;
			damage = 5;
			mass = 40;
			
			expireOnDamageDeal = true;
			
			doesExplode = true;
			explosionType = 'mine';
			
			applyForceX(-1000);
			killOffScreen = true;
			
			
			explosionParticleCount = 6;
			name = NAME;
			
		}
		
		override protected function explode() {
			
			var bullets = 4;
			for (var i = 0; i < bullets; i++) {
				var bullet = new EnemyBullet();
				stage.addChild(bullet);
				var angleRadians = 2 * Math.PI * (i + 1) / bullets + 1/4*Math.PI;
								
				var pos = entity.localToGlobal(new Point());
				bullet.x = pos.x;
				bullet.y = pos.y;
				
				var xForce = Math.cos(angleRadians) / 10;
				var yForce = Math.sin(angleRadians) / 10;
				
				bullet.applyForceX(xForce);
				bullet.applyForceY(yForce);
			}
			
			super.explode();

		}
	}
}


