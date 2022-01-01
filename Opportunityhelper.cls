public class Opportunityhelper 
{
    public static void methodofinsert(List<Opportunity> newlist,Map<Id,Opportunity> newmap,List<Opportunity> oldlist,Map<Id,Opportunity> oldmap)
    {
        list<Opportunity_Time_Tracking__c> valueofopptimetracking=new list<Opportunity_Time_Tracking__c>();
        Opportunity_Time_Tracking__c opptimetrackingobj= new Opportunity_Time_Tracking__c();
        TrackingAnalytics__c  TrackingAnalyticsselectedvalues= TrackingAnalytics__c.getvalues('Opportunity-Stage');                                                       
        String selectedvaluespli = TrackingAnalyticsselectedvalues.Selected_Values__c;
        if(selectedvaluespli.CONTAINS(','))
        {
            String[] aftervaluesplit = selectedvaluespli.split(',');        
            for(Opportunity cs1:newlist)                                    
            {                                                               
                if(aftervaluesplit.size()>0)                                
                {
                    for(String str: aftervaluesplit)                        
                    {                                                       
                        
                        if( cs1.StageName==str)                             
                        {
                            opptimetrackingobj.Opportunity__c=cs1.Id;       
                            opptimetrackingobj.start_date__c= system.now(); 
                            opptimetrackingobj.Current__c=cs1.StageName;    
                            opptimetrackingobj.EndTime__c=null;             
                            valueofopptimetracking.add(opptimetrackingobj); 
                        }
                    }
                }
            }
        }
        else
        {
            for(Opportunity cs1:newlist)
            {                                                                                                                                                                   
                if( cs1.StageName==selectedvaluespli)
                {
                    opptimetrackingobj.Opportunity__c=cs1.Id;
                    opptimetrackingobj.start_date__c= system.now(); 
                    opptimetrackingobj.Current__c=cs1.StageName; 
                    opptimetrackingobj.EndTime__c=null;  
                    valueofopptimetracking.add(opptimetrackingobj);
                }
                
            }
            
        }
        if(!valueofopptimetracking.isEmpty())
        {
            insert valueofopptimetracking;  
        }  
    }
    
    public static void methodofupdate(List<Opportunity> newlist,Map<Id,Opportunity> newmap,List<Opportunity> oldlist,Map<Id,Opportunity> oldmap)
    {
        list<Opportunity_Time_Tracking__c> valueofopptimetracking=new list<Opportunity_Time_Tracking__c>();
        list<Opportunity_Time_Tracking__c> cts1=new list<Opportunity_Time_Tracking__c>();
        
        Opportunity_Time_Tracking__c opptimetrackingobj= new Opportunity_Time_Tracking__c();
        map<id,string> CaseTimeTracking= new  map<id,string>();
        TrackingAnalytics__c  TrackingAnalyticsselectedvalues= TrackingAnalytics__c.getvalues('Opportunity-Stage');                                                       
        String selectedvaluespli = TrackingAnalyticsselectedvalues.Selected_Values__c;
        if(selectedvaluespli.CONTAINS(','))
        {
            String[] aftervaluesplit = selectedvaluespli.split(','); 
            for(Opportunity cs1:newlist)
            {  
                Opportunity cs = oldmap.get(cs1.id);
                
                if(aftervaluesplit.size()>0)
                {
                    for(String str: aftervaluesplit)
                    {
                        if(cs1.StageName!=cs.StageName)
                        {
                            
                            if( cs1.StageName==str)
                            {
                                opptimetrackingobj.Opportunity__c=cs1.Id;
                                opptimetrackingobj.start_date__c= system.now();
                                CaseTimeTracking.put(cs1.id,cs.StageName);
                                opptimetrackingobj.Current__c=cs1.StageName;
                                system.debug('value off CaseTimeTracking'+CaseTimeTracking);
                                valueofopptimetracking.add(opptimetrackingobj);
                            }
                            else
                            {
                                Opportunity_Time_Tracking__c csts1= new Opportunity_Time_Tracking__c();
                                opptimetrackingobj.Opportunity__c=cs1.Id;
                                opptimetrackingobj.start_date__c= system.now();
                                CaseTimeTracking.put(cs1.id,cs.StageName);
                                opptimetrackingobj.Current__c=cs1.StageName;
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
            for(Opportunity cs1:newlist)
            {  
                Opportunity cs = oldmap.get(cs1.id);
                
                if(cs1.StageName!=cs.StageName)
                {
                    if( cs1.StageName==selectedvaluespli)
                    {
                        opptimetrackingobj.Opportunity__c=cs1.Id;
                        opptimetrackingobj.start_date__c= system.now();
                        CaseTimeTracking.put(cs1.id,cs.StageName);
                        opptimetrackingobj.Current__c=cs1.StageName;
                        system.debug('value off CaseTimeTracking'+CaseTimeTracking);
                        valueofopptimetracking.add(opptimetrackingobj);
                    }
                    else
                    {
                        Opportunity_Time_Tracking__c csts1= new Opportunity_Time_Tracking__c();
                        opptimetrackingobj.Opportunity__c=cs1.Id;
                        opptimetrackingobj.start_date__c= system.now();
                        CaseTimeTracking.put(cs1.id,cs.StageName);
                        opptimetrackingobj.Current__c=cs1.StageName;
                        system.debug('value off CaseTimeTracking'+CaseTimeTracking);
                        cts1.add(csts1);  
                    }
                }  
            }
        }        
        if(!valueofopptimetracking.isEmpty())
        {
            insert valueofopptimetracking;  
        }
        list<Opportunity_Time_Tracking__c> updateCaseTimeTrackingc = new list<Opportunity_Time_Tracking__c>();
        for(Opportunity_Time_Tracking__c ctss:[select id, Opportunity__c, EndTime__c,Current__c from Opportunity_Time_Tracking__c where Opportunity__c In:CaseTimeTracking.keyset()and Current__c=:CaseTimeTracking.values()]) 
        {
            system.debug('value of map '+ctss);
            if(CaseTimeTracking.containsKey(ctss.Opportunity__c) && ctss.EndTime__c==null)     
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