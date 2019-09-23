# pull_dump_and_explore_ash
pull (from any database), dump (to your local machine), and explore ash


- Go to https://github.com/karlarao/pull_dump_and_explore_ash/tree/master/ash for the general workflow/HOWTO 
	- the DBA_HIST (historical) version of the tool is here https://github.com/karlarao/pull_dump_and_explore_ash/tree/master/ash_hist

- This toolkit captures the following ASH goodies: 
	- myash*csv (csv dump of ash data which can be graphed in tableau)
	- waitchains_ext*sql (wait chains scripts)
	- ash_elap*sql (get ash wall clock elapsed times)
	- ashtop*sql (ashtop to get topn across ash dimensions)


# Example output 
- example output of wait chains (example_output_waitchains.txt)

> SQL> @dash_waitchains_ext session_id||'>>'||program2||'>>'||event2||'>>'||sql_id||'>>'||sql_opname||'>>'||p1text||'>>'||p1||'>>'||blocking_session 1=1

![](http://i.imgur.com/bY885Uh.png)


# HOWTO graph

![](http://i.imgur.com/WHUCK4z.gif)
