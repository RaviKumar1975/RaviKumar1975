public class AccproducttriggerHandler {
	public static void onBeforeInsert(List<OpportunityLineItem> newlist,Map<Id,OpportunityLineItem> newmap){
    }
    public static void onBeforeUpdate(List<OpportunityLineItem> newlist,Map<Id,OpportunityLineItem> newmap,List<OpportunityLineItem> oldlist,Map<Id,OpportunityLineItem> oldmap){
    }
    public static void onBeforeDelete(List<OpportunityLineItem> oldlist,Map<Id,OpportunityLineItem> oldmap){
    }
    public static void onAfterInsert(List<OpportunityLineItem> newlist,Map<Id,OpportunityLineItem> newmap){
        AccproducttriggerHelper.opportunityLineItemAmountOnAccountInsert(newlist,newmap);
    }
    public static void onAfterUpdate(List<OpportunityLineItem> newlist,Map<Id,OpportunityLineItem> newmap,List<OpportunityLineItem> oldlist,Map<Id,OpportunityLineItem> oldmap){
        AccproducttriggerHelper.opportunityLineItemAmountOnAccountUpdate(newlist,newmap,oldlist,oldmap);
    }
    public static void onAfterDelete(List<OpportunityLineItem> oldList,Map<Id,OpportunityLineItem> oldmap){
        AccproducttriggerHelper.opportunityLineItemAmountOnAccountDelete(oldList,oldmap);
    }
}