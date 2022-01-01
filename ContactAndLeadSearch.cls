public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String searchWord){
      //  String searchQuery=FIND {searchWord} IN ALL FIELDS RETURNING Lead(Name, FirstName, LastName), Contact(FirstName,LastName);
       String searchQuery='FIND \'' + searchWord + '\' IN ALL FIELDS RETURNING Lead(Name, FirstName, LastName), Contact(FirstName,LastName)';
       System.debug('This is searchQuery : '+searchQuery);
       List<List<sObject>> searchConLead = search.query(searchQuery);
       return searchConLead;
    }
}