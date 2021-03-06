package beta.physics 
{
	import Box2D.Collision.b2Bound;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Collision.b2AABB;
	
	/**
	 * ...
	 * @author daniel
	 */
	public class BoxHelpers 
	{
		
		public function BoxHelpers() 
		{
			
		}
		
		public static function 	getFixturesThatFixtureCanSee(fixture:b2Fixture,range, precision = 100) {
			var fixtures = [];
			var body:b2Body = fixture.GetBody();
			var world = body.GetWorld();
			var position = getFixturePosition(fixture);
			var rayLength = range;
			var precision = precision;
			var raysCast = 0;
			
			while (raysCast++ <= precision) {
				
				var progress = Math.PI * 2 * (raysCast / precision);
				var outPointY = Math.cos(progress) * rayLength;
				var outPointX = Math.sin(progress) * rayLength;
				var outPoint = new b2Vec2(outPointX, outPointY);
				var fixture = world.RayCastOne(position, outPoint); 
				
				if (fixture) {
					fixtures.push(fixture);
					
				}		
				
			}
			
			return fixtures;
		}
		
		public static function getFixturePosition(fixture:b2Fixture) {
			var aabb = new b2AABB();
			var shape = fixture.GetShape();
			var body = fixture.GetBody();
			var transform = body.GetTransform()
			shape.ComputeAABB(aabb, transform);
			return aabb.GetCenter();
		}
		
		public static function getAngleToFacePoint(vantage,point) {
			var vector1 = vantage;
			var vector2 = point;
			var atan2 = Math.atan2;
			var angle = atan2(vector1.x - vector2.x, vector1.y - vector2.y);
			return angle;
		}
		
		public static function getPointAtAngleDistance(angle, distance) {
			var x = Math.cos(angle) * distance;
			var y = Math.sin(angle) * distance;
			return new b2Vec2(x,y);
		}
		
		public static function distanceTwoVectors(vector1, vector2) {
			var a = vector2.x - vector1.x;
			var b = vector2.y - vector1.y;
			var c = Math.sqrt(a * a + b * b);
			return c;
		}
	}

}