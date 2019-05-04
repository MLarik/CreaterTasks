public class Task90DaysTriggerHandler {
    public void OnAfterUpdate(Contact[] newContacts, Map<ID, Contact> oldContacts) {
        List<Contact> contacts = new List<Contact>();
    
        for (Contact cont : newContacts) {
            Contact oldCont = oldContacts.get(cont.Id);
            
            if (cont.In_3__c == true && cont.Account.Name == 'Households'
                && oldCont.In_3__c == false) {
                contacts.add(cont);
            }
        }
        CreateTasks(contacts);
    }
    
    public void OnAfterInsert(Contact[] newContacts) {
        List<Contact> contacts = new List<Contact>();
    
        for (Contact cont : newContacts) {
            if (cont.In_3__c == true && cont.Account.Name == 'Households') {
                contacts.add(cont);
            }
        }
        CreateTasks(contacts);
    }

    public void CreateTasks(List<Contact> contacts) {
        Date newDate = date.today().addDays(90);
        List<Task> newTasks = new List<Task>();

        for (Contact cont : contacts) {
            newTasks.add(new Task(
                        Subject = 'Task90Days',
                        ActivityDate = newDate, 
                        Reminder__c = newDate,
                        WhoId = cont.Id));
        }
                    
        if(newTasks.size() > 0) {
            insert newTasks;
        }
    }

    /*

    public void OnAfterInsert(Task[] newRecords){

    }

    public void OnBeforeInsert(Task[] newRecords){

    }

    public void OnBeforeUpdate(Task[] oldRecords, Task[] updatedRecords, Map<ID, Task> recordMap){
   
    }

    public void OnBeforeDelete(Task[] recordsToDelete, Map<ID, Task> recordMap){

    }

    public void OnAfterDelete(Task[] deletedRecords, Map<ID, Task> recordMap){

    }

    public void OnUndelete(Task[] restoredRecords){

    }
    */
}