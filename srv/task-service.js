const cds = require('@sap/cds');

module.exports = cds.service.impl(async function(){
    this.after('READ','Tasks', taskData => {
        const tasks = Array.isArray(taskData) ? taskData : [taskData];
        tasks.forEach(task => {
            if (task.status !== undefined) {
                task.criticality = task.status.ID;
            } else {
                task.criticality = task.status_ID;
            }
        });
    });

    this.after('READ','SubTasks', taskData => {
        const tasks = Array.isArray(taskData) ? taskData : [taskData];
        tasks.forEach(task => {
            if (task.status !== undefined) {
                task.criticality = task.status.ID;
            } else {
                task.criticality = task.status_ID;
            }
        });
    });
});
