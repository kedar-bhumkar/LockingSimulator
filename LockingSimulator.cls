public class LockingSimulator implements Queueable {
    private Project__c prj;
    private integer theWaitTime;
    
    public LockingSimulator(Project__c prj, integer waitTime){
        this.prj    = prj;
        theWaitTime = waitTime;
    }
    
    public void execute(QueueableContext context) {

        insert prj;    
        String s = '';
        System.debug('waitTime = ' + theWaitTime);
        for(integer i=0;i<theWaitTime;i++){
            s+= ''+i;
        }
    }
}

/* Execute this script */
/*
Project__c prj;
List<Contact> contacts  = [Select Id from Contact  where Account = '0030v00000CjRozAAF' LIMIT 5];
integer iteration=0;
integer waitTime;
for (Contact  contacts : contacts){
    iteration++;
    prj = new Project__c();
    prj.Contact__c = '0030v00000CjRozAAF';
    if(Math.mod(iteration,2)!=0){
        waitTime = 10000;
    }else{
        waitTime = 100;
    }
    System.enqueueJob(new LockingSimulator(prj, waitTime));    
}

*/