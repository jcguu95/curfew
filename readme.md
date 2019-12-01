# curfew

This script set restrictions on my digital usage.

## Configuration
+ Add the urls to be banned to `./list/url_list`.
+ Add the apps to be killed to `./list/app_list`.
+ Add the users to be suspended to `./list/user_list`.
+ Change fun-time, curfew-time, and day-without-restriction in `./main.sh`.

## Usage
1. Clone this repository to `/root/curfew/`.
2. Make executable and `chown` to `root:root`.
3. Let root run `/root/curfew/main.sh` at boot.
4. **Prevent yourself from root access by all means (critical)!**

## Loggings
All loggings go to `/root/curfew/log/`.
```
# example

current: 2019-07-21T14:35:53-04:00
message: curfew off for Sundays.
execute: unban_url
unban_url www.youtube.com
unban_url www.facebook.com
unban_url www.instagram.com
execute: continue_user
continue_user jin
current: 2019-07-21T14:35:58-04:00
message: curfew off for Sundays.
execute: unban_url
unban_url www.youtube.com
unban_url www.facebook.com
unban_url www.instagram.com
execute: continue_user
continue_user jin
current: 2019-07-21T14:36:03-04:00

```
