public class Casetriggerhandler
{
    public static void onAfterInsert(List<case> newlist,Map<Id,case> newmap)
    {
        Casetriggerhelper.methodofinsert(newlist,newmap,null,null);
    }
    public static void onAfterUpdate(List<case> newlist,Map<Id,case> newmap,List<case> oldlist,Map<Id,case> oldmap)
    {
        Casetriggerhelper.methodofupdate(newlist,newmap,oldlist,oldmap);
    }   
}