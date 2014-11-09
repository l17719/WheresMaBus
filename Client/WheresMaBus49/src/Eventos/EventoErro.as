package Eventos
{
	import flash.events.Event;
	
	import mx.messaging.messages.ErrorMessage;
	
	public class EventoErro extends Event
	{
		
		public static var ERRO:String="ERROAPP";
		public var _MensagemErro:String;
		
		public function EventoErro(type:String,ErroMsg:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_MensagemErro=ErrorMessage;
		}
		
		public override function clone():Event{
			return new EventoErro(type,_MensagemErro,bubbles,cancelable);
		}
	}
}