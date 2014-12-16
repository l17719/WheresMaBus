package Utils
{
	import mx.formatters.DateFormatter;

	public class Utilities implements IUtilities
	{
		private var currentDate:Date;
		
		
		private static var _instance:Utilities;
		
		public static function GetInstance():Utilities{
			if (_instance==null){
				_instance= new Utilities();
			}
			return _instance;
		}
		public function Utilities()
		{
			_instance=this;
		}
		
		
		
		public function FormatDate():String{
			currentDate= new Date();
			var tmpFormatter:DateFormatter= new DateFormatter();
			tmpFormatter.formatString="DD/MM/YYYY LL:NN:SS";
			var tmpFormattedDate:String= tmpFormatter.format(currentDate);
			return tmpFormattedDate;
		}
		
	}
}