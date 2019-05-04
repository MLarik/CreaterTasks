trigger Task30DaysTrigger on Task (after insert, after update, after delete, after undelete, 
before insert, before update, before delete) {
	Task30DaysTrigger handler = new Task30DaysTrigger();

    if(Trigger.isUpdate && Trigger.isAfter) {
        handler.onAfterUpdate(Trigger.new, Trigger.oldMap);    
    }
}