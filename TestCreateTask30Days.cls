@isTest
private class TestCreateTask30Days {
    @isTest static void testInsertCompletedTask() {
        Date newDate = Date.today().addDays(30);
        Account acc = new Account(Name='Households');
        insert acc;
    	Contact cont = new Contact(LastName='test1', AccountId=acc.Id);
        insert cont;
        
        Task task2 = new Task(
                        Subject='Other',
                        Status='Not Started',
                        WhoId=cont.Id);
        insert task2;
        task2.Status = 'Completed';
        update task2;
        
        Task[] createdTasks = [SELECT Id, Subject, WhoId, Status, ActivityDate, Reminder__c
                               FROM Task WHERE Subject='Task30Days'];
        Task newTask1 = createdTasks[0];
        
        System.assertEquals(1, createdTasks.size());
        
        System.assertEquals('Not Started', newTask1.Status);
        System.assertEquals(newDate, newTask1.ActivityDate);
        System.assertEquals(newDate, newTask1.Reminder__c);
        System.assertEquals(cont.Id, newTask1.WhoId);
    }

}