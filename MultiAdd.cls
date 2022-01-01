public class MultiAdd
{    
    //will hold the account records to be saved
    public List<OpportunityLineItem> lstAcct = new List<OpportunityLineItem>();
    // public List<Account> lstAcct  = new List<Account>();
     public OpportunityLineItem accop{ get; set; }
    public Opportunity Opp {get;set;}
    //list of the inner class
    public List<innerClass> lstInner 
    {   get;set;    }
    //will indicate the row to be deleted
    public String selectedRowIndex
    {get;set;}  
    
    //no. of rows added/records in the inner class list
    public Integer count = 1;
    //{get;set;}
    
    
    ////save the records by adding the elements in the inner class list to lstAcct,return to the same page
    public PageReference Save()
    {
       // PageReference pr = new ApexPages.StandardController(accop).view();
     //   PageReference pr = new PageReference('/apex/OpportunityLineItemPage?core.apexpages.request.devconsole=1');
        
        for(Integer j = 0;j<lstInner.size();j++)
        {
          //  lstInner[j].opo.OpportunityId=accop.Id;
           // System.debug('lstInner[j].opo  :'+lstInner[j].opo.OpportunityId);
            lstAcct.add(lstInner[j].opo);
          //  1stInner[j]
        }
        PageReference pro = new PageReference('/apex/OpportunityLineItemPage?core.apexpages.request.devconsole=1&id='+lstAcct[0].OpportunityId);
 		System.debug('1st id is here   :'+lstAcct[0].OpportunityId);
        insert lstAcct;
        pro.setRedirect(true);
        return pro;
    }
        
    //add one more row
    public void Add()
    {   
        count = count+1;
        addMore();      
    }
    
    /*Begin addMore*/
    public void addMore()
    {
        //call to the iner class constructor
        innerClass objInnerClass = new innerClass(count);
        //add the record to the inner class list
        lstInner.add(objInnerClass);    
        system.debug('lstInner---->'+lstInner);            
    }/* end addMore*/
    
    /* begin delete */
    public void Del()
    {
        system.debug('selected row index---->'+selectedRowIndex);
        lstInner.remove(Integer.valueOf(selectedRowIndex)-1);
        count = count - 1;
        
    }/*End del*/
    
    
    
    /*Constructor*/
    public MultiAdd(ApexPages.StandardController ctlr)
    {
         this.Opp = (Opportunity)ctlr.getRecord();
    	 accop= new OpportunityLineItem();
         accop.OpportunityId=Opp.Id; 
        lstInner = new List<innerClass>();
        addMore();
        selectedRowIndex = '0';
        
    }/*End Constructor*/
        


    /*Inner Class*/
    public class innerClass
    {       
        /*recCount acts as a index for a row. This will be helpful to identify the row to be deleted */
        public String recCount
        {get;set;}
        
        public OpportunityLineItem opo{get;set;}
        
   /*     public OpportuntiyLineItem acct 
        {get;set;} */
         
        /*Inner Class Constructor*/
        public innerClass(Integer intCount)
        {
            recCount = String.valueOf(intCount);        
            
            /*create a new account*/
            opo = new OpportunityLineItem();
           // opo=Opp.Amount;
            
        }/*End Inner class Constructor*/    
    }/*End inner Class*/
}/*End Class*/