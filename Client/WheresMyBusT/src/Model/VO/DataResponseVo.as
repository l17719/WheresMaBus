package Model.VO
{
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass(alias="TemporaryCoffin.Models.ValueObject.DataResponseVo")]
	public class DataResponseVo
	{
		private var _ResponseMessage:String;
		private var _TimeAvg:Number;
		private var _ListaPontos:ArrayCollection;
		
		
		public function DataResponseVo()
		{
		}

		public function get ListaPontos():ArrayCollection
		{
			return _ListaPontos;
		}

		public function set ListaPontos(value:ArrayCollection):void
		{
			_ListaPontos = value;
		}

		public function get TimeAvg():Number
		{
			return _TimeAvg;
		}

		public function set TimeAvg(value:Number):void
		{
			_TimeAvg = value;
		}

		public function get ResponseMessage():String
		{
			return _ResponseMessage;
		}

		public function set ResponseMessage(value:String):void
		{
			_ResponseMessage = value;
		}

	}
}