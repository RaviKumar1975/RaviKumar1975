@isTest
public class Casetriggertest
{
    static testMethod void  insert1()
    {
        TrackingAnalytics__c cs = new TrackingAnalytics__c(Name='Case-status',Picklist_API_Name__c='status',Selected_Values__c='Working',sObject_API_Name__c='Case',sObject_Name__c='Case'); 
        insert cs;
        
        Account acc = New Account(Name = 'casechecktestaccount');
        insert acc;
        
        Contact con= new Contact(FirstName='casecheck',LastName='testcontact',Accountid= acc.id);
        insert con;
        
        Case cas = new Case( Accountid= acc.id, Contactid=con.id,Status ='Working', Priority = 'Medium', Origin = 'Email'); 
        insert cas;
        
        
        
        Case_Time_Tracking__c csts1= new Case_Time_Tracking__c(Case__c= cas.id,StartTime__c=system.now(),EndTime__c=system.now());
        insert csts1;  
        
    }
    static testMethod void  insertsec()
    {
        TrackingAnalytics__c cs = new TrackingAnalytics__c(Name='Case-status',Picklist_API_Name__c='status',Selected_Values__c='Working,New',sObject_API_Name__c='Case',sObject_Name__c='Case'); 
        insert cs;
        
        Account acc = New Account(Name = 'casechecktestaccount');
        insert acc;
        
        Contact con= new Contact(FirstName='casecheck',LastName='testcontact',Accountid= acc.id);
        insert con;
        
        Case cas = new Case( Accountid= acc.id, Contactid=con.id,Status ='Working', Priority = 'Medium', Origin = 'Email'); 
        insert cas;
        
        
        
        Case_Time_Tracking__c csts1= new Case_Time_Tracking__c(Case__c= cas.id,StartTime__c=system.now(),EndTime__c=system.now());
        insert csts1;
        
    }
    static testMethod void  update1()
    {
        TrackingAnalytics__c cs = new TrackingAnalytics__c(Name='Case-status',Picklist_API_Name__c='status',Selected_Values__c='Working,New',sObject_API_Name__c='Case',sObject_Name__c='Case'); 
        insert cs;
        
        Account acc = New Account(Name ='casechecktestaccount');
        insert acc;
        
        Contact con= new Contact(FirstName='casecheck',LastName='testcontact',Accountid= acc.id);
        insert con;
        
        Case cas = new Case( Accountid= acc.id, Contactid=con.id,Status ='New',Priority='Medium', Origin = 'Email'); 
        insert cas;
        cas.Status='Working';
        update cas;
        
        
        Case_Time_Tracking__c csts1= new Case_Time_Tracking__c(Case__c= cas.id,current_case_status_value__c=cas.Status,StartTime__c=system.now(),EndTime__c=system.now());
        insert csts1;
        
        
        
    }
    static testMethod void  updatesec()
    {
        
        
        TrackingAnalytics__c cs1 = new TrackingAnalytics__c(Name='Case-status',Picklist_API_Name__c='status',Selected_Values__c='Working',sObject_API_Name__c='Case',sObject_Name__c='Case'); 
        insert cs1; 
        
        
        Account acc = New Account(Name ='casechecktestaccount');
        insert acc;
        
        Contact con= new Contact(FirstName='casecheck',LastName='testcontact',Accountid= acc.id);
        insert con;
        
        Case cas = new Case( Accountid= acc.id, Contactid=con.id,Status ='New',Priority='Medium', Origin = 'Email'); 
        insert cas;
        cas.Status='Working';
        update cas;
        cas.Status='Escalated';
        update cas;
        
        
        Case_Time_Tracking__c csts1= new Case_Time_Tracking__c(Case__c= cas.id,current_case_status_value__c=cas.Status,StartTime__c=system.now(),EndTime__c=system.now());
        insert csts1;
        
        
        
    }
}