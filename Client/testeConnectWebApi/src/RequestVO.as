package
{
	[Bindable]
	[RemoteClass(alias="TemporaryCoffin.Models.ValueObject.RequestVO")]
	public class RequestVO
	{
		/*public string IdUtilizador { get; set; }
		public double Longitude { get; set; }
		public double Latitude { get; set; }
		public string DataHora { get; set; }*/
		private var _idUtilizador:String;
		private var _longitude:Number;
		private var _latitude:Number;
		private var _dataHora:String;
		
		
		public function get DataHora():String
		{
			return _dataHora;
		}

		public function set DataHora(value:String):void
		{
			_dataHora = value;
		}

		public function get Longitude():Number
		{
			return _longitude;
		}

		public function set Longitude(value:Number):void
		{
			_longitude = value;
		}

		public function get IdUtilizador():String
		{
			return _idUtilizador;
		}

		public function set IdUtilizador(value:String):void
		{
			_idUtilizador = value;
		}

		public function get Latitude():Number
		{
			return _latitude;
		}

		public function set Latitude(value:Number):void
		{
			_latitude = value;
		}

	}
}