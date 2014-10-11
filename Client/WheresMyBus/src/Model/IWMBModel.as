package Model
{
	import Model.VO.RequestVO;

	public interface IWMBModel
	{
		function ModelsendCoordinates(value:RequestVO):void;
		function ModelgetMapData():void;
		function ModelcheckGPSAvailable():Boolean; 
		function ModelGetMyCoordinates():void;
		function ModelCheckOnlineService():void;
		
	}
}