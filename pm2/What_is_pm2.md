## PM2

PM2 (advanced process manager 2) is a JavaScript application that allows you to start, stop and control node applications quickly, as well as re-run applications automatically after a crash or reboot, minimising downtime.

Additionally, PM2 can restart the application once changes are made, similar to ReactJS, and can provide information on resource usage and performance of your application.

### Useful commands

Starting application in PM2.

``` 
pm2 start app.js
```
You can use the following options to get more info/other uses:
- `--name`: Names your app something different to the filename in the PM2 processes list.
- `--watch`: Restarts app when files are changed.
- `--log`: Logs errors to defined log file.
- `--max-memory-restart <value>`: Sets max memory the application can use.

There are many ways you can manage your applications on PM2.

You can:
- Restart app: `pm2 restart <name>`
- Stop app: `pm2 stop <name>`
- Restart all app: `pm2 restart all`
- List all PM2 managed apps: `pm2 list`
- Delete app from list of PM2 managed applications: `pm2 delete <name>`
- Monitor apps with PM2: `pm2 monit`