package Model.VO
{
	[Bindable]
	[RemoteClass(alias="TemporaryCoffin.Models.ValueObject.CoordinatesVo")]
	public class CoordinatesVo
	{
		
		
		private var _ID:String;
		private var _LatPos:Number;
		private var _LongPos:Number;
		private var _NomeParagem:String;
		public function CoordinatesVo()
		{
		}

		public function get NomeParagem():String
		{
			return _NomeParagem;
		}

		public function set NomeParagem(value:String):void
		{
			_NomeParagem = value;
		}

		public function get LongPos():Number
		{
			return _LongPos;
		}

		public function set LongPos(value:Number):void
		{
			_LongPos = value;
		}

		public function get LatPos():Number
		{
			return _LatPos;
		}

		public function set LatPos(value:Number):void
		{
			_LatPos = value;
		}

		public function get ID():String
		{
			return _ID;
		}

		public function set ID(value:String):void
		{
			_ID = value;
		}

	}
}