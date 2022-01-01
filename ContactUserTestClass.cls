@isTest
public class ContactUserTestClass 
{
	static testmethod void test() 
    {
    // Create test accounts to be updated by batch
    	List<Contact> conList = new List<Contact>();
      /*  List<User> userList = new List<User>();
       for (Integer i=0;i<10;i++) 
        {
            Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        	User us = new User(Alias = 'standt', Email='standarduser@testorg.com', 
            EmailEncodingKey='UTF-8',FirstName='testCon', LastName='lasttest'+i, LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName=i+'standarduser@testorg.com');            
        	userList.add(us);
    	}
    	insert userList;*/
        
    	for (Integer i=0;i<10;i++) 
        {
        	Contact ac = new Contact();
            ac.FirstName='testCon';
            ac.LastName='lastTest'+i;
            ac.Email=i+'testcon@gmail.com';
        	conList.add(ac);
    	}
    	insert conList;
 
    Test.startTest();
    BatchContactExample b = new BatchContactExample();
    Database.executeBatch(b);
    Test.stopTest();                           
    // Verify accounts updated
   // Account[] accUpdatedList = [SELECT Id, Name FROM Account];
    //System.assert(accUpdatedList[0].Name.Contains('sfdcpoint'));
    }
}

//Username, Email, Alias, TimeZoneSidKey, LocaleSidKey, EmailEncodingKey, ProfileId,
// LanguageLocaleKey]: [Username, Email, Alias, TimeZoneSidKey, LocaleSidKey, EmailEncodingKey, ProfileId, LanguageLocaleKey