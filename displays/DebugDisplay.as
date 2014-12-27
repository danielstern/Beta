package beta.displays {
	
	import beta.core.ControllableObject;
	import Box2D.Common.Math.*;
	import Box2D.Dynamics.*;
	import com.kircode.EasyKeyboard.*;
	import flash.display.*;
	import flash.utils.setInterval;
	
	public class DebugDisplay extends MovieClip
	{
		public var scale = 30;
		
		public function DebugDisplay(world:b2World) 
		{
			
			var debug:b2DebugDraw = new b2DebugDraw();
			debug.SetSprite(this);
			debug.SetDrawScale(scale);
			debug.SetAlpha(1);
			debug.SetFillAlpha(1);
			debug.SetLineThickness(1);
			debug.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit | b2DebugDraw.e_aabbBit | b2DebugDraw.e_pairBit | b2DebugDraw.e_centerOfMassBit);
			world.SetDebugDraw(debug);
			
			setInterval(world.DrawDebugData, 1);

			
		}
		
		public function WASDControl(stage, controllableObject) {
			var keyboard = new EasyKeyboard(stage);		
			
			keyboard.addEasyListener("W", controllableObject.startUp, controllableObject.stopUp);
			keyboard.addEasyListener("A", controllableObject.startLeft, controllableObject.stopLeft);
			keyboard.addEasyListener("S", controllableObject.startDown, controllableObject.stopDown);
			keyboard.addEasyListener("D", controllableObject.startRight, controllableObject.stopRight);
			keyboard.addListener(32, controllableObject.startAction1, controllableObject.stopAction1);
			
		}
	}
}