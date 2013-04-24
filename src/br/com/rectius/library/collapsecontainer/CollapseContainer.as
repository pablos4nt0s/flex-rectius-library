////////////////////////////////////////////////////////////////////////////////
//
//	COLLAPSECONTAINER COMPONENT
//
//  [01/21/2011] Pablo Souza
// 
//
////////////////////////////////////////////////////////////////////////////////

package br.com.rectius.library.collapsecontainer
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.core.IVisualElement;
	
	import spark.components.Group;
	import spark.components.SkinnableContainer;
	
	//--------------------------------------
	//  Events
	//--------------------------------------
	
	/**
	 *  Dispatched when the user wants to show 
	 *  the collapsed area.
	 *
	 *  @eventType flash.events.Event
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Event(name="openEvent", type="flash.events.Event")]
	
	/**
	 *  Dispatched when the user wants to hide 
	 *  the collapsed area.
	 *
	 *  @eventType flash.events.Event
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Event(name="closeEvent", type="flash.events.Event")]
	
	/**
	 *  Dispatched when the user wants to change the 
	 *  current mode of the component.
	 *
	 *  @eventType flash.events.Event
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[Event(name="modeChanged", type="flash.events.Event")]
	
	//--------------------------------------
	//  SkinStates
	//--------------------------------------
	
	/**
	 *  Open State of the component
	 * 
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[SkinState("open")]
	
	/**
	 *  Closed State of the component
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	[SkinState("closed")]
	
	/**
	 *  The CollapseContainer class defines two containers 
	 *  where one of them can has its content collapsed.
	 * 
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	public class CollapseContainer extends SkinnableContainer
	{
		
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 */
		private static const OPEN_EVENT:String = "openEvent";
		
		/**
		 *  @private
		 */
		private static const CLOSE_EVENT:String = "closeEvent";
		
		/**
		 *  @private
		 */
		private static const MODE_CHANGED_EVENT:String = "modeChanged";
		
		/**
		 *  @private
		 */
		private static const OPEN_MODE:String = "open";
		
		/**
		 *  @private
		 */
		private static const CLOSED_MODE:String = "closed";
		
		//--------------------------------------------------------------------------
		//
		//  Skin parts 
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  changeModeElement
		//----------------------------------
		
		[SkinPart(required="true")]
		
		/**
		 *  Defines the visual element used 
		 *  to alternate the component's mode.
		 */
		public var alternateMode:IVisualElement;
		
		//----------------------------------
		//  expandedContainerGroup
		//----------------------------------
		
		[SkinPart(required="true")]
		
		/**
		 *  Skin part that defines the container 
		 *  which cannot collapse.
		 */
		public var expandedContainerGroup:Group
		
		//----------------------------------
		//  collapsedContainerGroup
		//----------------------------------
		
		[SkinPart(required="true")]
		
		/**
		 *  Skin part that defines the container 
		 *  which can be collapsed.
		 */
		public var collapsedContainerGroup:Group;
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  expandedContainerChildren
		//----------------------------------
		
		[ArrayElementType("mx.core.IVisualElement")]
		
		/**
		 *  The set of components children to include in the expanded 
		 *  container. 
     	 *  The location and appearance of the expanded container is 
		 *  determined by its skin class.
		 * 
		 *  @default null
		 * 
		 *  @langversion 3.0
     	 *  @playerversion Flash 10
     	 *  @playerversion AIR 1.5
     	 *  @productversion Flex 4
		 */
		public var expandedContainerChildren:Array;
		
		//----------------------------------
		//  collapsedContainerChildren
		//----------------------------------
		
		[ArrayElementType("mx.core.IVisualElement")]
		
		/**
		 *  The set of components children to include in the collapsed 
		 *  container area. 
		 *  The location and appearance of the container is 
		 *  determined by its skin class.
		 * 
		 *  @default null
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public var collapsedContainerChildren:Array;
		
		//----------------------------------
		//  mode
		//----------------------------------
		
		/**
		 *  @private
		 */
		private var _mode:String;
		
		[Inspectable(enumeration="open,closed")]
		[Bindable(MODE_CHANGED_EVENT)]
		
		/**
		 *  Defines the current mode of the collapse container.
		 * 
		 *  @langversion 3.0
     	 *  @playerversion Flash 10
 		 *  @playerversion AIR 1.5
     	 *  @productversion Flex 4 
		 */
		public function get mode():String
		{
			return _mode;
		}
		
		/**
		 *  @private
		 */
		public function set mode(value:String):void
		{
			if(value == mode)
				return;
			
			if(value == OPEN_MODE)
			{
				_mode = value;
				dispatchEvent(new Event(MODE_CHANGED_EVENT));
				dispatchEvent(new Event(OPEN_EVENT));
			}
			else if(value == CLOSED_MODE)
			{
				_mode = value;	
				dispatchEvent(new Event(MODE_CHANGED_EVENT));
				dispatchEvent(new Event(CLOSE_EVENT));
			}
			invalidateSkinState();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Set the component mode to open.
		 * 
		 *  @langversion 3.0
     	 *  @playerversion Flash 10
 		 *  @playerversion AIR 1.5
     	 *  @productversion Flex 4
		 */
		public function open():void
		{
			mode = OPEN_MODE;
		}
		
		/**
		 *  Set the component mode to closed.
		 * 
		 *  @langversion 3.0
     	 *  @playerversion Flash 10
 		 *  @playerversion AIR 1.5
     	 *  @productversion Flex 4
		 */
		public function close():void
		{
			mode = CLOSED_MODE;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 */
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			if(instance == alternateMode)
			{
				alternateMode.addEventListener(MouseEvent.CLICK, changeModeElement_handler);
			}
		}
		
		/**
		 *  @private
		 */
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			if(instance == alternateMode)
			{
				alternateMode.removeEventListener(MouseEvent.CLICK, changeModeElement_handler);
			}
		}
		
		/**
		 *  @private
		 */
		override protected function createChildren():void
		{
			super.createChildren();
			
			for each(var expandedElement:IVisualElement in expandedContainerChildren)
			{
				expandedContainerGroup.addElement(expandedElement);
			}
			
			for each(var collapsedElement:IVisualElement in collapsedContainerChildren)
			{
				collapsedContainerGroup.addElement(collapsedElement);
			}
		}
		
		/**
		 *  @private
		 */
		override protected function getCurrentSkinState():String
		{
			if(enabled == false)
			{
				return super.getCurrentSkinState();
			}
			else if (mode == OPEN_MODE)
			{
				return OPEN_MODE;
			}
			else
			{
				return CLOSED_MODE;
			}
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
		private function changeModeElement_handler(event:MouseEvent):void
		{
			if(mode == OPEN_MODE)
			{
				close();
			}
			else
			{
				open();
			}
			invalidateDisplayList();
		}
	}
}