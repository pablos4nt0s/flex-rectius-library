package br.com.rectius.library.form
{
	import spark.components.DropDownList;
	
	public class DropDownListSelector extends DropDownList
	{
		
		public var dataField:String;
		
		override public function set selectedItem(value:*):void
		{
			if (value)
			{
				for each (var item:* in dataProvider)
				{
					if(value.hasOwnProperty(dataField))
					{
						if(value[dataField] == item[dataField])
						{
							super.selectedItem = item;
							break;
						}
					}
					else if(item.hasOwnProperty("data"))
					{
						if(value == item.data)
						{
							super.selectedItem = item;
							break;
						}
					}
				}
			}
			else 
			{
				super.selectedItem = value;
			}
		}
	}
}