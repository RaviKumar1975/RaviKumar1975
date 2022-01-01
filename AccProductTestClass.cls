@isTest
public class AccProductTestClass {
	static testMethod void inserttestOpp() 
	{
        //Product
        Product2 pp =new Product2();
        pp.Name='rahulpd';
        pp.Type__c='Renewable';       //Dummy id='01u5g000004Ir6dAAC'
        pp.productCode = 'SFDCPanther-123';
		pp.isActive = true;
        insert pp;
        
        //Pricebook entry
        PricebookEntry standardPrice = new PricebookEntry();
		standardPrice.Pricebook2Id = Test.getStandardPricebookId();
		standardPrice.Product2Id = pp.Id;
		standardPrice.UnitPrice = 10000;
		standardPrice.IsActive = true;
		standardPrice.UseStandardPrice = false;
		insert standardPrice ;
        
        //Account
        Account acc = new Account(
		Name = 'SFDCPanther.com',
		Rating = 'Hot',
		Industry = 'Banking',
		Phone = '9087654321'
		);
		insert acc;
        
        //Opportunity
    	Opportunity opp = new Opportunity();
        opp.AccountId = acc.Id;
		opp.Name = 'Test Opportunity';
		opp.CloseDate= System.Today();
		opp.StageName='Prospecting';
		opp.Pricebook2Id = Test.getStandardPricebookId();
		insert opp;
        
        
      //  OpportunityLineItem oppl = new OpportunityLineItem(Product2Id=pp.id,Quantity=6,UnitPrice=15000,OpportunityId=opp.id);
        OpportunityLineItem oppLineItem = new OpportunityLineItem();
		oppLineItem.OpportunityId = opp.Id;
		oppLineItem.PricebookEntryId = standardPrice.Id;
		oppLineItem.UnitPrice = 70000;
		oppLineItem.Quantity = 5;
        
        
        Test.startTest();
        insert oppLineItem;
        Test.stopTest();
        System.assertEquals(70000, opp.ProductPriceSum__c=70000);       //point to oppor
	}
    static testMethod void updatetestOpp()
    {
        //Product2
        Product2 pp =new Product2();
        pp.Name='Shobhit_Product';
        pp.Type__c='Renewable';       //Dummy id='01u5g000004Ir6dAAC'
        pp.productCode = 'SFDCPanther-121';
		pp.isActive = true;
        insert pp;
        
        //PriceBookEntry
        PricebookEntry standardPrice = new PricebookEntry();
        standardPrice.Pricebook2Id = Test.getStandardPricebookId();
		standardPrice.Product2Id = pp.Id;
		standardPrice.UnitPrice = 10000;
		standardPrice.IsActive = true;
		standardPrice.UseStandardPrice = false;
		insert standardPrice;
        
        //Account
        Account acc = new Account(
		Name = 'SFDCPanther.com',
		Rating = 'Hot',
		Industry = 'Banking',
		Phone = '9087654321'
		);
		insert acc;
        
        //Opportunity
    	Opportunity opp = new Opportunity();
        opp.AccountId = acc.Id;
		opp.Name = 'Test Opportunity';
		opp.CloseDate= System.Today();
		opp.StageName='Prospecting';
		opp.Pricebook2Id = Test.getStandardPricebookId();
		insert opp;
        
        
      //  OpportunityLineItem oppl = new OpportunityLineItem(Product2Id=pp.id,Quantity=6,UnitPrice=15000,OpportunityId=opp.id);
        OpportunityLineItem oppLineItem = new OpportunityLineItem();
		oppLineItem.OpportunityId = opp.Id;
		oppLineItem.PricebookEntryId = standardPrice.Id;
		oppLineItem.UnitPrice = 17000;
		oppLineItem.Quantity = 5;
        insert oppLineItem;
        
        //Updating
        oppLineItem.UnitPrice=1000;
        opp.ProductPriceSum__c=1000;
        
        Test.startTest();
        update oppLineItem;
        Test.stopTest();
        System.assertEquals(1000, opp.ProductPriceSum__c);
    }
    static testMethod void deletetestOpp()
    {
        //Product2  --one
        Product2 pp =new Product2();
        pp.Name='Shobhit_Product Del';
        pp.Type__c='Renewable';       //Dummy id='01u5g000004Ir6dAAC'
        pp.productCode = 'SFDCPanther-121';
		pp.isActive = true;
        insert pp;
        
        //Product2 -- two
        Product2 pp2 =new Product2();
        pp2.Name='Shobhit_Product Del2';
        pp2.Type__c='Renewable';                       //--2
        pp2.productCode = 'SFDCPanther-122';
		pp2.isActive = true;
        insert pp2;
        
        //Price Book Entry
        PricebookEntry standardPrice = new PricebookEntry();
        standardPrice.Pricebook2Id = Test.getStandardPricebookId();       //--1
		standardPrice.Product2Id = pp.Id;
		standardPrice.UnitPrice = 11000;
		standardPrice.IsActive = true;
		standardPrice.UseStandardPrice = false;
		insert standardPrice;
        
        //Price Book Entry  -2
        PricebookEntry standardPrice2 = new PricebookEntry();
        standardPrice2.Pricebook2Id = Test.getStandardPricebookId();       // --2
		standardPrice2.Product2Id = pp2.Id;
		standardPrice2.UnitPrice = 12000;
		standardPrice2.IsActive = true;
		standardPrice2.UseStandardPrice = false;
		insert standardPrice2;
        
        //Account
        Account acc = new Account(
		Name = 'SFDCPanther.com.xyz',
		Rating = 'Hot',
		Industry = 'Banking',
		Phone = '9087654321'
		);
		insert acc;
        
        //Opportunity
    	Opportunity opp = new Opportunity();
        opp.AccountId = acc.Id;
		opp.Name = 'Test Opportunity Del';
		opp.CloseDate= System.Today();
		opp.StageName='Prospecting';
		opp.Pricebook2Id = Test.getStandardPricebookId();
		insert opp;
        
        
      //  OpportunityLineItem oppl = new OpportunityLineItem(Product2Id=pp.id,Quantity=6,UnitPrice=15000,OpportunityId=opp.id);
        OpportunityLineItem oppLineItemo = new OpportunityLineItem();
		oppLineItemo.OpportunityId = opp.Id;
		oppLineItemo.PricebookEntryId = standardPrice.Id;   
		oppLineItemo.UnitPrice = 107000;
		oppLineItemo.Quantity = 5;
        insert oppLineItemo;
       	
        OpportunityLineItem oppLineItemo2 = new OpportunityLineItem();
		oppLineItemo2.OpportunityId = opp.Id;
		oppLineItemo2.PricebookEntryId = standardPrice2.Id;   
		oppLineItemo2.UnitPrice = 107000;
		oppLineItemo2.Quantity = 5;
        insert oppLineItemo2;

        
        Test.startTest();
        delete oppLineItemo2;
        Test.stopTest();
        Opportunity op2=[Select ProductPriceSum__c from Opportunity where id=:opp.Id];
        System.assertEquals(535000,op2.ProductPriceSum__c);
    }
}