
column INSTNAME format a20
column DELTA_WRITE_IO_BYTES format a24
column DELTA_READ_IO_BYTES format a24
column DELTA_WRITE_IO_REQUESTS format a24
column DELTA_READ_IO_REQUESTS format a24
column DELTA_TIME format a24
column TM_DELTA_DB_TIME format a24
column TM_DELTA_CPU_TIME format a24
column TM_DELTA_TIME format a24
column DBREPLAY_CALL_COUNTER format a24
column DBREPLAY_FILE_ID format a24
column ECID format a66
column PORT format a24
column MACHINE format a66
column CLIENT_ID format a66
column ACTION format a66
column MODULE format a66
column PROGRAM format a66
column SERVICE_HASH format a24
column IS_REPLAYED format a3
column IS_CAPTURED format a3
column REPLAY_OVERHEAD format a3
column CAPTURE_OVERHEAD format a3
column IN_SEQUENCE_LOAD format a3
column IN_CURSOR_CLOSE format a3
column IN_BIND format a3
column IN_JAVA_EXECUTION format a3
column IN_PLSQL_COMPILATION format a3
column IN_PLSQL_RPC format a3
column IN_PLSQL_EXECUTION format a3
column IN_SQL_EXECUTION format a3
column IN_HARD_PARSE format a3
column IN_PARSE format a3
column IN_CONNECTION_MGMT format a3
column TIME_MODEL format a24
column REMOTE_INSTANCE# format a24
column XID format a10
column CONSUMER_GROUP_ID format a24
column TOP_LEVEL_CALL_NAME format a66
column TOP_LEVEL_CALL# format a24
column CURRENT_ROW# format a24
column CURRENT_BLOCK# format a24
column CURRENT_FILE# format a24
column CURRENT_OBJ# format a24
column BLOCKING_HANGCHAIN_INFO format a3
column BLOCKING_INST_ID format a24
column BLOCKING_SESSION_SERIAL# format a24
column BLOCKING_SESSION format a24
column BLOCKING_SESSION_STATUS format a13
column TIME_WAITED format a24
column SESSION_STATE format a9
column WAIT_TIME format a24
column WAIT_CLASS_ID format a24
column WAIT_CLASS format a66
column P3 format a24
column P3TEXT format a66
column P2 format a24
column P2TEXT format a66
column P1 format a24
column P1TEXT format a66
column SEQ# format a24
column EVENT_ID format a24
column EVENT format a66
column PX_FLAGS format a24
column QC_SESSION_SERIAL# format a24
column QC_SESSION_ID format a24
column QC_INSTANCE_ID format a24
column PLSQL_SUBPROGRAM_ID format a24
column PLSQL_OBJECT_ID format a24
column PLSQL_ENTRY_SUBPROGRAM_ID format a24
column PLSQL_ENTRY_OBJECT_ID format a24
column SQL_EXEC_START format a9
column SQL_EXEC_ID format a24
column SQL_PLAN_OPTIONS format a66
column SQL_PLAN_OPERATION format a66
column SQL_PLAN_LINE_ID format a24
column SQL_PLAN_HASH_VALUE format a24
column TOP_LEVEL_SQL_OPCODE format a24
column TOP_LEVEL_SQL_ID format a15
column FORCE_MATCHING_SIGNATURE format a24
column SQL_OPNAME format a66
column SQL_OPCODE format a24
column SQL_CHILD_NUMBER format a24
column IS_SQLID_CURRENT format a3
column SQL_ID format a15
column USER_ID format a24
column FLAGS format a24
column SESSION_TYPE format a12
column SESSION_SERIAL# format a24
column SESSION_ID format a24
column TM format a13
column TMS format a13
column SAMPLE_TIME format a13
column SAMPLE_ID format a24
column INSTANCE_NUMBER format a24
column DBID format a24
column SNAP_ID format a24
column TEMP_SPACE_ALLOCATED format a24
column PGA_ALLOCATED format a24
column DELTA_INTERCONNECT_IO_BYTES format a24



PRO
PRO ACTIVE_SESSION_HISTORY - ash_elap by exec (recent)
PRO ~~~~~~~~~~~~~~~~~~~~~~~~~
set lines 300
col sql_exec_start format a30
col run_time_timestamp format a30

