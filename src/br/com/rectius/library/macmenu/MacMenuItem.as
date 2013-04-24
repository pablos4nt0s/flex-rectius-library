package br.com.rectius.library.macmenu
{
	import br.com.rectius.library.macmenu.event.MacMenuEvent;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Image;
	import mx.events.FlexEvent;
	import mx.geom.TransformOffsets;
	
	import spark.components.Group;
	import spark.effects.Animate;
	import spark.effects.animation.MotionPath;
	import spark.effects.animation.SimpleMotionPath;
	
	//--------------------------------------
	//  Events
	//--------------------------------------
	
	/**
	 *
	 *
	 *  @eventType flash.events.Event
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Event(name="itemClickEvent", type="br.com.rectius.library.macmenu.event.MacMenuEvent")]

	/**
	 *  The MacMenuItem class defines the 
	 *  MacMenu items.
	 * 
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	public class MacMenuItem extends Group
	{
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  image
		//----------------------------------
		
		private var image:Image = new Image();
		
		public function MacMenuItem() {
			this.addElement(image);
			this.useHandCursor = true;
			this.buttonMode = true;
			this.addEventListener(MouseEvent.CLICK, onClickHandler);
			this.addEventListener(MouseEvent.ROLL_OVER, itemRollOverHanlder);
			this.addEventListener(MouseEvent.ROLL_OUT, itemRollOutHanlder);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Handler methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 *  Alternates the current mode of the component.
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		private function itemRollOverHanlder(event:MouseEvent):void
		{
			this.depth = 1;
			
			var motions:Vector.<MotionPath> = new Vector.<MotionPath>[ 
				new SimpleMotionPath("scaleX", 1, 2),
				new SimpleMotionPath("scaleY", 1, 2),
				new SimpleMotionPath("x", 0, -40),
				new SimpleMotionPath("y", 0, -40) 
			];
			
			var offsets:TransformOffsets = new TransformOffsets();
			offsets.x = -40;
			offsets.y = -40;
			offsets.scaleX = 2;
			offsets.scaleY = 2;
			postLayoutTransformOffsets = offsets;
			
			var animation:Animate = new Animate();
			animation.duration = 200;
			animation.motionPaths = motions;
			animation.play([offsets]);
			
			invalidateDisplayList();
		}
		
		/**
		 *  @private
		 *  Alternates the current mode of the component.
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		private function itemRollOutHanlder(event:MouseEvent):void
		{
			this.depth = 0;
			
			var motions:Vector.<MotionPath> = new Vector.<MotionPath>[ 
				new SimpleMotionPath("scaleX", 2, 1),
				new SimpleMotionPath("scaleY", 2, 1),
				new SimpleMotionPath("x", -40, 0),
				new SimpleMotionPath("y", -40, 0) 
			];
			
			var offsets:TransformOffsets = new TransformOffsets();
			postLayoutTransformOffsets = offsets;
			
			var animation:Animate = new Animate();
			animation.duration = 200;
			animation.motionPaths = motions;
			animation.play();
			
			invalidateDisplayList();
		}
		
		private function onCreationCompleteHandler(event:FlexEvent):void {
		}
		
		private function onClickHandler(event:MouseEvent):void {
			dispatchEvent(new MacMenuEvent(this.code, MacMenuEvent.ITEM_CLICK_EVENT));
		}
		
		public function set icon(value:Object):void {
			if(image && value)
				image.source = value;
		}
		
		private var _code:int;
		[Bindable]
		public function get code():int {
			return this._code; 
		}
		public function set code(code:int):void {
			this._code = code;	
		}
		
	}
}