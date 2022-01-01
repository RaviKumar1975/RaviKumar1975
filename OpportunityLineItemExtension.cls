public class OpportunityLineItemExtension {
	public List<OpportunityLineItem> oppItemList{get;set;}
    public OpportunityLineItemExtension()
    {
        oppItemList = [SELECT Id,Name,Product2Id,OpportunityId FROM OpportunityLineItem ORDER BY Name];
    }
    
    public OpportunityLineItemExtension(ApexPages.StandardController o)
    {
        oppItemList = [SELECT Id,Name,Product2Id,OpportunityId FROM OpportunityLineItem ORDER BY Name];
    }
    public void open(ApexPages.StandardController op)
    {
        System.debug('Opened');
    }
}