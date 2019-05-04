public class Task90DaysHandler {
    public void OnAfterUpdate(Contact[] newRecords, Contact[] oldContacts) {
        List<Task> newTasks = new List<Task>();
    
        for (Contact cont : newRecords) {
            if (cont.In_3__c == True && cont.Account.Name == 'Households' && cont.In_3__c == true
                && newRecords.Retirement_Account_Linked__c == false) {
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
    
    public void OnAfterInsert(Contact[] newRecords) {
        
    }
}