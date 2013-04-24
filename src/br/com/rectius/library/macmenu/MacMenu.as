////////////////////////////////////////////////////////////////////////////////
//
//	MACMENU COMPONENT
//
//  [07/13/2011] Pablo Souza
// 
//
////////////////////////////////////////////////////////////////////////////////

package br.com.rectius.library.macmenu
{
	import flash.events.MouseEvent;
	
	import mx.core.IVisualElement;
	import mx.geom.TransformOffsets;
	import mx.states.Transition;
	
	import spark.components.Group;
	import spark.components.SkinnableContainer;
	import spark.effects.Animate;
	import spark.effects.Resize;
	import spark.effects.animation.MotionPath;
	import spark.effects.animation.SimpleMotionPath;
	

	/**
	 *  The MacMenu class defines an area 
	 *  to show items in the menu.
	 * 
	 *  @langversion 3.0
	 *  @playerversion Flash 10
	 *  @playerversion AIR 1.5
	 *  @productversion Flex 4
	 */
	public class MacMenu extends SkinnableContainer
	{
		
		//--------------------------------------------------------------------------
		//
		//  Skin parts 
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  menuGroup
		//----------------------------------
		
		[SkinPart(required="true")]
		
		/**
		 *  Skin part that defines the container 
		 *  that holds the menu items.
		 */
		public var menuGroup:Group
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  menuChildren
		//----------------------------------
		
		[ArrayElementType("mx.core.IVisualElement")]
		
		/**
		 *  The set of components children to include in the menu. 
		 *  The location and appearance of the menu container is 
		 *  determined by its skin class.
		 * 
		 *  @default null
		 * 
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public var items:Array;
		

		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			for each(var item:IVisualElement in items) 
			{
				menuGroup.addElement(item);
			}
		}
		
	}
}