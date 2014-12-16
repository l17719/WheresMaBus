package Service
{
	import Model.VO.RequestVO;

	public interface IWMBService
	{
		function ServicesendCoordinates(value:RequestVO):void;
		function ServicegetMapData():void;
		function ServicecheckGPSAvailable():Boolean; 
		function ServiceGetMyCoordinates():void;
		function ServiceCheckOnlineService():void;
		
	}
}