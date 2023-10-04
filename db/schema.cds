namespace sap.ui.taskmanagement;

using {
    managed,
    cuid
} from '@sap/cds/common';


entity Tasks : managed {
    key ID          : UUID @(Core.Computed: true);
        title       : String(100);
        descr       : String;
        dueDate     : Date;
        status      : Association to Status;
        criticality : Integer;
        subtasks    : Composition of many SubTasks
                          on subtasks.task = $self;
}

entity SubTasks : cuid, managed {
    title  : String;
    descr  : String;
    task   : Association to Tasks;
    status : Association to Status;
    criticality:Integer;
}

entity Status {
    key ID   : Integer;
        name : String;
}
