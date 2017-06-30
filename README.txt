Description
===========
This can be used to retrive employee data from PeopleHR.
At the moment "getqueryresultbyqueryname" is supported


Prerequisites
=============
1. Obtain the following parameters
    * Api Key
    * Action (GetQueryResultByQueryName)
    * Query Name ( Query Name defined in PeopleHR )

How to run this sample
======================
bin$ ./ballerina run main $File_PATH/peopleHRConnector.bal <APIKey> <Action> <QueryName>
