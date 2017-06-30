Description
===========
This can be used to retrive employee data from PeopleHR.
At the moment "GetQueryResultByQueryName" action is supported and will be use as action parameter for peopleHR.


Prerequisites
=============
1. Obtain the following parameters
    * Api Key
    * Query Name ( Query Name defined in PeopleHR )

How to run this sample
======================
bin$ ./ballerina run main $File_PATH/peopleHRConnector.bal <APIKey> <QueryName>
