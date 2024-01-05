@RestResource(urlMapping = '/mappingContactObject/')
global class ContactMgmt
{
    @httpGet
    global static List<Contact> getTopContacts()
    {
        Map<String, String> contactName = RestContext.request.params;
        
        String cName = contactName.get('Name');
        List<Contact> cList = [Select name from contact where name = :cName];
        
        return clist;
    }
    
   
    
}