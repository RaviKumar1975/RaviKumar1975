global class ContactUserScheduler implements System.Schedulable
{
	global void execute(System.SchedulableContext sc)
    {
        BatchContactExample bbq=new BatchContactExample();
		Database.executeBatch(bbq,30);
    }
}

//Open Execute Anonymous Window and paste the below code 
//Final String CRON_EXP = '0 50 3 ? * WED *';
//ContactUserScheduler schedular=new ContactUserScheduler();
//System.schedule('BatchContactExample Demo 1', CRON_EXP, schedular);