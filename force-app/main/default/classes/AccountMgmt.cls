@RestResource(urlMapping = '/accountmgmt/')
global class AccountMgmt 
{
    @httpGet
    global static list<Account> getMoreAccounts(){
        List<Account> accList = [Select Id, Industry, rating, annualrevenue, name from account limit 5];
        return accList;
    }
    
    global static AccountWrapper getTopAccounts()
    {
        Map<String, String> paramsMap = RestContext.request.params;
        Set<Id> accountIdSet = new Set<Id>();
        String accIndustry = paramsMap.get('Industry');
        List<Account> accList = [Select id, industry, rating, annualrevenue from account 
                                where annualrevenue!=null and industry= :accIndustry order by annualrevenue desc limit 10];
        
        for(Account a: accList)
        {
            accountIdSet.add(a.Id);
        }
        
        List<Contact> cntList = [Select Id, lastName, firstName, email from Contact where id = :accountIdSet];
        List<Case> caseList = [Select id, priority, subject from case where id = :accountIdSet];
        
        AccountWrapper accWrapper = new AccountWrapper();
        accWrapper.accList = accList;
        accWrapper.conList = cntList;
        accWrapper.caseList = caseList;
        
        return accWrapper;
    }
    
    @httpPost 
    /*global static String createAccount(String accName, String accRating, String accIndustry)
    {
        Account acc = new Account();
        acc.Name = accName;
        acc.Rating = accRating;
        acc.Industry = accIndustry;
        
        try{
            insert acc;
            return 'Account created successfully';
        }catch(exception ex){
            return ex.getMessage();
        }

    }*/
    
    global static String createAccountAndContact(AccountInformation information)
    {
        Account accrecord = information.accountRecord;
        Contact conrecord = information.contactRecord;
        
        try{
            insert accrecord;
            conrecord.accountId = accrecord.Id;
            insert conrecord;
            return 'Account and Contact created successfully';
        }catch(exception ex)
        {
            return ex.getMessage();
        }
    }
    
    @httpDelete
    global static String deleteAccount()
    {
        Map<String, String> paramsMap = RestContext.request.params;
        String accountId = paramsMap.get('accId');
        
        List<Account> accList = [Select id from Account where Id= :accountId];
        
        if(!accList.isEmpty())
        {
            try{
                delete accList;
                return 'Account record deleted successfully';
            }catch(exception ex)
            {
                return ex.getMessage();
            }
        }
        else{
            return 'Unable to delete account record due to technical issue';
        }
    }

    global class AccountWrapper
    {
        global List<Account> accList;
        global List<Contact> conList;
        global List<Case> caseList;
    }
    
    global class AccountInformation
    {
        global Account accountRecord {get;set;}
        global Contact contactRecord {get;set;}
    }
}