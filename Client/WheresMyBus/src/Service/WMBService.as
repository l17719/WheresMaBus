package Service
{
	import Eventos.EventoLocalizacao;
	import Eventos.EventoRemoteService;
	
	import Model.VO.CoordinatesVo;
	import Model.VO.DataResponseVo;
	import Model.VO.RequestVO;
	
	import flash.display.Sprite;
	import flash.events.GeolocationEvent;
	import flash.events.StatusEvent;
	import flash.sensors.Geolocation;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.mxml.HTTPService;
	
	[Bindable]
	public class WMBService extends Sprite implements IWMBService
	{
		
		private static var _instance:WMBService;
		private var tmpgeo:Geolocation;
		
		private var _tmpHttpService:HTTPService;
		
		private var _tmpDataLocation:RequestVO;
		
		public static function GetInstance():WMBService{
			if (_instance==null){
				_instance= new WMBService();
			}
			return _instance;
		}
		
		
		public function WMBService()
		{
			_instance= this;
		}
		
		public function ServicesendCoordinates(value:RequestVO):void
		{
			_tmpHttpService= new HTTPService();
			_tmpHttpService.url= "http://localhost:61765/api/bdata/GetBus/value";
			_tmpHttpService.method= "POST";
			_tmpHttpService.requestTimeout=120;
			_tmpHttpService.headers={Accept:"application/json"}
			_tmpHttpService.contentType="application/json";
			_tmpHttpService.resultFormat="text";
			var tmpToken:AsyncToken= _tmpHttpService.send(JSON.stringify(value));
			tmpToken.addResponder(new Responder(onSendCoordinatesOk,onServiceFault));
			
		}
		
		private function onSendCoordinatesOk(e:ResultEvent):void
		{
			var resultData:Object= JSON.parse(String(e.result));
			
			var tmpResultado:DataResponseVo= new DataResponseVo();
			tmpResultado.ResponseMessage= resultData.ResponseMessage;
			tmpResultado.TimeAvg= Number(resultData.TimeAvg);
			if (tmpResultado.ResponseMessage!="NobusFound"){
				var tmpArray:Array= resultData.ListaPontos;
				var tmpDataPonto:ArrayCollection= new ArrayCollection();
				var i:int=0;
				var x:int=tmpArray.length;
				while(i<x){
					
					var tmpPontoVo:CoordinatesVo= new CoordinatesVo();
					tmpPontoVo.ID= tmpArray[i].ID;
					tmpPontoVo.LatPos= Number(tmpArray[i].LatPos);
					tmpPontoVo.LongPos= Number(tmpArray[i].LongPos);
					tmpPontoVo.NomeParagem= tmpArray[i].NomeParagem;
					tmpDataPonto.addItem(tmpPontoVo);
					tmpPontoVo= null;
					i++;
				}
				tmpResultado.ListaPontos= tmpDataPonto;
			}
			
			else{
				
			}
			dispatchEvent(new EventoRemoteService(EventoRemoteService.ServiceOk,tmpResultado));
			
		}
		
		public function ServicegetMapData():void
		{
		}
		
		public function ServiceCheckOnlineService():void
		{
			// TODO Auto Generated method stub
			_tmpHttpService= new HTTPService();
			_tmpHttpService.url="http://localhost:61765/api/echo"; //to check
			_tmpHttpService.method="GET";
			_tmpHttpService.requestTimeout=120;
			_tmpHttpService.resultFormat="text";
			var tmpToken:AsyncToken= _tmpHttpService.send();
			tmpToken.addResponder(new Responder(onServiceOnline,onServiceFault));
			
		}
		
		private function onServiceOnline(e:ResultEvent):void
		{
			// TODO Auto Generated method stub
			var tmpStr:String= e.result as String;
			dispatchEvent(new EventoRemoteService(EventoRemoteService.ServiceOk,tmpStr));
		}
		
		public function ServiceGetMyCoordinates():void
		{
			tmpgeo= new Geolocation();
			
			// TODO Auto Generated method stub
			if (Geolocation.isSupported){
				tmpgeo.addEventListener(StatusEvent.STATUS,handleerrorGPS,false,0,true);
				tmpgeo.addEventListener(GeolocationEvent.UPDATE,handleLocationRequest,false,0,true);
				/*tmpgeo= new Geolocation();
				if (!tmpgeo.muted()){
					//tmpgeo.setRequestedUpdateInterval(10);
					
				}*/
				
				
			}
		}
		
		protected function handleLocationRequest(event:GeolocationEvent):void
		{
			tmpgeo.removeEventListener(StatusEvent.STATUS,handleLocationRequest);
			tmpgeo.removeEventListener(GeolocationEvent.UPDATE,handleLocationRequest);
			
			_tmpDataLocation= new RequestVO();
			_tmpDataLocation.latitude=event.latitude;
			_tmpDataLocation.longitude= event.longitude;
			tmpgeo=null;
			this.dispatchEvent(new EventoLocalizacao(EventoLocalizacao.Ok,_tmpDataLocation));
			
			
		}
		
		protected function handleerrorGPS(event:StatusEvent):void
		{
			tmpgeo.removeEventListener(StatusEvent.STATUS,handleerrorGPS);
			tmpgeo.removeEventListener(GeolocationEvent.UPDATE,handleerrorGPS);
			tmpgeo=null;
			var tmpStr:String= event.code+ " " + event.type;
			this.dispatchEvent(new EventoLocalizacao(EventoLocalizacao.NOK,tmpStr));
			
		}		
		
		public function ServicecheckGPSAvailable():Boolean
		{
			if (Geolocation.isSupported){
				
				if(!tmpgeo.muted){
					return true;
				}
			}
			return false;
		}
		
		private function onServiceFault(e:FaultEvent):void{
			var tmperrorString:String= e.fault.errorID+"\n "+ e.fault.faultString+"\n" + e.fault.faultDetail;
			dispatchEvent(new EventoRemoteService(EventoRemoteService.ServiceNOK,tmperrorString));
		}
	}
}