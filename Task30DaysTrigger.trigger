trigger Task30DaysTrigger on Task (after insert, after update, after delete, after undelete, 
before insert, before update, before delete) {
	Task30DaysTriggerHandler handler = new Task30DaysTriggerHandler();
    if(Trigger.isUpdate && Trigger.isAfter) {
        handler.onAfterUpdate(Trigger.new, Trigger.oldMap);    
    }
}