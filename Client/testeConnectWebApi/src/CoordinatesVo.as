package
{
	public class CoordinatesVo
	{
		private var _id:String;
		private var _latpos:Number;
		private var _longpos:Number;
		
		public function get LongPos():Number
		{
			return _longpos;
		}

		public function set LongPos(value:Number):void
		{
			_longpos = value;
		}

		public function get LatPos():Number
		{
			return _latpos;
		}

		public function set LatPos(value:Number):void
		{
			_latpos = value;
		}

		public function get ID():String
		{
			return _id;
		}

		public function set ID(value:String):void
		{
			_id = value;
		}

	}
}