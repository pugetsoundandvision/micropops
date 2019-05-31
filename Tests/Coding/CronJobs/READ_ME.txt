Creating CronJobs

run: 
$ crontab-ui

You will see the following output:

Node version: 10.8.0
Crontab UI is running at http://127.0.0.1:8000

Now, open your web browser and navigate to http://127.0.0.1:8000.

Here is a simple Cron Job:
10 * * * * /usr/bin/php /www/virtual/username/cron.php > /dev/null 2>&1


    The first part is "10 * * * *". This is where we schedule the timer.
    The rest of the line is the command as it would run from the command line.

Each asterix represents a unit of time, as follows:
Minute(0-59) Hour(0-24) Day_of_month(1-31) Month(1-12) Day_of_week(0-6)

Use MILITARY TIME!

This cron job will run every minute, all the time:
	
* * * * * [command]

This cron job will run at minute zero, every hour (i.e. an hourly cron job):
	
0 * * * * [command]

This is also an hourly cron job but run at minute 15 instead (i.e. 00:15, 01:15, 02:15 etc.):
	
15 * * * * [command]

This will run once a day, at 2:30am:
	
30 2 * * * [command]

This will run once a month, on the second day of the month at midnight (i.e. January 2nd 12:00am, February 2nd 12:00am etc.):
	
0 0 2 * * [command]

This will run on Mondays, every hour (i.e. 24 times in one day, but only on Mondays):
	
0 * * * 1 [command]

You can use multiple numbers separated by commas. This will run three times every hour, at minutes 0, 10 and 20:
	
0,10,20 * * * * [command]

Division operator is also used. This will run 12 times per hour, i.e. every 5 minutes:
	
*/5 * * * * [command]

Dash can be used to specify a range. This will run once every hour between 5:00am and 10:00am:
	
0 5-10 * * * [command]

Also there is a special keyword that will let you run a cron job every time the server is rebooted:
	
@reboot [command]

When you are finished editing your cronjob, click "Save to Crontab"

To see which cron jobs are set to run, run:
crontab -e

EXAMPLE:
0 22 * * * /Users/mipopsmac2/Desktop/Coding/CronJobs/Mac2_M2DHD_PI_Sync.sh
### At 10pm every night, this sync shell script will be executed.