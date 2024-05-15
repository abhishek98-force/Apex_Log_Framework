public with sharing class LogMessage {

    public LogMessage(String message){
        this.logMessage = message;
    }

    public LogMessage(Exception ex){
        this.logMessage = ex.getMessage() + '\n' + ex.getStackTraceString();
    }

    public String requestId {
        get {
            requestId = Request.getCurrent().getRequestId();
            return requestId;
        }
        set;
    }

    public String quiddity {
        get {
            quiddity = Request.getCurrent().getQuiddity().name();
            return quiddity;
        }
        set;
    }

    public String logMessage {get; set;}

    public Log__e convertToPlatformEvent(){
        return new Log__e(
            request_id__c = requestId,
            quiddity__c = quiddity,
            log_message__c = logMessage
        );
    }

    
}