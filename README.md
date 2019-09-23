# pull_dump_and_explore_ash
pull (from any database), dump (to your local machine), and explore ash


- Go to https://github.com/karlarao/pull_dump_and_explore_ash/tree/master/ash for the general workflow/HOWTO 
	- the DBA_HIST (historical) version of the tool is here https://github.com/karlarao/pull_dump_and_explore_ash/tree/master/ash_hist



# Example output 
- example_output_waitchains.txt 
	- example output of wait chains

> SQL> @dash_waitchains_ext session_id||'>>'||program2||'>>'||event2||'>>'||sql_id||'>>'||sql_opname||'>>'||p1text||'>>'||p1||'>>'||blocking_session 1=1

![](http://i.imgur.com/bY885Uh.png)


# HOWTO graph

![](http://i.imgur.com/WHUCK4z.gif)
