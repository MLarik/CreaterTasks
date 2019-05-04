public class Task30DaysTriggerHandler {

    public void onAfterUpdate(Task[] updatedTasks, Map<ID, Task> oldTasksIds) {
        Contact[] oldContacts = [SELECT Id FROM Contact WHERE Account.Name = 'Households'];
        Task[] tasks = [SELECT Id, Status, WhoId FROM Task WHERE WhoId IN :oldContacts AND Id IN :updatedTasks];
        Set<Id> taskIds = new Set<Id>();

        for(Task task : tasks) {
            Task oldTask = oldTasksIds.get(task.Id);
            if(task.Status == 'Completed' && oldTask.Status != 'Completed') {
                taskIds.add(task.WhoId);
            }
        }
        createTask30Days(taskIds);
    }

    private void createTask30Days(Set<Id> contactIds) {
        Contact[] contacts = [SELECT Id FROM Contact WHERE Id IN :contactIds];
        List<Task> newTasks = new List<Task>();
        Date newDate = Date.today().addDays(30);

        for(Contact cont : contacts) {
            newTasks.add(
                new Task(
                Subject = 'Task30Days',
                Status = 'Not Started',
                ActivityDate = newDate,
                Reminder__c = newDate,
                WhoId = cont.Id
                )
            );
        }

        if(newTasks.size() > 0) {
            insert newTasks;
        }
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