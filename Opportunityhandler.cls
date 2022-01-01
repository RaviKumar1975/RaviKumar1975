public class Opportunityhandler
{ 
    public static void onAfterInsert(List<Opportunity> newlist,Map<Id,Opportunity> newmap)
    {
        Opportunityhelper.methodofinsert(newlist,newmap,null,null);
    }
    public static void onAfterUpdate(List<Opportunity> newlist,Map<Id,Opportunity> newmap,List<Opportunity> oldlist,Map<Id,Opportunity> oldmap)
    {
        Opportunityhelper.methodofupdate(newlist,newmap,oldlist,oldmap); 
    }   
    

}