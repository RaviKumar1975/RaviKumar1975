public with sharing class TaskController {

    @AuraEnabled(cacheable=true)
    public static List<Task> getTasks() { 
        return [SELECT Subject, Priority, Status,CompletedDateTime,ActivityDate,Who.Name,What.Name FROM Task WHERE Who.Type='Contact' AND What.Type='Account' AND status!='Completed'];    }    /// 2
       
	 @AuraEnabled(cacheable=true)    
     public static List<Task> getWorksCompleted() {
        return [SELECT Id,Subject, Priority,WhoId,Status,CompletedDateTime,ActivityDate, Who.Name,What.Name FROM Task where Who.Type='Contact' AND What.Type='Account' AND status='Completed'];    }   //4
    
    @AuraEnabled(cacheable=true)    
     public static List<Task> getOverdueTask() {
        return [SELECT Id,Subject, Priority,WhoId,Status,CompletedDateTime,ActivityDate, Who.Name,What.Name FROM Task where Who.Type='Contact' AND What.Type='Account' AND ActivityDate<TODAY AND Status!='Completed'];    }  // 3
    
    @AuraEnabled(cacheable=true)    
     public static List<Task> getTodayTask() {
        return [SELECT Id,Subject, Priority,WhoId,Status,CompletedDateTime,ActivityDate, Who.Name,What.Name FROM Task where Who.Type='Contact' AND What.Type='Account' AND ActivityDate = TODAY];    }///   1
    
    @AuraEnabled(cacheable=true)    
     public static List<Task> getNullTask() {
        return [SELECT Id FROM Task WHERE ActivityDate = TODAY];    }///   L
}