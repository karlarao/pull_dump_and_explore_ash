
### general workflow 

* run 0_gvash_to_csv.sql or 0_gvash_to_csv_12c.sql (on root PDB if you are in 12c to show per PDB data)

* create the external table @3_cr_ext.sql 
    * edit the directory path of CREATE OR REPLACE DIRECTORY
    * make sure the file name of file is myash.csv

* run the SQLs 
```
(on the scripts you can add/edit the WHERE tm BETWEEN filter)

# get the wait chains 
## by high level 
@5_dash_waitchains_ext.sql  session_id||'>>'||instance_number||'>>'||program2||'>>'||event2||'>>'||sql_id||'>>'||sql_opname||'>>'||p1text||'>>'||p1||'>>'||blocking_session

## by module 
@5_dash_waitchains_ext.sql  session_id||'>>'||instance_number||'>>'||program2||'>>'||event2||'>>'||sql_id||'>>'||sql_opname||'>>'||p1text||'>>'||p1||'>>'||blocking_session module='PY_IC_PAY_INQ_FLU'



# get wall clock elapsed times
@6_ash_elap2.sql
@6_ash_elap2b.sql



# run ashtop 
@7_ashtop.sql
@7_ashtopb.sql

## example commands
### high level wait class and event
@7_ashtop.sql wait_class,event session_type='FOREGROUND' sysdate-7 sysdate

### high level per node, wait class and event
@7_ashtop.sql inst_id,wait_class,event,username,sql_id session_type='FOREGROUND' sysdate-7 sysdate

### session and sqls
@7_ashtop.sql inst_id,session_id,username,program,sql_id,sql_plan_hash_value,plsql_entry_object_id,blocking_session,event session_type='FOREGROUND' sysdate-7 sysdate

### ash get what part of the execution plan the SQL is spending most of its time 
col object_name format a20
@7_ashtop.sql inst_id,session_id,username,program,sql_id,sql_plan_hash_value,plsql_entry_object_id,sql_plan_operation,sql_plan_options,sql_plan_line_id,o.object_name session_type='FOREGROUND' sysdate-7 sysdate

### ash by plan hash value and current_obj 
@7_ashtop.sql inst_id,session_id,sql_plan_hash_value,plsql_entry_object_id,sql_plan_operation,sql_plan_options,sql_plan_line_id,o.object_name session_type='FOREGROUND' sysdate-7 sysdate
```


