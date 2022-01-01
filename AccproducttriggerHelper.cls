public class AccproducttriggerHelper {
    
    
	public static void opportunityLineItemAmountOnAccountInsert(List<OpportunityLineItem> newlist,Map<Id,OpportunityLineItem> newmap){
    //Map<Id, Account> setCon=new Map<Id, Account>();
    Set<Id> setAcc=new Set<Id>();
    // Map<Id,Id> accOpp=new Map<Id,Id>();
    set<Id> accIds = new set<Id>();
    //Set<Decimal> setAmo=new Set<Decimal>();
    Decimal listpr=0;
    List<Opportunity> accList=new List<Opportunity>();
    List<Opportunity> al=new List<Opportunity>();
    
    set<Id> oppaccId = new Set<Id>();
        
        if(trigger.isinsert)
        {
            for(OpportunityLineItem opplin:newList)
            {
                if(opplin.id!=null)
                {
                    setAcc.add(opplin.OpportunityId);
                     for(Opportunity acc:[SELECT Id,AccountId, Name, Account.Name,(SELECT Quantity, UnitPrice, TotalPrice,PricebookEntry.Name, PricebookEntry.Product2.Family, product2.type__c,ListPrice FROM OpportunityLineItems) FROM Opportunity WHERE Id in:setAcc])
        			 {
            			for(OpportunityLineItem oppLinu:acc.OpportunityLineItems)
            			{
                			if(oppLinu.product2.type__c=='Renewable')
                			{
                    			listpr += oppLinu.TotalPrice;
                    			accIds.add(acc.AccountId);
                			}
                			System.debug('ListPr  :'+listpr);
               				// acc.New_Primary_Contact__c=cont.id;
            			}
            			accList.add(acc);
        			}
       
        
        
        for(Opportunity acco:[Select Id,ProductPriceSum__c from Opportunity where id=:setAcc])
        {
			//Decimal sd=PRIORVALUE(acco.Total_Amount_of_Products__c); 
			if(acco.ProductPriceSum__c==null)
            {
                acco.ProductPriceSum__c=listpr;
            }
            else{
                acco.ProductPriceSum__c=listpr;
            }
            
            System.debug('Inside Account');
            System.debug(listpr);
            al.add(acco);
            listpr=0;
        }
                }
            }
        }
        
         if(acclist.size()>0)
    {
            update acclist; 
            update al;
    }
    }
    
    
   
    
    
    
    
    //2nd method
    public static void opportunityLineItemAmountOnAccountUpdate(List<OpportunityLineItem> newlist,Map<Id,OpportunityLineItem> newmap,List<OpportunityLineItem> oldlist,Map<Id,OpportunityLineItem> oldmap)
    {
    Set<Id> setAcc=new Set<Id>();
    set<Id> accIds = new set<Id>();
    Decimal listpr=0;
    List<Opportunity> accList=new List<Opportunity>();
    List<Opportunity> al=new List<Opportunity>();
    
    set<Id> oppaccId = new Set<Id>();
        
        
        if(trigger.isupdate)
        {
            for(OpportunityLineItem opplin:newList)
            {
                if(opplin.TotalPrice!=oldmap.get(opplin.Id).TotalPrice)
                {
                     //setAcc.add(Trigger.oldMap.get(opplin.id).OpportunityId);
                    setAcc.add(oldmap.get(opplin.id).OpportunityId);
                    setAcc.add(opplin.OpportunityId);
                     for(Opportunity acc:[SELECT Id,AccountId, Name, Account.Name,(SELECT Quantity, UnitPrice, TotalPrice,PricebookEntry.Name, PricebookEntry.Product2.Family, product2.type__c,ListPrice FROM OpportunityLineItems) FROM Opportunity WHERE Id in:setAcc])
        			 {
            			for(OpportunityLineItem oppLinu:acc.OpportunityLineItems)
            			{
                			/*if(oppLinu.product2.type__c=='Renewable')
                			{
                    			listpr += oppLinu.TotalPrice;
                    			accIds.add(acc.AccountId);
                			}*/
                            listpr += oppLinu.TotalPrice;
                            accIds.add(acc.AccountId);
                			System.debug('ListPr  :'+listpr);
            			}
            			accList.add(acc);
        			}
       
        
        
        for(Opportunity acco:[Select Id,ProductPriceSum__c from Opportunity where id=:setAcc])
        {
			if(acco.ProductPriceSum__c==null)
            {
                acco.ProductPriceSum__c=listpr;
            }
            else{
                acco.ProductPriceSum__c=listpr;
            }
            
            System.debug('Inside Account');
            System.debug(listpr);
            al.add(acco);
            listpr=0;
        }
                }
            }
        }
        
         if(acclist.size()>0)
    {
            update acclist; 
            update al;
    }
    }
    
    
    //3rd method
    public static void opportunityLineItemAmountOnAccountDelete(List<OpportunityLineItem> oldList,Map<Id,OpportunityLineItem> oldmap)
    {
    	Set<Id> setAcc=new Set<Id>();
    	set<Id> accIds = new set<Id>();
    	Decimal listpr=0;
    	List<Opportunity> accList=new List<Opportunity>();
    	List<Opportunity> al=new List<Opportunity>();
    
    	set<Id> oppaccId = new Set<Id>();
        
        
        if(trigger.isDelete)
        {
            for(OpportunityLineItem opplin:oldList)
            {
                if(opplin.id!=null)
                {
                     //setAcc.add(Trigger.oldMap.get(opplin.id).OpportunityId);
                    setAcc.add(opplin.opportunityId);
                     for(Opportunity acc:[SELECT Id,AccountId, Name, Account.Name,(SELECT Quantity, UnitPrice, TotalPrice,PricebookEntry.Name, PricebookEntry.Product2.Family, product2.type__c,ListPrice FROM OpportunityLineItems) FROM Opportunity WHERE Id in:setAcc])
        			 {
            			for(OpportunityLineItem oppLinu:acc.OpportunityLineItems)
            			{
                			if(oppLinu.product2.type__c=='Renewable')
                			{
                    			listpr += oppLinu.TotalPrice;
                    			accIds.add(acc.AccountId);
                			}
                			System.debug('ListPr  :'+listpr);
            			}
            			accList.add(acc);
        			}
        
        for(Opportunity acco:[Select Id,ProductPriceSum__c from Opportunity where id=:setAcc])
        {
			if(acco.ProductPriceSum__c==null)
            {
                acco.ProductPriceSum__c=listpr;
            }
            else{
                acco.ProductPriceSum__c=listpr;
            }
            
            System.debug('Inside Account');
            System.debug(listpr);
            al.add(acco);
            listpr=0;
        }
                }
            }
        }
        
         if(acclist.size()>0)
    {
            update accList; 
            update al;
    }
    }
}