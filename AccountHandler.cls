public class AccountHandler {
	public static void insertAccount(Integer newAcc)
    {
        Integer N=1;
        List<Account> AddAccounts=new List<Account>();
        while(N<=newAcc)          
        {
            Account na=new Account();
            na.Name='Acme Inc' + N;
            na.AccountNumber='A000n' + N;
            AddAccounts.add(na);
            N=N+1;
        }
        insert AddAccounts;
        
    }
}