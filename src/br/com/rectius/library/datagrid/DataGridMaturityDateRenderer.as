package br.com.rectius.library.datagrid
{
	import mx.controls.dataGridClasses.DataGridItemRenderer;
	import mx.controls.dataGridClasses.DataGridListData;
	import mx.controls.listClasses.MXItemRenderer;
	
	public class DataGridMaturityDateRenderer extends DataGridItemRenderer
	{
		public function DataGridMaturityDateRenderer()
		{
			super();
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			var today:Number = (new Date()).time;
			var pubDate:Number = Date.parse(data[(listData as DataGridListData).dataField]);
			if( pubDate > today )
				setStyle("color",0x0);
			else 
				setStyle("color",0xff0000);
		}
	}
}