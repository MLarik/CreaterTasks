trigger Task90DaysTrigger on Contact (after delete, after insert, after undelete,
after update, before delete, before insert, before update) {
    List<Contact> newContacts = [SELECT Id, In_3__c, Account.Name FROM Contact WHERE Id IN :Trigger.New];
    List<Contact> oldContacts = [SELECT Id, In_3__c, Account.Name FROM Contact WHERE Id IN :Trigger.Old];    
    Task90DaysHandler handler = new ContactTriggerHandler();
    //if(Trigger.isInsert && Trigger.isBefore){
    //  handler.OnBeforeInsert(newContacts);
    //}
    if(Trigger.isInsert && Trigger.isAfter){
        handler.OnAfterInsert(newContacts);
    }

    //else if(Trigger.isUpdate && Trigger.isBefore){
    //  handler.OnBeforeUpdate(Trigger.old, newContacts, oldContacts);
    //}
    if(Trigger.isUpdate && Trigger.isAfter){
        handler.OnAfterUpdate(newContacts, oldContacts);
    }

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