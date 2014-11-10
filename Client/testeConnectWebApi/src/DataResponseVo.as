package
{
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass(alias="TemporaryCoffin.Models.ValueObject.DataResponseVo")]
	public class DataResponseVo
	{
		private var _responseMessage:String;
		private var _timeavg:Number;
		private var _listapontos:ArrayCollection;

		public function get ListaPontos():ArrayCollection
		{
			return _listapontos;
		}

		public function set ListaPontos(value:ArrayCollection):void
		{
			_listapontos = value;
		}

		public function get TimeAvg():Number
		{
			return _timeavg;
		}

		public function set TimeAvg(value:Number):void
		{
			_timeavg = value;
		}

		public function get ResponseMessage():String
		{
			return _responseMessage;
		}

		public function set ResponseMessage(value:String):void
		{
			_responseMessage = value;
		}

	}
}