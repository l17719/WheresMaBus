package Model.VO
{
	[Bindable]
	[RemoteClass(alias="TemporaryCoffin.Models.ValueObject.RequestVO")]
	public class RequestVO
	{
		
		private var _idUtilizador:String;
		private var _longitude:Number;
		private var _latitude:Number;
		private var _dataHora:String;
		
		
		public function RequestVO(){}
		
		
		
		public function get dataHora():String
		{
			return _dataHora;
		}

		public function set dataHora(value:String):void
		{
			_dataHora = value;
		}

		public function get latitude():Number
		{
			return _latitude;
		}

		public function set latitude(value:Number):void
		{
			_latitude = value;
		}

		public function get longitude():Number
		{
			return _longitude;
		}

		public function set longitude(value:Number):void
		{
			_longitude = value;
		}

		public function get idUtilizador():String
		{
			return _idUtilizador;
		}

		public function set idUtilizador(value:String):void
		{
			_idUtilizador = value;
		}

	}
}