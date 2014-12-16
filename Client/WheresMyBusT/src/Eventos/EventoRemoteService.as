package Eventos
{
	import flash.events.Event;
	
	public class EventoRemoteService extends Event
	{
		
		public static var ServiceOk:String="RemoteOK";
		public static var ServiceNOK:String="RemoteNOK";
		public  var _data:*
			
		public function EventoRemoteService(type:String,data:*, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_data=data;
		}
		
		public override function clone():Event{
			return new EventoRemoteService(type,_data,bubbles,cancelable);
		}
	}
}