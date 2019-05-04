trigger CreateTask90Days on Contact (after insert, after update) {
    List<Contact> newContacts = [SELECT Id, In_3__c, Account.Name FROM Contact WHERE Id IN :Trigger.New];
    List<Task> newTasks = new List<Task>();
    
    for (Contact cont : newContacts) {
        if (cont.In_3__c == True && cont.Account.Name == 'Households') {
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