WITH 
ash AS (SELECT 
            a.*
        FROM 
            (
              select
              TRIM(INSTNAME) AS                        INSTNAME                            ,
              TRIM(INSTANCE_NUMBER) AS                 INSTANCE_NUMBER                     ,
              TRIM(DBID) AS                            DBID                                ,
              TRIM(SNAP_ID) AS                         SNAP_ID                             ,
              TRIM(SAMPLE_ID) AS                       SAMPLE_ID                           ,
              TM AS                                    TM                                  ,
              TMS AS                                   TMS                                  ,
              TRIM(SAMPLE_TIME) AS                     SAMPLE_TIME                         ,
              TRIM(SESSION_ID) AS                      SESSION_ID                          ,
              TRIM(SESSION_SERIAL#) AS                 SESSION_SERIAL#                     ,
              TRIM(SESSION_TYPE) AS                    SESSION_TYPE                        ,
              TRIM(FLAGS) AS                           FLAGS                               ,
              TRIM(USER_ID) AS                         USER_ID                             ,
              TRIM(SQL_ID) AS                          SQL_ID                              ,
              TRIM(IS_SQLID_CURRENT) AS                IS_SQLID_CURRENT                    ,
              TRIM(SQL_CHILD_NUMBER) AS                SQL_CHILD_NUMBER                    ,
              TRIM(SQL_OPCODE) AS                      SQL_OPCODE                          ,
              TRIM(SQL_OPNAME) AS                      SQL_OPNAME                          ,
              TRIM(FORCE_MATCHING_SIGNATURE) AS        FORCE_MATCHING_SIGNATURE            ,
              TRIM(TOP_LEVEL_SQL_ID) AS                TOP_LEVEL_SQL_ID                    ,
              TRIM(TOP_LEVEL_SQL_OPCODE) AS            TOP_LEVEL_SQL_OPCODE                ,
              TRIM(SQL_PLAN_HASH_VALUE) AS              SQL_PLAN_HASH_VALUE                ,
              TRIM(SQL_PLAN_LINE_ID) AS                SQL_PLAN_LINE_ID                    ,
              TRIM(SQL_PLAN_OPERATION) AS              SQL_PLAN_OPERATION                  ,
              TRIM(SQL_PLAN_OPTIONS) AS                SQL_PLAN_OPTIONS                    ,
              TRIM(SQL_EXEC_ID) AS                     SQL_EXEC_ID                         ,
              TRIM(SQL_EXEC_START) AS                  SQL_EXEC_START                      ,
              TRIM(PLSQL_ENTRY_OBJECT_ID) AS           PLSQL_ENTRY_OBJECT_ID               ,
              TRIM(PLSQL_ENTRY_SUBPROGRAM_ID) AS       PLSQL_ENTRY_SUBPROGRAM_ID           ,
              TRIM(PLSQL_OBJECT_ID) AS                 PLSQL_OBJECT_ID                     ,
              TRIM(PLSQL_SUBPROGRAM_ID) AS             PLSQL_SUBPROGRAM_ID                 ,
              TRIM(QC_INSTANCE_ID) AS                  QC_INSTANCE_ID                      ,
              TRIM(QC_SESSION_ID) AS                   QC_SESSION_ID                       ,
              TRIM(QC_SESSION_SERIAL#) AS              QC_SESSION_SERIAL#                  ,
              TRIM(PX_FLAGS) AS                        PX_FLAGS                            ,
              TRIM(EVENT) AS                           EVENT                               ,
              TRIM(EVENT_ID) AS                         EVENT_ID                           ,
              TRIM(SEQ#) AS                            SEQ#                                ,
              TRIM(P1TEXT) AS                          P1TEXT                              ,
              TRIM(P1) AS                              P1                                  ,
              TRIM(P2TEXT) AS                          P2TEXT                              ,
              TRIM(P2) AS                              P2                                  ,
              TRIM(P3TEXT) AS                          P3TEXT                              ,
              TRIM(P3) AS                              P3                                  ,
              TRIM(WAIT_CLASS) AS                      WAIT_CLASS                          ,
              TRIM(WAIT_CLASS_ID) AS                   WAIT_CLASS_ID                       ,
              TRIM(WAIT_TIME) AS                       WAIT_TIME                           ,
              TRIM(SESSION_STATE) AS                   SESSION_STATE                       ,
              TRIM(TIME_WAITED) AS                     TIME_WAITED                         ,
              TRIM(BLOCKING_SESSION_STATUS) AS         BLOCKING_SESSION_STATUS             ,
              TRIM(BLOCKING_SESSION) AS                BLOCKING_SESSION                    ,
              TRIM(BLOCKING_SESSION_SERIAL#) AS        BLOCKING_SESSION_SERIAL#            ,
              TRIM(BLOCKING_INST_ID) AS                BLOCKING_INST_ID                    ,
              TRIM(BLOCKING_HANGCHAIN_INFO) AS         BLOCKING_HANGCHAIN_INFO             ,
              TRIM(CURRENT_OBJ#) AS                    CURRENT_OBJ#                        ,
              TRIM(CURRENT_FILE#) AS                    CURRENT_FILE#                      ,
              TRIM(CURRENT_BLOCK#) AS                  CURRENT_BLOCK#                      ,
              TRIM(CURRENT_ROW#) AS                    CURRENT_ROW#                        ,
              TRIM(TOP_LEVEL_CALL#) AS                 TOP_LEVEL_CALL#                     ,
              TRIM(TOP_LEVEL_CALL_NAME) AS             TOP_LEVEL_CALL_NAME                 ,
              TRIM(CONSUMER_GROUP_ID) AS               CONSUMER_GROUP_ID                   ,
              TRIM(XID) AS                             XID                                 ,
              TRIM(REMOTE_INSTANCE#) AS                REMOTE_INSTANCE#                    ,
              TRIM(TIME_MODEL) AS                      TIME_MODEL                          ,
              TRIM(IN_CONNECTION_MGMT) AS              IN_CONNECTION_MGMT                  ,
              TRIM(IN_PARSE) AS                        IN_PARSE                            ,
              TRIM(IN_HARD_PARSE) AS                   IN_HARD_PARSE                       ,
              TRIM(IN_SQL_EXECUTION) AS                IN_SQL_EXECUTION                    ,
              TRIM(IN_PLSQL_EXECUTION) AS              IN_PLSQL_EXECUTION                  ,
              TRIM(IN_PLSQL_RPC) AS                    IN_PLSQL_RPC                        ,
              TRIM(IN_PLSQL_COMPILATION) AS            IN_PLSQL_COMPILATION                ,
              TRIM(IN_JAVA_EXECUTION) AS               IN_JAVA_EXECUTION                   ,
              TRIM(IN_BIND) AS                          IN_BIND                            ,
              TRIM(IN_CURSOR_CLOSE) AS                 IN_CURSOR_CLOSE                     ,
              TRIM(IN_SEQUENCE_LOAD) AS                IN_SEQUENCE_LOAD                    ,
              TRIM(CAPTURE_OVERHEAD) AS                CAPTURE_OVERHEAD                    ,
              TRIM(REPLAY_OVERHEAD) AS                 REPLAY_OVERHEAD                     ,
              TRIM(IS_CAPTURED) AS                     IS_CAPTURED                         ,
              TRIM(IS_REPLAYED) AS                     IS_REPLAYED                         ,
              TRIM(SERVICE_HASH) AS                    SERVICE_HASH                        ,
              TRIM(PROGRAM) AS                         PROGRAM                             ,
              TRIM(MODULE) AS                          MODULE                              ,
              TRIM(ACTION) AS                           ACTION                             ,
              TRIM(CLIENT_ID) AS                       CLIENT_ID                           ,
              TRIM(MACHINE) AS                         MACHINE                             ,
              TRIM(PORT) AS                            PORT                                ,
              TRIM(ECID) AS                            ECID                                ,
              TRIM(DBREPLAY_FILE_ID) AS                DBREPLAY_FILE_ID                    ,
              TRIM(DBREPLAY_CALL_COUNTER) AS           DBREPLAY_CALL_COUNTER               ,
              TRIM(TM_DELTA_TIME) AS                   TM_DELTA_TIME                       ,
              TRIM(TM_DELTA_CPU_TIME) AS               TM_DELTA_CPU_TIME                   ,
              TRIM(TM_DELTA_DB_TIME) AS                TM_DELTA_DB_TIME                    ,
              TRIM(DELTA_TIME) AS                       DELTA_TIME                         ,
              TRIM(DELTA_READ_IO_REQUESTS) AS          DELTA_READ_IO_REQUESTS              ,
              TRIM(DELTA_WRITE_IO_REQUESTS) AS         DELTA_WRITE_IO_REQUESTS             ,
              TRIM(DELTA_READ_IO_BYTES) AS             DELTA_READ_IO_BYTES                 ,
              TRIM(DELTA_WRITE_IO_BYTES) AS            DELTA_WRITE_IO_BYTES                ,
              TRIM(DELTA_INTERCONNECT_IO_BYTES) AS     DELTA_INTERCONNECT_IO_BYTES         ,
              TRIM(PGA_ALLOCATED) AS                    PGA_ALLOCATED                      ,
              TRIM(TEMP_SPACE_ALLOCATED) AS            TEMP_SPACE_ALLOCATED                
              from dump_dba_hist_ash_ext 
              ) a
       --  WHERE
       --      tm BETWEEN to_date('11/29/16 21:00', 'MM/DD/YY HH24:MI') AND to_date('11/29/16 23:30', 'MM/DD/YY HH24:MI')
    )
select * from 
(
select sql_id,
       sql_exec_id,
       sql_plan_hash_value,
           CAST(sql_exec_start AS TIMESTAMP) sql_exec_start,
       run_time run_time_timestamp,
 (EXTRACT(HOUR FROM run_time) * 3600
                    + EXTRACT(MINUTE FROM run_time) * 60
                    + EXTRACT(SECOND FROM run_time)) run_time_sec
from  (
select
       sql_id,
       sql_exec_id,
       sql_plan_hash_value,
       max(tms) sql_exec_start,
       max(tm - tms) run_time
from
       ash
where tms is not null
group by sql_id,sql_exec_id,sql_plan_hash_value
order by 4 desc
)
where rownum < 21
order by sql_exec_start asc
)
where run_time_sec < &run_time_sec
/
PRO
PRO ACTIVE_SESSION_HISTORY - ash_elap exec avg min max
PRO ~~~~~~~~~~~~~~~~~~~~~~~~~
WITH 
ash AS (SELECT 
            a.*
        FROM 
            (
              select
              TRIM(INSTNAME) AS                        INSTNAME                            ,
              TRIM(INSTANCE_NUMBER) AS                 INSTANCE_NUMBER                     ,
              TRIM(DBID) AS                            DBID                                ,
              TRIM(SNAP_ID) AS                         SNAP_ID                             ,
              TRIM(SAMPLE_ID) AS                       SAMPLE_ID                           ,
              TM AS                                    TM                                  ,
              TMS AS                                   TMS                                  ,
              TRIM(SAMPLE_TIME) AS                     SAMPLE_TIME                         ,
              TRIM(SESSION_ID) AS                      SESSION_ID                          ,
              TRIM(SESSION_SERIAL#) AS                 SESSION_SERIAL#                     ,
              TRIM(SESSION_TYPE) AS                    SESSION_TYPE                        ,
              TRIM(FLAGS) AS                           FLAGS                               ,
              TRIM(USER_ID) AS                         USER_ID                             ,
              TRIM(SQL_ID) AS                          SQL_ID                              ,
              TRIM(IS_SQLID_CURRENT) AS                IS_SQLID_CURRENT                    ,
              TRIM(SQL_CHILD_NUMBER) AS                SQL_CHILD_NUMBER                    ,
              TRIM(SQL_OPCODE) AS                      SQL_OPCODE                          ,
              TRIM(SQL_OPNAME) AS                      SQL_OPNAME                          ,
              TRIM(FORCE_MATCHING_SIGNATURE) AS        FORCE_MATCHING_SIGNATURE            ,
              TRIM(TOP_LEVEL_SQL_ID) AS                TOP_LEVEL_SQL_ID                    ,
              TRIM(TOP_LEVEL_SQL_OPCODE) AS            TOP_LEVEL_SQL_OPCODE                ,
              TRIM(SQL_PLAN_HASH_VALUE) AS              SQL_PLAN_HASH_VALUE                ,
              TRIM(SQL_PLAN_LINE_ID) AS                SQL_PLAN_LINE_ID                    ,
              TRIM(SQL_PLAN_OPERATION) AS              SQL_PLAN_OPERATION                  ,
              TRIM(SQL_PLAN_OPTIONS) AS                SQL_PLAN_OPTIONS                    ,
              TRIM(SQL_EXEC_ID) AS                     SQL_EXEC_ID                         ,
              TRIM(SQL_EXEC_START) AS                  SQL_EXEC_START                      ,
              TRIM(PLSQL_ENTRY_OBJECT_ID) AS           PLSQL_ENTRY_OBJECT_ID               ,
              TRIM(PLSQL_ENTRY_SUBPROGRAM_ID) AS       PLSQL_ENTRY_SUBPROGRAM_ID           ,
              TRIM(PLSQL_OBJECT_ID) AS                 PLSQL_OBJECT_ID                     ,
              TRIM(PLSQL_SUBPROGRAM_ID) AS             PLSQL_SUBPROGRAM_ID                 ,
              TRIM(QC_INSTANCE_ID) AS                  QC_INSTANCE_ID                      ,
              TRIM(QC_SESSION_ID) AS                   QC_SESSION_ID                       ,
              TRIM(QC_SESSION_SERIAL#) AS              QC_SESSION_SERIAL#                  ,
              TRIM(PX_FLAGS) AS                        PX_FLAGS                            ,
              TRIM(EVENT) AS                           EVENT                               ,
              TRIM(EVENT_ID) AS                         EVENT_ID                           ,
              TRIM(SEQ#) AS                            SEQ#                                ,
              TRIM(P1TEXT) AS                          P1TEXT                              ,
              TRIM(P1) AS                              P1                                  ,
              TRIM(P2TEXT) AS                          P2TEXT                              ,
              TRIM(P2) AS                              P2                                  ,
              TRIM(P3TEXT) AS                          P3TEXT                              ,
              TRIM(P3) AS                              P3                                  ,
              TRIM(WAIT_CLASS) AS                      WAIT_CLASS                          ,
              TRIM(WAIT_CLASS_ID) AS                   WAIT_CLASS_ID                       ,
              TRIM(WAIT_TIME) AS                       WAIT_TIME                           ,
              TRIM(SESSION_STATE) AS                   SESSION_STATE                       ,
              TRIM(TIME_WAITED) AS                     TIME_WAITED                         ,
              TRIM(BLOCKING_SESSION_STATUS) AS         BLOCKING_SESSION_STATUS             ,
              TRIM(BLOCKING_SESSION) AS                BLOCKING_SESSION                    ,
              TRIM(BLOCKING_SESSION_SERIAL#) AS        BLOCKING_SESSION_SERIAL#            ,
              TRIM(BLOCKING_INST_ID) AS                BLOCKING_INST_ID                    ,
              TRIM(BLOCKING_HANGCHAIN_INFO) AS         BLOCKING_HANGCHAIN_INFO             ,
              TRIM(CURRENT_OBJ#) AS                    CURRENT_OBJ#                        ,
              TRIM(CURRENT_FILE#) AS                    CURRENT_FILE#                      ,
              TRIM(CURRENT_BLOCK#) AS                  CURRENT_BLOCK#                      ,
              TRIM(CURRENT_ROW#) AS                    CURRENT_ROW#                        ,
              TRIM(TOP_LEVEL_CALL#) AS                 TOP_LEVEL_CALL#                     ,
              TRIM(TOP_LEVEL_CALL_NAME) AS             TOP_LEVEL_CALL_NAME                 ,
              TRIM(CONSUMER_GROUP_ID) AS               CONSUMER_GROUP_ID                   ,
              TRIM(XID) AS                             XID                                 ,
              TRIM(REMOTE_INSTANCE#) AS                REMOTE_INSTANCE#                    ,
              TRIM(TIME_MODEL) AS                      TIME_MODEL                          ,
              TRIM(IN_CONNECTION_MGMT) AS              IN_CONNECTION_MGMT                  ,
              TRIM(IN_PARSE) AS                        IN_PARSE                            ,
              TRIM(IN_HARD_PARSE) AS                   IN_HARD_PARSE                       ,
              TRIM(IN_SQL_EXECUTION) AS                IN_SQL_EXECUTION                    ,
              TRIM(IN_PLSQL_EXECUTION) AS              IN_PLSQL_EXECUTION                  ,
              TRIM(IN_PLSQL_RPC) AS                    IN_PLSQL_RPC                        ,
              TRIM(IN_PLSQL_COMPILATION) AS            IN_PLSQL_COMPILATION                ,
              TRIM(IN_JAVA_EXECUTION) AS               IN_JAVA_EXECUTION                   ,
              TRIM(IN_BIND) AS                          IN_BIND                            ,
              TRIM(IN_CURSOR_CLOSE) AS                 IN_CURSOR_CLOSE                     ,
              TRIM(IN_SEQUENCE_LOAD) AS                IN_SEQUENCE_LOAD                    ,
              TRIM(CAPTURE_OVERHEAD) AS                CAPTURE_OVERHEAD                    ,
              TRIM(REPLAY_OVERHEAD) AS                 REPLAY_OVERHEAD                     ,
              TRIM(IS_CAPTURED) AS                     IS_CAPTURED                         ,
              TRIM(IS_REPLAYED) AS                     IS_REPLAYED                         ,
              TRIM(SERVICE_HASH) AS                    SERVICE_HASH                        ,
              TRIM(PROGRAM) AS                         PROGRAM                             ,
              TRIM(MODULE) AS                          MODULE                              ,
              TRIM(ACTION) AS                           ACTION                             ,
              TRIM(CLIENT_ID) AS                       CLIENT_ID                           ,
              TRIM(MACHINE) AS                         MACHINE                             ,
              TRIM(PORT) AS                            PORT                                ,
              TRIM(ECID) AS                            ECID                                ,
              TRIM(DBREPLAY_FILE_ID) AS                DBREPLAY_FILE_ID                    ,
              TRIM(DBREPLAY_CALL_COUNTER) AS           DBREPLAY_CALL_COUNTER               ,
              TRIM(TM_DELTA_TIME) AS                   TM_DELTA_TIME                       ,
              TRIM(TM_DELTA_CPU_TIME) AS               TM_DELTA_CPU_TIME                   ,
              TRIM(TM_DELTA_DB_TIME) AS                TM_DELTA_DB_TIME                    ,
              TRIM(DELTA_TIME) AS                       DELTA_TIME                         ,
              TRIM(DELTA_READ_IO_REQUESTS) AS          DELTA_READ_IO_REQUESTS              ,
              TRIM(DELTA_WRITE_IO_REQUESTS) AS         DELTA_WRITE_IO_REQUESTS             ,
              TRIM(DELTA_READ_IO_BYTES) AS             DELTA_READ_IO_BYTES                 ,
              TRIM(DELTA_WRITE_IO_BYTES) AS            DELTA_WRITE_IO_BYTES                ,
              TRIM(DELTA_INTERCONNECT_IO_BYTES) AS     DELTA_INTERCONNECT_IO_BYTES         ,
              TRIM(PGA_ALLOCATED) AS                    PGA_ALLOCATED                      ,
              TRIM(TEMP_SPACE_ALLOCATED) AS            TEMP_SPACE_ALLOCATED                
              from dump_dba_hist_ash_ext 
              ) a
       --  WHERE
       --      tm BETWEEN to_date('11/29/16 21:00', 'MM/DD/YY HH24:MI') AND to_date('11/29/16 23:30', 'MM/DD/YY HH24:MI')
    )
select sql_plan_hash_value,
                count(*),
        round(avg(EXTRACT(HOUR FROM run_time) * 3600
                    + EXTRACT(MINUTE FROM run_time) * 60
                    + EXTRACT(SECOND FROM run_time)),2) avg ,
        round(min(EXTRACT(HOUR FROM run_time) * 3600
                    + EXTRACT(MINUTE FROM run_time) * 60
                    + EXTRACT(SECOND FROM run_time)),2) min ,
        round(max(EXTRACT(HOUR FROM run_time) * 3600
                    + EXTRACT(MINUTE FROM run_time) * 60
                    + EXTRACT(SECOND FROM run_time)),2) max
from  (
        select
                       sql_id,
                       sql_exec_id,
                       sql_plan_hash_value,
                       max(tms) sql_exec_start,
               max(tm - tms) run_time
        from
               ash
        where
               tms is not null
               and sql_id = '&&sql_id.'
        group by sql_id,sql_exec_id,sql_plan_hash_value
       )
group by sql_plan_hash_value
/
-- union all
-- select  null,
--                 count(*),
--         round(avg(EXTRACT(HOUR FROM run_time) * 3600
--                     + EXTRACT(MINUTE FROM run_time) * 60
--                     + EXTRACT(SECOND FROM run_time)),2) avg ,
--         round(min(EXTRACT(HOUR FROM run_time) * 3600
--                     + EXTRACT(MINUTE FROM run_time) * 60
--                     + EXTRACT(SECOND FROM run_time)),2) min ,
--         round(max(EXTRACT(HOUR FROM run_time) * 3600
--                     + EXTRACT(MINUTE FROM run_time) * 60
--                     + EXTRACT(SECOND FROM run_time)),2) max
-- from  (
--         select
--                        sql_id,
--                        sql_exec_id,
--                        sql_plan_hash_value,
--                        max(sql_exec_start) sql_exec_start,
--                max(sample_time - sql_exec_start) run_time
--         from
--                gv$active_session_history
--         where
--                sql_exec_start is not null
--                and sql_id = '&&sql_id.'
--         group by sql_id,sql_exec_id,sql_plan_hash_value
--        )
-- /


