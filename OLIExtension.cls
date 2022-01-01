public with sharing class OLIExtension {
public ApexPages.StandardController sc;
public Opportunity Opp {get;set;}
public List<OpportunityLineItem> OLIlist2 {get ;set;}
public OpportunityLineItem prodop{ get; set; }     //new

public OLIExtension(ApexPages.StandardController sc) { 
this.Opp = (Opportunity)sc.getRecord();
OLIlist2 = [Select Name,OpportunityId,ListPrice,Discount,Product2Id,Quantity,UnitPrice,Subtotal,TotalPrice FROM OpportunityLineItem WHERE OpportunityId =:Opp.Id];
}


public List<OpportunityLineItem> getOLIs() 
{
    List<OpportunityLineItem> OLIlist2 = [Select Name, ID,OpportunityId,ListPrice,Discount,Product2Id,Quantity,UnitPrice,Subtotal,TotalPrice FROM OpportunityLineItem WHERE OpportunityId =:Opp.Id];
    return OLIlist2;
}
public PageReference saveIt() 
{
   // List<OpportunityLineItem> listOLI = getOLIs();
    update OLIlist2;

    return null;

}
    
}