public class Casetriggerhelper 
{ 
    public static void methodofinsert(List<case> newlist,Map<Id,case> newmap,List<case> oldlist,Map<Id,case> oldmap)
    {
        list<Case_Time_Tracking__c> cts=new list<Case_Time_Tracking__c>();
        Case_Time_Tracking__c csts= new Case_Time_Tracking__c();
        TrackingAnalytics__c  TrackingAnalyticsselectedvalues= TrackingAnalytics__c.getvalues('Case-status');                                                       
        String selectedvaluespli = TrackingAnalyticsselectedvalues.Selected_Values__c;
        if(selectedvaluespli.CONTAINS(','))
        {
            String[] aftervaluesplit = selectedvaluespli.split(',');
            for(case cs1:newlist)
            {  
               if(aftervaluesplit.size()>0)
                {
                    for(String str: aftervaluesplit)
                    {
                        if( cs1.Status==str)
                        {
                            csts.Case__c=cs1.Id;
                            csts.StartTime__c= system.now();
                            csts.current_case_status_value__c=cs1.Status;
                            csts.EndTime__c=null;  
                            cts.add(csts);
                        }
                    }
                }
            }
        }
        else
        {
            for(case cs1:newlist)
            {  
                if( cs1.Status==selectedvaluespli)
                {
                    csts.Case__c=cs1.Id;
                    csts.StartTime__c= system.now();
                    csts.current_case_status_value__c=cs1.Status;
                    csts.EndTime__c=null;  
                    cts.add(csts);
                }
            }
            
        }
        if(!cts.isEmpty())
        {
            insert cts;                  
        }  
    }
    public static void methodofupdate(List<case> newlist,Map<Id,case> newmap,List<case> oldlist,Map<Id,case> oldmap)
    {
        list<Case_Time_Tracking__c> cts=new list<Case_Time_Tracking__c>();
        list<Case_Time_Tracking__c> cts1=new list<Case_Time_Tracking__c>();
        
        Case_Time_Tracking__c csts= new Case_Time_Tracking__c();
        map<id,string> CaseTimeTracking= new  map<id,string>();
        TrackingAnalytics__c  TrackingAnalyticsselectedvalues= TrackingAnalytics__c.getvalues('Case-status');                                                       
        String selectedvaluespli = TrackingAnalyticsselectedvalues.Selected_Values__c;
        if(selectedvaluespli.CONTAINS(','))
        {
            String[] aftervaluesplit = selectedvaluespli.split(','); 
            for(case cs1:newlist)
            {  
                Case cs = oldmap.get(cs1.id);
                
                if(aftervaluesplit.size()>0)
                {
                    for(String str: aftervaluesplit)
                    {
                        if(cs1.status!=cs.status)
                        {
                            
                            if( cs1.Status==str)
                            {
                                csts.Case__c=cs1.Id;
                                csts.StartTime__c= system.now();
                                CaseTimeTracking.put(cs1.id,cs.Status);
                                csts.current_case_status_value__c=cs1.Status;
                                system.debug('value off CaseTimeTracking'+CaseTimeTracking);
                                cts.add(csts);
                            }
                            else
                            {
                                Case_Time_Tracking__c csts1= new Case_Time_Tracking__c();
                                csts.Case__c=cs1.Id;
                                csts.StartTime__c= system.now();
                                CaseTimeTracking.put(cs1.id,cs.Status);
                                csts.current_case_status_value__c=cs1.Status;
                                system.debug('value off CaseTimeTracking'+CaseTimeTracking);
                                cts1.add(csts1);  
                            }
                        }  
                    }
                }
            }
        }
        else
        {
            for(case cs1:newlist)
            {  
                Case cs = oldmap.get(cs1.id);
                
                if(cs1.status!=cs.status)
                {
                    if( cs1.Status==selectedvaluespli)
                    {
                        csts.Case__c=cs1.Id;
                        csts.StartTime__c= system.now();
                        CaseTimeTracking.put(cs1.id,cs.Status);
                        csts.current_case_status_value__c=cs1.Status;
                        system.debug('value off CaseTimeTracking'+CaseTimeTracking);
                        cts.add(csts);
                    }
                    else
                    {
                        Case_Time_Tracking__c csts1= new Case_Time_Tracking__c();
                        csts.Case__c=cs1.Id;
                        csts.StartTime__c= system.now();
                        CaseTimeTracking.put(cs1.id,cs.Status);
                        csts.current_case_status_value__c=cs1.Status;
                        system.debug('value off CaseTimeTracking'+CaseTimeTracking);
                        cts1.add(csts1);  
                    }
                }  
            }
        }        
        if(!cts.isEmpty())
        {
            insert cts;  
        }
        list<Case_Time_Tracking__c> updateCaseTimeTrackingc = new list<Case_Time_Tracking__c>();
        for(Case_Time_Tracking__c ctss:[select id, Case__c, EndTime__c,current_case_status_value__c from Case_Time_Tracking__c where Case__c In:CaseTimeTracking.keyset()and current_case_status_value__c=:CaseTimeTracking.values()]) 
        {
            system.debug('value of map '+ctss);
            if(CaseTimeTracking.containsKey(ctss.Case__c) && ctss.EndTime__c==null)     
            { 
                ctss.EndTime__c=system.now();
                updateCaseTimeTrackingc.add(ctss); 
            }
        } 
        if(!updateCaseTimeTrackingc.isEmpty())
        {
            system.debug('value  of updateCaseTimeTrackingc'+updateCaseTimeTrackingc);
            update updateCaseTimeTrackingc;   
        }
        
    }
}