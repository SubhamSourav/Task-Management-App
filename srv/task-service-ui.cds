using {TaskService} from './task-service';

annotate TaskService.Tasks with {
    title   @title: 'Title';
    descr   @title: 'Description';
    dueDate @title: 'Due Date';
    status  @title: 'Status';
}

annotate TaskService.Status with {
    ID   @(
        UI.Hidden,
        Common: {Text: name}
    );
    name @title: 'Name';
};

annotate TaskService.SubTasks with {
    title  @title: 'Title';
    descr  @title: 'Description';
    status @title: 'Status';
};


annotate TaskService.Tasks with @(UI: {
    HeaderInfo      : {
        TypeName      : 'Task',
        TypeNamePlural: 'Tasks',
        Title         : {
            $Type: 'UI.DataField',
            Value: title
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: descr
        }
    },
    SelectionFields : [dueDate],
    LineItem        : [
        {Value: title},
        {Value: descr},
        {Value: dueDate},
        {
            Value      : status_ID,
            Criticality: criticality
        }
    ],
    Facets          : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Main',
            Target: '@UI.FieldGroup#Main'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'SubTasks',
            Target: 'subtasks/@UI.LineItem'
        }
    ],
    FieldGroup #Main: {Data: [
        {Value: dueDate},
        {
            Value      : status_ID,
            Criticality: criticality
        }
    ]},

});


annotate TaskService.Tasks with {

    status @Common: {
        Text                    : status.name,
        TextArrangement         : #TextOnly,
        ValueListWithFixedValues: true,
        ValueList               : {
            Label         : 'Status',
            CollectionPath: 'Status',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: status_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name'
                }
            ]
        },
    }
};

annotate TaskService.SubTasks with @(

    UI                             : {
        HeaderInfo: {
            $Type         : 'UI.HeaderInfoType',
            TypeName      : 'SubTask',
            TypeNamePlural: 'SubTasks',
        },
        LineItem  : [
            {Value: title},
            {Value: descr},
            {
                Value      : status_ID,
                Criticality: criticality
            },
        ],
    }
);

annotate TaskService.SubTasks with {
    status @Common: {
        Text                    : status.name,
        TextArrangement         : #TextOnly,
        ValueListWithFixedValues: true,
        ValueList               : {
            Label         : 'Status',
            CollectionPath: 'Status',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: status_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name'
                }
            ]
        }
    }
};
