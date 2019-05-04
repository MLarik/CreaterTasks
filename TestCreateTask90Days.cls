@isTest
private class TestCreateTask90Days {
    @isTest static void testInsertCreateTask() {
        Date newDate = date.today().addDays(90);
        Account acc = new Account(Name='Households');
        insert acc;
    	Contact cont = new Contact(LastName='test1', AccountId=acc.Id, In_3__c = true);
        insert cont;

        Task newTask = [SELECT ActivityDate, Reminder__c FROM Task WHERE WhoId = :cont.Id LIMIT 1];
        
        System.assertEquals(newTask.ActivityDate, newDate);
        System.assertEquals(newTask.Reminder__c, newDate);
    }

    @isTest static void testUpdateCreateTask() {
        Account acc = new Account(Name='Households');
        insert acc;
    	Contact cont = new Contact(LastName='test1', AccountId=acc.Id, In_3__c = true);
        insert cont;
        cont.LastName = 'test2';
        update cont;

        Task createdTask = [SELECT ActivityDate, Reminder__c FROM Task WHERE WhoId = :cont.Id LIMIT 1];
        Date newDate = date.today().addDays(90);
        
        System.assertEquals(createdTask.ActivityDate, newDate);
        System.assertEquals(createdTask.Reminder__c, newDate);
    }

    @isTest static void testListInsertCreateTask() {
        Account acc = new Account(Name='Households');
        insert acc;
        Contact c = new Contact(LastName = 'test1', AccountId=acc.Id, In_3__c = true);
        Contact c2 = new Contact(LastName = 'test2', AccountId=acc.Id, In_3__c = true);
        Contact c3 = new Contact(LastName = 'test3', AccountId=acc.Id, In_3__c = true);
        List<Contact> contacts = new List<Contact>  {c, c2, c3};
        insert contacts;


        Task[] createdTasks = [SELECT ActivityDate, Reminder__c FROM Task WHERE WhoId = :contacts];
        Date newDate = date.today().addDays(90);
        
        System.assertEquals(3, createdTasks.size());
        for (Task task : createdTasks) {
            System.assertEquals(task.ActivityDate, newDate);
            System.assertEquals(task.Reminder__c, newDate);
        }
    }
}