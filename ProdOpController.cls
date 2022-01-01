public class ProdOpController {
    public Opportunity Opp {get;set;}
    public OpportunityLineItem prodop{ get; set; }
    public String OpportunityId {get;set;} 
    
    
    public ProdOPController(ApexPages.StandardController sc){
        this.Opp = (Opportunity)sc.getRecord();
        prodop = new OpportunityLineItem();
        prodop.OpportunityId=Opp.Id;        
        System.debug('Non-Parameterised Constructor');
        OpportunityExtension obk=new OpportunityExtension();
        System.debug('Oppid  :'+obk.oppid);
    }
    
    public PageReference save(){

        system.debug('---->222 '+prodop.Product2Id);
        //PriceBookEntry priceBookList = [SELECT Id FROM PriceBookEntry WHERE Product2Id =: prodop.Product2Id and PriceBook2.isStandard=true LIMIT 1];
		
        prodop.OpportunityId=Opp.Id;
        prodop.PricebookEntryId = prodop.Product2Id; //'01u28000006fO2V';
        System.debug('I went into save---> '+prodop);
        
        try{
            insert prodop;
        }
        catch(System.DMLException e){
            System.debug('insert prodop failed');
            System.debug(e);
            ApexPages.addMessages(e);
            return null;
        }
        PageReference redirectSuccess = new ApexPages.StandardController(prodop).view();
        pageReference pg = new pageReference('/apex/OpportunityLineItemPage?core.apexpages.request.devconsole=1&id='+prodop.OpportunityId);
		return pg.setRedirect(true);
     //   List<OpportunityLineItem> OLIlist2 = [Select Name, ID,OpportunityId,ListPrice,Discount,Product2Id,Quantity,UnitPrice,Subtotal,TotalPrice FROM OpportunityLineItem WHERE OpportunityId =:prodop.Id];
    //    return (redirectSuccess);
    }

    public List<SelectOption> getProdOptions(){
        List<PricebookEntry> prods = Database.query(
            'SELECT Id, name FROM PricebookEntry'
        );
        List<SelectOption> options = new List<SelectOption>();
        for(PricebookEntry p : prods){
            options.add(new SelectOption(p.Id, p.Name));
        }
        System.debug('I listed the product options');
        return options;
    }
    
    public void addNew()
    {
    	//OpportunityLineItem wc = new OpportunityLineItem();
    	prodop.OpportunityId=Opp.Id;
       // prodop.UnitPrice=0;
       // prodop.Quantity=0;
       // prodop.TotalPrice=0;
        prodop.PricebookEntryId = prodop.Product2Id;   // Add New Product
	}
}