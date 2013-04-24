package br.com.rectius.library.macmenu.event
{
	import flash.events.Event;
	
	public class MacMenuEvent extends Event
	{
		public static var ITEM_CLICK_EVENT:String = "itemClickEvent";
		public var code:int = 0;
		
		public function MacMenuEvent(code:int, type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.code = code;
		}
	}
}