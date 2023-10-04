using { sap.ui.taskmanagement as my } from '../db/schema';
@path: 'service/task'

service TaskService {

    entity Tasks as projection on my.Tasks;
    annotate Tasks with @odata.draft.enabled;
    
    entity Status as projection on my.Status;
}

