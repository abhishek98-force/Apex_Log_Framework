trigger ErrorLogTrigger on Log__e (after insert) {
    List<ErrorLogger__c> errorLoggers = new List<ErrorLogger__c>();
    for(Log__e log : Trigger.new) {
        ErrorLogger__c error = new ErrorLogger__c();
        error.Request_id__c = log.request_id__c;
        error.Quiddity__c = log.quiddity__c;
        error.LogMessage__c = log.log_message__c;
        errorLoggers.add(error);
    }

    Database.insert(errorLoggers);
}