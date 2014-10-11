package Controller
{
	import Model.VO.RequestVO;

	public interface IWMBController
	{
		function ControllersendCoordinates(value:RequestVO):void;
		function ControllergetMapData():void;
		function ControllercheckGPSAvailable():Boolean; 
		function ControllerGetMyCoordinates():void;
		function ControllerCheckOnlineService():void;
	}
}