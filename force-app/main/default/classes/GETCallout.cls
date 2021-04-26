public with sharing class GETCallout{
	public GETCallout(){
	}

	//@AuraEnabled(cacheable=true)
	public static Map<String, Object> GETCalloutGenericMethod(){
		try{
			Http http = new Http();
			HttpRequest request = new HttpRequest();
			request.setEndpoint('https://api.rootnet.in/covid19-in/stats/latest');
			request.setMethod('GET');
			HttpResponse response = http.send(request);
			if (response.getStatusCode() == 200){
				//Complete Success Bundle
				Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());

				// Complete Data
				Map<String, Object> dataResult = (Map<String, Object>)results.get('data');

				//Summary Data
				Map<String, Object> summaryResult = (Map<String, Object>)dataResult.get('summary');
				return summaryResult;
			}
			return GenericError.unhandledMapServerResponse;
		} catch (Exception e){
			throw new AuraHandledException(e.getMessage());
		}
	}

	/*@Authenication Mechanism for Covid
	 *@No Param
	 *@Return type HttpResponse
	 */
	private static HttpResponse authenticationMech(){
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://api.rootnet.in/covid19-in/stats/latest');
		request.setMethod('GET');
		HttpResponse response = http.send(request);
		return response;
	}

	/*@Result Capture from API response
	 *@No Param
	 *@Return Map<String, Object>
	 */
	public static Map<String, Object> covidAPIResponse(){
		try{
			HttpResponse response = authenticationMech();
			if (response.getStatusCode() == 200){
				Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
				return results;
			}
			return GenericError.unhandledMapServerResponse;
		} catch (Exception e){
			throw new AuraHandledException(e.getMessage());
		}
	}
}