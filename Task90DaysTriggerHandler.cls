public class Task90DaysTriggerHandler {
    public void OnAfterUpdate(Contact[] newContacts, Map<ID, Contact> oldContacts) {
        List<Task> newTasks = new List<Task>();
    
        for (Contact cont : newContacts) {
            Contact oldCont = oldContacts.get(cont.Id);
            
            if (cont.In_3__c == true && cont.Account.Name == 'Households'
                && oldCont.In_3__c == false) {
                Date newDate = date.today().addDays(90);
                
                newTasks.add(new Task(
                    ActivityDate = newDate,
                    Reminder__c = newDate,
                    WhoId = cont.Id));
             }
        }
    
        if(newTasks.size() > 0) {
            insert newTasks;
        }
    }
    
    public void OnAfterInsert(Contact[] newContacts) {
        List<Task> newTasks = new List<Task>();
    
        for (Contact cont : newContacts) {
            if (cont.In_3__c == true && cont.Account.Name == 'Households') {
                Date newDate = date.today().addDays(90);
                
                newTasks.add(new Task(
                    ActivityDate = newDate, 
                    Reminder__c = newDate,
                    WhoId = cont.Id));
             }
        }
    
        if(newTasks.size() > 0) {
            insert newTasks;
        }
    }
}