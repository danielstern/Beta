package beta.displays {
	
	import beta.core.ControllableObject;
	import Box2D.Common.Math.*;
	import Box2D.Dynamics.*;
	
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.utils.setInterval;
	
	public class DebugDisplay extends MovieClip
	{	
		private var projector:MovieClip;
		private var _focus:b2Vec2;
		private var _zoom;
		private var _scale;
		private var _screenWidth;
		private var _screenHeight;
		public function DebugDisplay(world:b2World,scale = 30,screenWidth = 650,screenHeight = 500) 
		{
			_scale = scale;
			_screenHeight = screenHeight;
			_screenWidth = screenWidth;
			var square:Shape = new Shape();
			square.graphics.lineStyle(1, 0x000000); 
			square.graphics.beginFill(0x0000ff); 
			square.graphics.drawRect(0, 0, screenWidth, screenHeight); 
			square.graphics.endFill(); 
			addChild(square);
			
			projector = new MovieClip();
			addChild(projector);
			projector.mask = square;
			var debug:b2DebugDraw = new b2DebugDraw();
			debug.SetSprite(projector);
			debug.SetDrawScale(scale);
			debug.SetAlpha(1);
			debug.SetFillAlpha(1);
			debug.SetLineThickness(1);
			//debug.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit | b2DebugDraw.e_aabbBit | b2DebugDraw.e_pairBit | b2DebugDraw.e_centerOfMassBit);
			debug.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit);
			world.SetDebugDraw(debug);
			
			setInterval(world.DrawDebugData, 1);

			
		}
		
		public function setZoom(zoom) {
			_zoom = zoom;
			
			update();
			
		}
		
		public function setFocus(focus) {
			_focus = focus;
			update();
			
			//projector.x = -focus.x * 2 * _scale;
			//projector.y = -focus.y / 2 * _scale;
		
			//projector.y = - (_screenHeight / 2) + focus.y /2;
		}
		
		public function update() {
			projector.scaleX = _zoom;
			projector.scaleY = _zoom;
			
			//projector.x = (_screenWidth / 2);
			if (_focus) {
				projector.y = -_focus.y * _zoom + _screenHeight / 2;
				projector.x = -_focus.x * _zoom + _screenWidth / 2;
			} else {
				//projector.x = _screenHeight / 2;
				//projector.y = _screenWidth / 2;
			}
			
			
		}
		

	}
}