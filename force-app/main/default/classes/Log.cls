public with sharing class Log {
    private static Log currentInstance;
    List<LogMessage> logList;

    private Log(){
        logList = new List<LogMessage>();
    }

    public static Log get(){
        if(currentInstance == null){
            currentInstance = new Log();
        }
        return currentInstance;
    }

    public void addLog(String logMessage){
        logList.add(new LogMessage(logMessage));         
    }

    public void addLog(Exception logException){
        logList.add(new LogMessage(logException));
    }

    public void publish(){
        List<SObject> rawLogs = new List<SObject>();
        for(LogMessage log : logList){
            rawLogs.add(log.convertToPlatformEvent());
        }
        EventBus.publish(rawLogs);
        logList.clear();
    }

    public void publish(String logMessage){
        this.addLog(logMessage);
        this.publish();
    }

    public void publish(Exception exceptionLog){
        this.addLog(exceptionLog);
        this.publish();
    }
}