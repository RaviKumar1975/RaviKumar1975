public class OpportunityExtension {
    public List<Opportunity> oList{get;set;}
    public Opportunity OppL {get;set;}
    public Opportunity Opp {get;set;}
    public List<OpportunityLineItem> olit{get;set;}
    public ID oppid {get;set;}
    
    public OpportunityExtension()
    {
        oList = [SELECT Id,Name,AccountId FROM Opportunity ORDER BY Name];
    }
   
    public OpportunityExtension(ApexPages.StandardController o)
    {
        oList = [SELECT Id,Name,AccountId FROM Opportunity ORDER BY Name];
    }
    public void OppLineItemExtension()
    {
        System.debug(oppid);
        olit=[SELECT ID,Name FROM OpportunityLineItem WHERE OpportunityId=:oppid];
        System.debug('Coming :'+olit);
    }
    
    public PageReference open()
    {
        System.debug('This is Opp  :'+oppid);
        pageReference pg = new pageReference('/apex/OppLineItemAddNew?core.apexpages.request.devconsole=1&id='+oppid);
		pg.setRedirect(true);
        return pg;
    }
}