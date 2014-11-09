package Eventos
{
	import flash.events.Event;
	
	public class EventoLocalizacao extends Event
	{
		
		public static var Ok:String="GPSLOCOK";
		public static var NOK:String="GPSLOCNOK";
		
		public var _dadosLocation:*;
		public function EventoLocalizacao(type:String,DadosLocation:*, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._dadosLocation= DadosLocation;
		}
		public override function clone():Event{
			return new EventoLocalizacao(type,_dadosLocation,bubbles,cancelable);
		}
	}
}