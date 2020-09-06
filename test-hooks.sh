#!/bin/sh
export TASKDATA=/tmp/task-test
export TASKRC=$TASKDATA/taskrc
hooks=$TASKDATA/hooks

rm -r $TASKDATA
mkdir -p $TASKDATA
yes | task config reccurence.limit 2
task add test recur:1min due:6s wait:2s scheduled:4s until:2min
sleep 6
task all
task 2 3
tasksh

rm -r $TASKDATA
mkdir -p $hooks
cp ./pirate_add_shift_recurrence.py $hooks
yes | task config reccurence.limit 2
task add test recur:1min due:6s wait:2s scheduled:4s until:2min
sleep 6
task all
task 2 3
tasksh
