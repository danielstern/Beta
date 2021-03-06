package beta.models 
{
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2World;
	import flash.utils.setTimeout;
	
	import Box2D.Collision.b2AABB;
	import Box2D.Collision.b2Bound;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2World;
	import Box2D.Dynamics.Joints.b2DistanceJointDef;
	import Box2D.Dynamics.Joints.b2Joint;
	import Box2D.Dynamics.Joints.b2LineJoint;
	import Box2D.Dynamics.Joints.b2LineJointDef;
	import Box2D.Dynamics.Joints.b2PrismaticJoint;
	import Box2D.Dynamics.Joints.b2PrismaticJointDef;
	import Box2D.Dynamics.Joints.b2RevoluteJointDef;
	import flash.display.MovieClip;
	import flash.sampler.NewObjectSample;
	import flash.utils.setInterval;
	
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2EdgeShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	/**
	 * ...
	 * @author daniel
	 */
	public class MoonLanderModel 
	{
		private var _world:b2World;
		public var joints = [];
		
		public var bodies = [];
		public var footWidth = 2;
		private var destroyed = false;
		private var _position:b2Vec2;
		
		public var pod:b2Body;
		public var chassis:b2Body;
		public var sBand:b2Body;
		public var radar:b2Body;
		public var antenna:b2Body;
		
		public var leftPad:b2Body;
		public var leftUpperLeft:b2Body;
		public var leftLowerLeg:b2Body;
		public var leftWing:b2Body;
		
		public var rightPad:b2Body;
		public var rightUpperLeft:b2Body;
		public var rightLowerLeg:b2Body;
		public var rightWing:b2Body;
		
		public function MoonLanderModel(world,position) 
		{
			_position = position;
			_world = world;
			
			var fuelCompartment:b2Body = getFuelCompartment();
			bodies.push(fuelCompartment);
			
			attachPodToChassis(fuelCompartment);			
			attachLegToChassis(fuelCompartment);
			attachLegToChassis(fuelCompartment, true);
			
			chassis = fuelCompartment;
			if (position) {
				move(position);
			}
			
		}
		
		public function getMinX() {
			return leftPad.GetPosition().x - footWidth / 2;
		}
		public function getMaxX() {
			return rightPad.GetPosition().x + footWidth / 2;
		}
		
		public function move(position) {
			bodies.forEach(function(body) {
				var currentPosition = body.GetPosition();
				currentPosition.Add(position);
				body.SetPosition(currentPosition);
			})
		}
		
		public function createLightSteelCircularComponent(radius) {
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;
			bodyDef.linearDamping = 0;
			var body:b2Body = _world.CreateBody(bodyDef);
			var bodyFixture = getLightSteelCircleFixtureDefinition(radius);
			body.CreateFixture(bodyFixture);
			bodies.push(body);
			
			return body;
			
		}
		
		public function createLightSteelRodComponent(length ) {
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;
			//bodyDef.
			bodyDef.linearDamping = 0;
			var body:b2Body = _world.CreateBody(bodyDef);
			var bodyFixture = getLightSteelRodFixtureDefinition(length);
			body.CreateFixture(bodyFixture);
			bodies.push(body);
			
			return body;
			
		}
		
		public function createStandardSuspension(bodyA, bodyB, vector, anchorA = null, anchorB = null) {
			var suspensionJointDef:b2PrismaticJointDef = new b2PrismaticJointDef();
			
			suspensionJointDef.Initialize(bodyA, bodyB, new b2Vec2(0,0), vector);
			suspensionJointDef.enableLimit = true;
			suspensionJointDef.lowerTranslation = 2;
			suspensionJointDef.upperTranslation = 3;
			//
			if (anchorA) {
				suspensionJointDef.localAnchorA = anchorA;
			}
			
			if (anchorB) {
				suspensionJointDef.localAnchorB = anchorB;
			}
			
			
			var suspensionJoint = _world.CreateJoint(suspensionJointDef);
			joints.push(suspensionJoint);
			return suspensionJoint;
		}
		
		public function attachPodToChassis(fuelCompartment) {
			var podBody = createLightSteelCircularComponent(3);
			var podFuelJoint = createStandardSuspension(podBody, fuelCompartment , new b2Vec2(0, 1), new b2Vec2(0, 3.5));
			
			pod = podBody;
			
			antenna = createLightSteelCircularComponent(0.6);
			var antennaJoint = createStandardSuspension(podBody, antenna, new b2Vec2(0, -1), new b2Vec2(0, -3));
			
			
						
			sBand = createLightSteelCircularComponent(0.9);
			var sBandJoint = createStandardSuspension(podBody,sBand,new b2Vec2(-0.7,-0.7),new b2Vec2(-3.5, 0));
			
			
			radar = createLightSteelCircularComponent(0.8);
			var radarPodJoint = createStandardSuspension(podBody, radar, new b2Vec2(1,0),new b2Vec2(3,0));
			
			
		}
		
		public function bindAtFixedRotation(bodyA, bodyB, localAnchorA, localAnchorB, rotationLower = 0,rotationUpper = 0) {
			var revoluteJointDef:b2RevoluteJointDef = new b2RevoluteJointDef();
			revoluteJointDef.Initialize(bodyA, bodyB, getZeroVector());
			revoluteJointDef.localAnchorA = localAnchorA;
			revoluteJointDef.localAnchorB = localAnchorB;
			revoluteJointDef.enableLimit = true;
			revoluteJointDef.upperAngle = rotationLower;
			revoluteJointDef.lowerAngle = rotationUpper;
			var revoluteJoint = _world.CreateJoint(revoluteJointDef);
			joints.push(revoluteJoint);
			
			return revoluteJoint;
		}
		
		public function getZeroVector() {
			return new b2Vec2(0, 0);
		}
		
		public function plusOrMinusRandom(number) {
			return Math.random() * number * 2 - number;
		}
		
		public function explode() {
			if (destroyed) return;
			var debrisCount = 35;
			var debrisForce = 0.01;
			for (var i = 0; i < debrisCount; i++) {
				var debris:b2Body = createLightSteelCircularComponent(Math.random()*0.2+0.05);
				var explosionCenter = chassis.GetPosition();
				debris.SetPosition(new b2Vec2(explosionCenter.x + plusOrMinusRandom(2), explosionCenter.y - 3 + plusOrMinusRandom(2)));; 
				debris.ApplyForce(new b2Vec2(plusOrMinusRandom(debrisForce), plusOrMinusRandom(debrisForce)), debris.GetWorldCenter());
				
			};
			joints.forEach(function(_joint,index) {
				_world.DestroyJoint(_joint);
			});
			destroyed = true;
			
			setTimeout(function() {
				bodies.forEach(function(a) {
					_world.DestroyBody(a);
				});
			},3500);
		}
			
		public function attachLegToChassis(fuelCompartment:b2Body, _mirror = false) {
			var mirror:Number = _mirror ? -1 : 1;
			var ZERO = 0;
			var FORTY_FIVE_DEGREES = -Math.PI / 4 * mirror;
			var SIXTY_SEVEN_DEGREES = -Math.PI / 3 * mirror;
			var NINETY_DEGREES = -Math.PI / 2 * mirror;
			
			var chassisWidth:Number = 4;
			var chassisHeight:Number = 2;
			
			
			var femurLength:Number = 1;
			var tibiaLength:Number = 3;
			var wingLength = 1.5;
			
			
			var femur:b2Body = createLightSteelRodComponent(femurLength);		
			var wing:b2Body = createLightSteelRodComponent(wingLength);
			var tibia:b2Body = createLightSteelRodComponent(tibiaLength);
			var foot:b2Body = getLandingPad();		
			if (!_mirror) {
				leftPad = foot;
				leftWing = wing;
				leftLowerLeg = femur;
				leftUpperLeft = tibia;
			} else {
				rightPad = foot;
				rightWing = wing;
				rightLowerLeg = femur;
				rightUpperLeft = tibia;
			}
			
			
			
			tibia.SetAngle(NINETY_DEGREES);
			tibia.SetPosition(new b2Vec2(( -chassisWidth - femurLength) * mirror, ZERO));
			foot.SetPosition(new b2Vec2(( -chassisWidth - femurLength) * mirror, tibiaLength));
			//wing.SetAngle(FORTY_FIVE_DEGREES);
		
			var shoulderJoint = bindAtFixedRotation(fuelCompartment, femur, new b2Vec2( -chassisWidth * mirror, -chassisHeight), new b2Vec2( femurLength * mirror, ZERO));
			var bodyWingJoint = bindAtFixedRotation(fuelCompartment, wing, new b2Vec2( -chassisWidth * mirror, chassisHeight), new b2Vec2( wingLength * mirror, ZERO), FORTY_FIVE_DEGREES , FORTY_FIVE_DEGREES );
			var elbowJoint = bindAtFixedRotation(femur, tibia, new b2Vec2( -femurLength * mirror, ZERO), new b2Vec2(tibiaLength * mirror, ZERO), ZERO, ZERO);
			var ankleJoint = bindAtFixedRotation(tibia, wing, new b2Vec2( -tibiaLength * mirror, ZERO), new b2Vec2( -wingLength * mirror, ZERO), -FORTY_FIVE_DEGREES , -FORTY_FIVE_DEGREES );
			var heelJoint2 = bindAtFixedRotation(tibia, foot, new b2Vec2( -tibiaLength * mirror, ZERO), getZeroVector(), NINETY_DEGREES,NINETY_DEGREES);
			
			
		
			
		}
		
		public function getLandingPad():b2Body {
			var footBodyDef:b2BodyDef = new b2BodyDef();
			footBodyDef.type = b2Body.b2_dynamicBody;
			var footBody:b2Body = _world.CreateBody(footBodyDef);
			
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			var polygonShape:b2PolygonShape = new b2PolygonShape();
			polygonShape.SetAsBox(footWidth, 1);
			fixtureDef.shape = polygonShape;
			fixtureDef.restitution = 0.3;
			fixtureDef.friction 1;
			fixtureDef.filter.categoryBits = 0x0001;
			fixtureDef.filter.maskBits = 0x0010;
			fixtureDef.density = 0.1;
			footBody.CreateFixture(fixtureDef);
			
			bodies.push(footBody);
			
			return footBody;
		}
		
		
		public function getLightSteelCircleFixtureDefinition(radius:Number) {
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density = 0.1;
			fixtureDef.restitution = 0.2;
			fixtureDef.friction = 0.1;
			fixtureDef.filter.categoryBits = 0x0001;
			fixtureDef.filter.maskBits = 0x0010;
			fixtureDef.shape = new b2CircleShape(radius);
			return fixtureDef;	
		}
		
				
		public function getLightSteelRodFixtureDefinition(length:Number) {
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density = 0.1;
			fixtureDef.restitution = 0.2;
			fixtureDef.friction = 0.1;
			fixtureDef.filter.categoryBits = 0x0001;
			fixtureDef.filter.maskBits = 0x0010;
			var polygon:b2PolygonShape = new b2PolygonShape();
			polygon.SetAsBox(length, 0.5);
			fixtureDef.shape = polygon;
			return fixtureDef;	
		}
		
		public function getFuelCompartment() {
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;
			bodyDef.linearDamping = 0;
			var body:b2Body = _world.CreateBody(bodyDef);
			
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			var polygonShape:b2PolygonShape = new b2PolygonShape();
			polygonShape.SetAsBox(4, 2);
			fixtureDef.shape = polygonShape;
			fixtureDef.restitution = 0.1;
			fixtureDef.friction 0.2;
			fixtureDef.density = 0.2;
			body.CreateFixture(fixtureDef);
			
			return body;
		}
		
	}

}