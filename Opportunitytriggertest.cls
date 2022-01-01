@isTest
public class Opportunitytriggertest
{
    static testMethod void  insert1()
    {
        TrackingAnalytics__c cs = new TrackingAnalytics__c(Name='Opportunity-Stage',Picklist_API_Name__c='StageName',Selected_Values__c='Prospecting',sObject_API_Name__c='Opportunity',sObject_Name__c='Opportunity'); 
        insert cs;
        
        Account acc = New Account(Name='casechecktestaccount');
        insert acc;
        
        
        
        Opportunity cas = new Opportunity(Name='Test Opportunity Triggers',Accountid= acc.id, StageName ='Prospecting', CloseDate =System.today()); 
        insert cas;
        
        
        
        Opportunity_Time_Tracking__c csts1= new Opportunity_Time_Tracking__c(Opportunity__c= cas.id,start_date__c=system.now(),EndTime__c=system.now());
        insert csts1;
        
    }
    static testMethod void  insertsec()
    {
        TrackingAnalytics__c cs = new TrackingAnalytics__c(Name='Opportunity-Stage',Picklist_API_Name__c='StageName',Selected_Values__c='Prospecting,Qualification',sObject_API_Name__c='Opportunity',sObject_Name__c='Opportunity'); 
        insert cs;
        
        Account acc = New Account(Name='casechecktestaccount');
        insert acc;
        
        
        
        Opportunity cas = new Opportunity(Name='Test Opportunity Triggers',Accountid= acc.id, StageName ='Sourcing Demand', CloseDate =System.today()); 
        insert cas;
        
        
        
        Opportunity_Time_Tracking__c csts1= new Opportunity_Time_Tracking__c(Opportunity__c= cas.id,start_date__c=system.now(),EndTime__c=system.now());
        insert csts1;
        
    }
    
    static testMethod void  update1()
    {
        TrackingAnalytics__c cs = new TrackingAnalytics__c(Name='Opportunity-Stage',Picklist_API_Name__c='StageName',Selected_Values__c='Prospecting,Qualification',sObject_API_Name__c='Opportunity',sObject_Name__c='Opportunity'); 
        insert cs;
        
        Account acc = New Account(Name ='casechecktestaccount');
        insert acc;
        
        Contact con= new Contact(FirstName='casecheck',LastName='testcontact',Accountid= acc.id);
        insert con;
        
        Opportunity cas = new Opportunity(Name='Test Opportunity Triggers',Accountid= acc.id, StageName ='Prospecting', CloseDate =System.today()); 
        insert cas;
        cas.StageName='Qualification';
        update cas;
        
        
        
        Opportunity_Time_Tracking__c csts1= new Opportunity_Time_Tracking__c(Opportunity__c= cas.id,Current__c=cas.StageName,start_date__c=system.now(),EndTime__c=system.now());
        insert csts1;
        
        
        
        
    }
    
    static testMethod void  updatesec()
    {
        
        
        TrackingAnalytics__c cs = new TrackingAnalytics__c(Name='Opportunity-Stage',Picklist_API_Name__c='StageName',Selected_Values__c='Qualification',sObject_API_Name__c='Opportunity',sObject_Name__c='Opportunity'); 
        insert cs;
        
        
        Account acc = New Account(Name ='casechecktestaccount');
        insert acc;
        
        
        Opportunity cas = new Opportunity(Name='Test Opportunity Triggers',Accountid= acc.id,StageName='Prospecting',CloseDate =System.today()); 
        insert cas;
        cas.StageName='Qualification';
        update cas;
        cas.StageName=cas.StageName='Perception Analysis'; 
        update cas;
        
        
        
        Opportunity_Time_Tracking__c csts1= new Opportunity_Time_Tracking__c(Opportunity__c= cas.id,Current__c=cas.StageName,start_date__c=system.now(),EndTime__c=system.now());
        insert csts1;
    }
}