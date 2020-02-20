--useful postgresql queries

--show time spent
\timing on            

--https://gist.github.com/rgreenjr/3637525
-- kill running query
SELECT pg_cancel_backend(procpid);

-- kill idle query
SELECT pg_terminate_backend(procpid);

SELECT 
    datid,
    datname,
    pid, 
    usesysid,
    usename, 
    application_name,
    client_addr
    client_port,
    backend_start,
    xact_start,
    query_start,
    age(clock_timestamp(), query_start) AS query_age,
    state_change,
    waiting,
    state,
    backend_xid,
    backend_xmin,
    query
     
FROM pg_stat_activity 
--WHERE query != '<IDLE>' AND query NOT ILIKE '%pg_stat_activity%' 
WHERE datname = 'nsi_N3NSI17_2405'
--ORDER BY query_start desc;

--kill all in current DATABASE
DO 
$$
DECLARE 
	v_pid integer;
BEGIN	

FOR v_pid IN
SELECT pid
FROM pg_stat_activity 
WHERE query != '<IDLE>' AND query NOT ILIKE '%pg_stat_activity%' 
LOOP

	rAISE NOTICE 'killing %', v_pid;
	PERFORM pg_terminate_backend(v_pid);
END LOOP;


END;
$$;


select * from pg_user;


-- databases with thir sizes
select datname, pg_size_pretty(pg_database_size(datname))
from pg_database
order by pg_database_size(datname) desc;

--------------------------------------------------------------------------------
--https://wiki.postgresql.org/wiki/Lock_Monitoring
--Сombination of blocked and blocking activity

SELECT blocked_locks.pid     AS blocked_pid,
         blocked_activity.usename  AS blocked_user,
         blocking_locks.pid     AS blocking_pid,
         blocking_activity.usename AS blocking_user,
         blocked_activity.query    AS blocked_statement,
         blocking_activity.query   AS current_statement_in_blocking_process
   FROM  pg_catalog.pg_locks         blocked_locks
    JOIN pg_catalog.pg_stat_activity blocked_activity  ON blocked_activity.pid = blocked_locks.pid
    JOIN pg_catalog.pg_locks         blocking_locks 
        ON blocking_locks.locktype = blocked_locks.locktype
        AND blocking_locks.DATABASE IS NOT DISTINCT FROM blocked_locks.DATABASE
        AND blocking_locks.relation IS NOT DISTINCT FROM blocked_locks.relation
        AND blocking_locks.page IS NOT DISTINCT FROM blocked_locks.page
        AND blocking_locks.tuple IS NOT DISTINCT FROM blocked_locks.tuple
        AND blocking_locks.virtualxid IS NOT DISTINCT FROM blocked_locks.virtualxid
        AND blocking_locks.transactionid IS NOT DISTINCT FROM blocked_locks.transactionid
        AND blocking_locks.classid IS NOT DISTINCT FROM blocked_locks.classid
        AND blocking_locks.objid IS NOT DISTINCT FROM blocked_locks.objid
        AND blocking_locks.objsubid IS NOT DISTINCT FROM blocked_locks.objsubid
        AND blocking_locks.pid != blocked_locks.pid
 
    JOIN pg_catalog.pg_stat_activity blocking_activity ON blocking_activity.pid = blocking_locks.pid
   WHERE NOT blocked_locks.GRANTED;
