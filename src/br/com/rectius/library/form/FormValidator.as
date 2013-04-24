package br.com.rectius.library.form
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.events.ValidationResultEvent;
	import mx.validators.IValidator;
	import mx.validators.Validator;
	
	[Bindable]
	public class FormValidator extends EventDispatcher
	{
		public var formIsValid:Boolean = false;
		
		public var validators:Array;
		private var focusedFormControl:DisplayObject;
		
		public function FormValidator(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function validateForm(event:Event):void
		{
			focusedFormControl = event.target as DisplayObject;
			formIsValid = true;
			
			Validator.validateAll(validators);
			
			for each(var validator:IValidator in validators)
				validate(validator);
		}
		
		private function validate(validator:IValidator):Boolean
		{
			var validatorSource:DisplayObject = validator["source"] as DisplayObject;
			var supressEvents:Boolean = validatorSource != focusedFormControl;
			var event:ValidationResultEvent = validator.validate(null, supressEvents)
			var currentControlIsValid:Boolean = event.type == ValidationResultEvent.VALID;
			
			formIsValid = formIsValid && currentControlIsValid;
			return currentControlIsValid;
		}
	}
}