package br.com.rectius.library.notificator
{
	import flash.display.DisplayObject;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	/**
	 *  Singleton pattern implementation that 
	 *  handles the notification messages.
	 * 
	 *  @author Pablo_Souza
	 * 
	 */
	public class NotificatorManager
	{
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  _instance
		//----------------------------------
		
		/**
		 *  @private
		 */
		private static var _instance:NotificatorManager;
		
		//----------------------------------
		//  notificator
		//----------------------------------
		
		/**
		 *  @private
		 */
		private var notificator:Notificator;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  The SingletonEnforcer class simulates a 
		 *  'private' class so that it can only be
		 *  instantiated inside NotificatorManager class. 
		 */
		public function NotificatorManager(enforcer:SingletonEnforcer)
		{
			if(enforcer == null)
				throw new Error("You cannot instantiate a Singleton class");
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  <p>Creates a top-level window with the notification 
		 *  message and places it above other windows in 
		 *  the z-order.</p>
		 * 
		 *  @param message The string that represents the notification message.
		 * 
		 *  @param type A constant variable of NotificatorMode class that represents 
		 *  the notification's type. <code>NotificatorMode.WARNING</code> (default).
		 * 
		 *  @param timer The milliseconds interval that the notification message will be visible.
		 * 
		 *  @langversion 3.0
		 */
		public static function show(message:String, type:String="warning", timer:Number=2500):void
		{
			if (_instance == null)
				_instance = new NotificatorManager(new SingletonEnforcer());
			
			if(_instance.notificator)
				PopUpManager.removePopUp(_instance.notificator);
			_instance.notificator = PopUpManager.createPopUp(DisplayObject(FlexGlobals.topLevelApplication), Notificator, false) as Notificator;
			if(timer)
			_instance.notificator.timeDestroy = timer;
			_instance.notificator.currentState = type;
			_instance.notificator.message = message;
			_instance.notificator.show();
		}
	}
}

/**
 *  The SingletonEnforcer class is available
 *  only to the NotificatorManager class.
 */
class SingletonEnforcer {}