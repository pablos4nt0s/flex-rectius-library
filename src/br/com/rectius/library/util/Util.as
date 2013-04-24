package br.com.rectius.library.util
{
	import mx.collections.ArrayCollection;

	public final class Util
	{
		public static function LPad (variable:String, length:int, character:String):String 
		{
			if (variable.length < length)
				return character + LPad(variable, length-1, character);
			return variable;
		}
		
		public static function RPad (variable:String, length:int, character:String):String 
		{
			if (variable.length < length)
				return RPad(variable, length-1, character) + character;
			return variable;
		}
		
	}
}