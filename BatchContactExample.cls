global class BatchContactExample implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC) 
    {
                 
        string query='SELECT id,Name,Email,owner.Name FROM Contact where Email!=Null';
        
       // String query1='SELECT email from User';
     //   System.debug(query);
        return Database.getQueryLocator(query);
    }
     
    global void execute(Database.BatchableContext BC, List<Contact> conList) {
        
      //  List<User> userdet=[Select id,name from User];
        // process each batch of records default size is 200
        for(Contact coc : conList) 
        {
               if(coc.Name!=coc.Owner.Name)
            	{
                    coc.Email = coc.Email+'.invalid';
            	}
                System.debug('inside Userdet');
            
            system.debug('test');
        }
        try {
           Database.SaveResult[] SaveResultList = Database.update(conList,false); 
         
        } catch(Exception e) {
            System.debug(e);
        }
         
    }   
     
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
}

//BatchContactExample bbq=new BatchContactExample();
//Database.executeBatch(bbq,50);