import ballerina.lang.messages;
import ballerina.net.http;
import ballerina.lang.system;
import ballerina.lang.jsons;

connector PeopleHR(string apiKey, string apiQueryName) {
	http:ClientConnector peopleHREP = create http:ClientConnector("https://api.peoplehr.net");
	action getQueryResultByQueryName(PeopleHR p)(message ) {
		json payload = {"APIKey": apiKey,"Action": "GetQueryResultByQueryName" ,"QueryName": apiQueryName };
		message request = {};
		messages:setHeader(request , "Method" , "POST");
		messages:setHeader(request , "Content" , "text/json");
		messages:setJsonPayload(request , payload);
		message peopleHRResponse = http:ClientConnector.post(peopleHREP, "/Query", request);
		return peopleHRResponse;
	}
}

function main(string[] args) {
	int argumentLength = args.length;
	if (argumentLength < 2) {
		system:println("Incorrect number of arguments");
		system:println("Please specify: Api Key and Quary Name");
	}
	else {
		PeopleHR peopleHRConnector = create PeopleHR(args[0], args[1]);
		message peopleHRResponse = PeopleHR.getQueryResultByQueryName(peopleHRConnector);
		json peopleHRJSONResponse = messages:getJsonPayload(peopleHRResponse);
		system:println(jsons:toString(peopleHRJSONResponse));
	}
}
