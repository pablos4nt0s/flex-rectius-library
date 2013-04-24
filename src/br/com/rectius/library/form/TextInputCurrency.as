package br.com.rectius.library.form
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	
	import mx.formatters.CurrencyFormatter;
	import mx.utils.StringUtil;
	
	import spark.components.TextInput;
	
	/**
	 *  Currency TextInput component
	 *
	 */
	public class TextInputCurrency extends TextInput
	{
		private var _value:Number;
		
		public function set value(value:Number):void
		{
			_value = value;
			dispatchEvent(new Event("valueChange"));
		}
		
		public function get value():Number
		{
			return _value;
		}
		
		private var _formatter:CurrencyFormatter;
		
		public function set formatter(value:CurrencyFormatter):void
		{
			_formatter = value;
		}
		public function get formatter():CurrencyFormatter
		{
			return _formatter;
		}
		
		public function TextInputCurrency()
		{
			super();
			
			formatter = new CurrencyFormatter();
			formatter.currencySymbol = "";
			formatter.decimalSeparatorTo = ",";
			formatter.thousandsSeparatorTo = ".";
			formatter.useThousandsSeparator = true;
			formatter.precision = 2;
			restrict = "0-9";
			maxChars = 21;
			addEventListener("valueChange", handleValueChangeEvent);
			addEventListener(Event.CHANGE, handleChangeEvent);
			value = 0;
		}
		
		override protected function focusOutHandler(event:FocusEvent):void
		{
			super.focusOutHandler(event);
		}
		
		private function handleValueChangeEvent(event:Event):void
		{
			text = formatter.format(value);
			selectRange(text.length,text.length);
		}
		
		private function handleChangeEvent(event:Event):void
		{
			text = StringUtil.trim(text) == "" ? text="0" : StringUtil.trim(text);
			value = parseFloat(text.replace(/\,|\./g,""))/Math.pow(10,formatter.precision as int);
		}
	}
}