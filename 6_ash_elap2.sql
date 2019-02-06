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
order by tms desc
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


