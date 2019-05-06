trigger Task90DaysTrigger on Contact (after delete, after insert, after undelete,
after update, before delete, before insert, before update) {
    List<Contact> newContacts = [SELECT Id, In_3__c, Account.Name FROM Contact WHERE Id IN :Trigger.New];
    Task90DaysHandler handler = new Task90DaysHandler();
    
    if(Trigger.isInsert && Trigger.isAfter){
        handler.OnAfterInsert(newContacts);
    }

    if(Trigger.isUpdate && Trigger.isAfter){
        handler.OnAfterUpdate(newContacts, Trigger.OldMap);
    }
    
    //if(Trigger.isInsert && Trigger.isBefore){
    //  handler.OnBeforeInsert(newContacts);
    //}

    //else if(Trigger.isUpdate && Trigger.isBefore){
    //  handler.OnBeforeUpdate(Trigger.old, newContacts, oldContacts);
    //}

    //else if(Trigger.isDelete && Trigger.isBefore){
    //  handler.OnBeforeDelete(Trigger.old, oldContacts);
    //}
    //else if(Trigger.isDelete && Trigger.isAfter){
    //  handler.OnAfterDelete(Trigger.old, oldContacts);
    //}
    //else if(Trigger.isUnDelete){
    //  handler.OnUndelete(newContacts);
    //}
}