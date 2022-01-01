public with sharing class OpportunityController_AC

{
    
    @AuraEnabled
    
    public static List<TrackingAnalytics__c> getOpportunities()
        
    {
        
        return [Select Name,sObject_Name__c,sObject_API_Name__c,Selected_Values__c,Picklist_API_Name__c	 FROM TrackingAnalytics__c];
        
    }
    
    // This method used for reterived  the list of opportunity records based on the search string
    
    @AuraEnabled
    
    public static List<TrackingAnalytics__c> getByName(String searchKey) {
        
        String name = '%' + searchKey + '%';
        
        return [Select Name,sObject_Name__c,sObject_API_Name__c,Selected_Values__c,Picklist_API_Name__c	 FROM TrackingAnalytics__c WHERE name LIKE :name];
        
    }
    
}