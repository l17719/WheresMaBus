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
		function ControllerSetGpsAvailableActive(value:Boolean):void;
		function ControllerGetGpsAvailableActive():Boolean;
		function ControllerObtemChave():String;
		function ControllerSetMyCoordinates(value:RequestVO):void;
	}
}