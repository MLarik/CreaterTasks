trigger Task30DaysTrigger on Task (after insert, after update, after delete, after undelete, 
before insert, before update, before delete) {
	Task30DaysTriggerHandler handler = new Task30DaysTriggerHandler();

    //if(Trigger.isInsert && Trigger.isBefore){
    //  handler.OnBeforeInsert(Trigger.New);
    //}
    if(Trigger.isUpdate && Trigger.isAfter) {
        handler.onAfterUpdate(Trigger.new, Trigger.oldMap);    
    }
    //else if(Trigger.isUpdate && Trigger.isBefore){
    //  handler.OnBeforeUpdate(Trigger.old, Trigger.New, oldContacts);
    //}
    //else if(Trigger.isDelete && Trigger.isBefore){
    //  handler.OnBeforeDelete(Trigger.old, oldContacts);
    //}
    //else if(Trigger.isDelete && Trigger.isAfter){
    //  handler.OnAfterDelete(Trigger.old, oldContacts);
    //}
    //else if(Trigger.isUnDelete){
    //  handler.OnUndelete(Trigger.New);
    //}
}