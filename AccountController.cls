public class AccountController {
    @AuraEnabled
    public static List<Account> getLimitedAccounts(){
        List<Account> accounts = [SELECT Id, Name, Phone, Rating, Active__c FROM Account];
        return accounts;
    }
}