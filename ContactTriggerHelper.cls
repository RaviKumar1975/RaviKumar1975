public class ContactTriggerHelper {
public static void contactAmountOnAccountInsert(List<contact> newlist,Map<Id,contact> newmap){
    Set<Id> setAcc=new Set<Id>();
    set<Id> setAccOld = new set<Id>();
    List<Account> accList=new List<Account>();
    
   	Set<Id> setAc=new Set<Id>();
	setAc=newmap.keyset();
    System.debug(setAc);
    if(trigger.isinsert){
    for(Account acc:[select id,New_Primary_Contact__c,(select Id,AccountId, Primary__c, Name from contacts) from Account where id in:setAc])
        {
            for(Contact cont:acc.Contacts)
            {
                if(acc.New_Primary_Contact__c!=null)
                {
                    acc.Old_Primary_Contact__c=acc.New_Primary_Contact__c;
				}
                acc.New_Primary_Contact__c=cont.id;
            }
            accList.add(acc);
        }}
        update accList;
    }
       public static void contactAmountOnAccountUpdate(List<contact> newlist,Map<Id,contact> newmap,
                                                          List<contact> oldlist, Map<Id,contact> oldmap){
           Set<Id> setAcc=new Set<Id>();
    set<Id> setAccOld = new set<Id>();
    List<Account> accList=new List<Account>();
    
    for(Account acc:[select id,New_Primary_Contact__c,(select Id,AccountId, Primary__c, Name from contacts) from Account where id in:setAcc])
        {
            for(Contact cont:acc.Contacts)
            {
                if(acc.New_Primary_Contact__c!=null)
                {
                    acc.Old_Primary_Contact__c=acc.New_Primary_Contact__c;
				}
                acc.New_Primary_Contact__c=cont.id;
            }
            accList.add(acc);
        }
        update accList;
    }
}