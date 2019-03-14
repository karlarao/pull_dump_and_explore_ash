--------------------------------------------------------------------------------
--
-- File name:   ashtop.sql v1.1
-- Purpose:     Display top ASH time (count of ASH samples) grouped by your
--              specified dimensions
--              
-- Author:      Tanel Poder
-- Copyright:   (c) http://blog.tanelpoder.com
--              
-- Usage:       
--     @ashtop <grouping_cols> <filters> <fromtime> <totime>
--
-- Example:
--     @ashtop username,sql_id session_type='FOREGROUND' sysdate-1/24 sysdate
--
-- Other:
--     This script uses only the in-memory V$ACTIVE_SESSION_HISTORY, use
--     @dashtop.sql for accessiong the DBA_HIST_ACTIVE_SESS_HISTORY archive
--              
--------------------------------------------------------------------------------
COL "%This" FOR A7
--COL p1     FOR 99999999999999
--COL p2     FOR 99999999999999
--COL p3     FOR 99999999999999
COL p1text      FOR A30 word_wrap
COL p2text      FOR A30 word_wrap
COL p3text      FOR A30 word_wrap
COL p1hex       FOR A17
COL p2hex       FOR A17
COL p3hex       FOR A17
COL AAS         FOR 9999.9
COL totalseconds HEAD "Total|Seconds" FOR 99999999
COL event       FOR A40 
COL event2      FOR A40 
COL username    FOR A20 wrap
COL obj         FOR A30
COL objt        FOR A50
COL sql_opname  FOR A20
COL top_level_call_name FOR A30
COL wait_class  FOR A15
COL instance_number FOR A5
COL module FOR A30
COL sql_id FOR A20

WITH 
ash AS (SELECT 
            a.*
        FROM 
            (
              select
              TRIM(INSTNAME) AS                        INSTNAME                            ,
              TRIM(INST_ID) AS                 INSTANCE_NUMBER                     ,
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
              from dump_dba_ash_ext 
              ) a
       --  WHERE
       --      tm BETWEEN to_date('11/29/16 21:00', 'MM/DD/YY HH24:MI') AND to_date('11/29/16 23:30', 'MM/DD/YY HH24:MI')
    )
SELECT * FROM (
    WITH bclass AS (SELECT class, ROWNUM r from v$waitstat)
    SELECT /*+ LEADING(a) USE_HASH(u) */
        COUNT(*)                                                     totalseconds
      , ROUND(COUNT(*) / ((CAST(&4 AS DATE) - CAST(&3 AS DATE)) * 86400), 1) AAS
      , LPAD(ROUND(RATIO_TO_REPORT(COUNT(*)) OVER () * 100)||'%',5,' ')||' |' "%This"
      , &1
      , TO_CHAR(MIN(cast(sample_time as timestamp)), 'YYYY-MM-DD HH24:MI:SS') first_seen
      , TO_CHAR(MAX(cast(sample_time as timestamp)), 'YYYY-MM-DD HH24:MI:SS') last_seen
--    , MAX(sql_exec_id) - MIN(sql_exec_id)
      , COUNT(DISTINCT sql_exec_start||':'||sql_exec_id) dist_sqlexec_seen
    FROM
        (SELECT
             a.*
           , TO_CHAR(CASE WHEN session_state = 'WAITING' THEN p1 ELSE null END, '0XXXXXXXXXXXXXXX') p1hex
           , TO_CHAR(CASE WHEN session_state = 'WAITING' THEN p2 ELSE null END, '0XXXXXXXXXXXXXXX') p2hex
           , TO_CHAR(CASE WHEN session_state = 'WAITING' THEN p3 ELSE null END, '0XXXXXXXXXXXXXXX') p3hex
           , NVL(event, session_state)||
                CASE WHEN a.event IN ('buffer busy waits', 'gc buffer busy', 'gc buffer busy acquire', 'gc buffer busy release')
                --THEN ' ['||CASE WHEN (SELECT class FROM bclass WHERE r = a.p3) IS NULL THEN ||']' ELSE null END event2 -- event is NULL in ASH if the session is not waiting (session_state = ON CPU)
                THEN ' ['||CASE WHEN a.p3 <= (SELECT MAX(r) FROM bclass) 
                           THEN (SELECT class FROM bclass WHERE r = a.p3)
                           ELSE (SELECT DECODE(MOD(BITAND(a.p3,TO_NUMBER('FFFF','XXXX')) - 17,2),0,'undo header',1,'undo data', 'error') FROM dual)
                           END  ||']' 
                ELSE null END event2 -- event is NULL in ASH if the session is not waiting (session_state = ON CPU)
        FROM ash a) a
    WHERE &2
AND cast(sample_time as timestamp) BETWEEN &3 AND &4    
GROUP BY
        &1
    ORDER BY
        TotalSeconds DESC
       , &1
)
WHERE
    ROWNUM <= 20
/


