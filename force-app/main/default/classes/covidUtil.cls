public with sharing class covidUtil{
	public covidUtil(){
	}

	@AuraEnabled(cacheable = true)
	public static Map<String, Object> fetchSummary(){
		try{
			return GETCallout.GETCalloutGenericMethod();
		} catch (Exception e){
			throw new AuraHandledException(e.getMessage());
		}
	}

	@AuraEnabled(cacheable = true)
	public static List<Object> covidStateWise(){
		try{
			Map<String, Object> Results = (Map<String, Object>)GETCallout.covidAPIResponse();
			Map<String, Object> dataResult = (Map<String, Object>)results.get('data');
			List<Object> regionalResult = (List<Object>)dataResult.get('regional');
			return regionalResult;
		} catch (Exception e){
			throw new AuraHandledException(e.getMessage());
		}
	}
}