package Model
{
	import Model.VO.CoordinatesVo;
	import Model.VO.DataResponseVo;
	import Model.VO.RequestVO;
	
	import mx.collections.ArrayCollection;
	
	public class DummyModel implements IWMBModel
	{
		private var _isGpsEnabled:Boolean;
		
		
		[Bindable]
		private var selectedDummyCoordinates:RequestVO;
		
		
		[bindable]
		private var selectedDummyBusCoordinates:DataResponseVo;
		
		
		[Bindable]
		private var DummyUserCoordinates:ArrayCollection;
		
		[Bindable]
		private var DummyBusCoordinates:ArrayCollection;
		
		
		private var _dummyInitialized:Boolean;
		
		[Bindable]
		private var _dummyUserPos:int;
		
		[Bindable]
		private var _dummyBusPos:int;
		
		
		private static var _instance:DummyModel;
		
		public function get DummyInitialized():Boolean
		{
			return _dummyInitialized;
		}
		
		public function set DummyInitialized(value:Boolean):void
		{
			_dummyInitialized = value;
		}
		
		public static function GetInstance():DummyModel{
			if(_instance==null){
				_instance= new DummyModel();
			}
			return _instance;
		}
		
		public function DummyModel()
		{
			_instance= this;
		}
		
		public function ModelsendCoordinates(value:RequestVO):void
		{
		}
		
		public function ModelgetMapData():void
		{
		}
		
		public function ModelcheckGPSAvailable():Boolean
		{
			return _isGpsEnabled;
		}
		
		public function ModelsetGPSAvailable(value:Boolean):void{
			_isGpsEnabled= value;
		}
		public function ModelGetMyCoordinates():void
		{
		}
		
		public function ModelCheckOnlineService():void
		{
		}
		
		public function ModelSetGpsAvailableActive(value:Boolean):void
		{
			_isGpsEnabled= value;
		}
		
		public function ModelGetGpsAvailableActive():Boolean
		{
			return _isGpsEnabled;
		}
		
		public function ModelSetMyCoordinates(value:RequestVO):void
		{
		}
		
		//#######################################################dummy data seg##########################################
		
		public function GeraDadosDummyUser():void{
			if (DummyUserCoordinates==null){
				
				DummyUserCoordinates= new ArrayCollection();
				var tmpDummyUser:RequestVO= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5653476;
				tmpDummyUser.longitude = -7.90945699999997;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.562692;
				tmpDummyUser.longitude = -7.90625169999998;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5664284;
				tmpDummyUser.longitude = -7.90264100000002;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5689513;
				tmpDummyUser.longitude = -7.90324129999999;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5701901;
				tmpDummyUser.longitude = -7.90153629999997;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5720499;
				tmpDummyUser.longitude = -7.90343810000002;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5691873;
				tmpDummyUser.longitude = -7.90435690000004;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5689513;
				tmpDummyUser.longitude = -7.90324129999999;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5693596;
				tmpDummyUser.longitude = -7.908277;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.570941;
				tmpDummyUser.longitude = -7.90937899999994;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5665979;
				tmpDummyUser.longitude = -7.90566279999996;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5706994;
				tmpDummyUser.longitude = -7.91197940000006;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5706994;
				tmpDummyUser.longitude = -7.91197940000006;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5719461;
				tmpDummyUser.longitude = -7.9155313;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.574747;
				tmpDummyUser.longitude = -7.91639120000002;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5744402;
				tmpDummyUser.longitude = -7.91295160000004;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5733317;
				tmpDummyUser.longitude = -7.90893070000004;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5736278;
				tmpDummyUser.longitude = -7.9062404;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5747516;
				tmpDummyUser.longitude = -7.90179539999997;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5739458;
				tmpDummyUser.longitude = -7.90320959999997;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5737883;
				tmpDummyUser.longitude = -7.90960029999996;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5748003;
				tmpDummyUser.longitude = -7.90997489999995;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				tmpDummyUser= new RequestVO();
				tmpDummyUser.idUtilizador= "41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpDummyUser.latitude = 38.5690676;
				tmpDummyUser.longitude = -7.91753029999995;
				DummyUserCoordinates.addItem(tmpDummyUser);
				
				
				
			}
		}
		
		public function GeraDadosDummyBus():void{
			if (DummyBusCoordinates==null){
				DummyBusCoordinates= new ArrayCollection();
				
				var tmpDummybusResp:DataResponseVo= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				var tmpPontoVo:CoordinatesVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5653476;
				tmpPontoVo.LongPos = -7.90945699999997;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.562692;
				tmpPontoVo.LongPos = -7.90625169999998;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos =38.5664284;
				tmpPontoVo.LongPos = -7.90264100000002;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5689513;
				tmpPontoVo.LongPos = -7.90324129999999;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos =38.5701901;
				tmpPontoVo.LongPos = -7.90153629999997;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5720499;
				tmpPontoVo.LongPos = -7.90343810000002;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5691873;
				tmpPontoVo.LongPos = -7.90435690000004;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5689513;
				tmpPontoVo.LongPos = -7.90324129999999;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5693596;
				tmpPontoVo.LongPos = -7.908277;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.570941;
				tmpPontoVo.LongPos = -7.90937899999994;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5665979;
				tmpPontoVo.LongPos = -7.90566279999996;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5706994;
				tmpPontoVo.LongPos = -7.91197940000006;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5706994;
				tmpPontoVo.LongPos = -7.91197940000006;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5719461;
				tmpPontoVo.LongPos = -7.9155313;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.574747;
				tmpPontoVo.LongPos = -7.91639120000002;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5744402;
				tmpPontoVo.LongPos = -7.91295160000004;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5733317;
				tmpPontoVo.LongPos = -7.90893070000004;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5736278;
				tmpPontoVo.LongPos = -7.9062404;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5747516;
				tmpPontoVo.LongPos = -7.90179539999997;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5739458;
				tmpPontoVo.LongPos = -7.90320959999997;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5737883;
				tmpPontoVo.LongPos = -7.90960029999996;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5748003;
				tmpPontoVo.LongPos = -7.90997489999995;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
				
				tmpDummybusResp= new DataResponseVo();
				tmpDummybusResp.ListaPontos= new ArrayCollection();
				tmpPontoVo= new CoordinatesVo();
				
				tmpPontoVo.ID="41297aff-fa85-4194-a3fd-a2e52606b04c";
				tmpPontoVo.LatPos = 38.5690676;
				tmpPontoVo.LongPos = -7.91753029999995;
				tmpDummybusResp.ListaPontos.addItem(tmpPontoVo);
				
				DummyBusCoordinates.addItem(tmpDummybusResp);
			}
		}
		
		public function ObtemLocalizacaoDummyUser(valueRandom:Boolean):RequestVO{
			
			var resultado:RequestVO;
			var itemCounter:int= DummyBusCoordinates.length;
			if (valueRandom){
				selectedDummyCoordinates= RandomizeCoordinates();
				return selectedDummyCoordinates;
			}
			
			if (_dummyUserPos>itemCounter){
				_dummyUserPos=0;
				resultado= DummyUserCoordinates.getItemAt(_dummyUserPos) as RequestVO;
				
			}
			else{
				resultado= DummyUserCoordinates.getItemAt(_dummyUserPos) as RequestVO;
				_dummyUserPos++;
				
			}
			
			return resultado;
			//return DummyUserCoordinates.getItemAt(_dummyUserPos) as RequestVO;
		}
		
		private function RandomizeCoordinates():RequestVO
		{
			var low:Number=0;
			var high:Number=DummyUserCoordinates.length;
			var numb:int= Math.floor(Math.random()*(1+high-low))+low;
			return DummyUserCoordinates.getItemAt(numb) as RequestVO;
		}
		
		public function ObtemLocalizacaoDummyBus(valueRandom:Boolean):DataResponseVo{
			if (valueRandom){
				selectedDummyBusCoordinates= randomizeCoordinatesBus();
				return selectedDummyBusCoordinates;
			}
			if(_dummyBusPos>DummyBusCoordinates.length){
				_dummyBusPos=0;
			}
			else{
				_dummyBusPos++;
			}
			return DummyBusCoordinates.getItemAt(_dummyBusPos) as DataResponseVo;
		}
		
		private function randomizeCoordinatesBus():DataResponseVo
		{
			var low:Number=0;
			var high:Number=DummyBusCoordinates.length;
			var numb:int= Math.floor(Math.random()*(1+high-low))+low;
			return DummyBusCoordinates.getItemAt(numb) as DataResponseVo;
		}		
		
		//#################################################################################################################
		
		public function GetServiceOnline():Boolean
		{
			// TODO Auto Generated method stub
			return false;
		}
		
		public function SetServiceOnline(value:Boolean):void
		{
			// TODO Auto Generated method stub
			
		}
		
	}
}