public class ContactTriggerHandler {
	public static void onBeforeInsert(List<Contact> newlist,Map<Id,contact> newmap){
    }
    public static void onBeforeUpdate(List<contact> newlist,Map<Id,contact> newmap,List<contact> oldlist,Map<Id,contact> oldmap){
    }
    public static void onBeforeDelete(List<contact> oldlist,Map<Id,contact> oldmap){
    }
    public static void onAfterInsert(List<contact> newlist,Map<Id,contact> newmap){
       Contacttriggerhelper.contactAmountOnAccountInsert(newlist, newmap);
    }
    public static void onAfterUpdate(List<opportunity> newlist,Map<Id,contact> newmap,List<contact> oldlist,Map<Id,contact> oldmap){
  
    }
    public static void onAfterDelete(List<contact> oldlist,Map<Id,contact> oldmap){
    }
}