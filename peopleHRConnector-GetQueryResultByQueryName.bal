import ballerina.lang.messages;
import ballerina.net.http;
import ballerina.lang.system;

function main(string[] args) {
	http:ClientConnector peopleHREP = create http:ClientConnector("https://api.peoplehr.net");
	int argumentLength = args.length;
	if (argumentLength < 2) {
		system:println("Incorrect number of arguments");
		system:println("Please specify: Api Key, Action and Quary Name");
	}
	else {
		string apiKey = args[0];
		string apiqueryName = args[1];
		json payload = {"APIKey": apiKey,"Action": "GetQueryResultByQueryName" ,"QueryName": apiqueryName };
		message request = {};
		messages:setHeader(request , "Method" , "POST");
		messages:setHeader(request , "Content" , "text/json");
		messages:setJsonPayload(request , payload);
		message peopleHRResponse = http:ClientConnector.post(peopleHREP, "/Query", request);
		json peopleHRJsonResponse = messages:getJsonPayload(peopleHRResponse); 
		system:println(peopleHRJsonResponse);       
	}
}
