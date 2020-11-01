# curfew

*Motto: Through limit to freedom!*

## Install

This dirty script set restrictions on my digital usage. Use at
your own risk!

Manuall move this repo into `/root/`. Run `install` as root.

## Configuration

See examples in `./list`, change their names (e.g.
`.url_list.example` -> `url_list`), and config to your liking.
**WARNING**: The script is primitive.  Make sure that no empty
lines are in the lists.

+ Add the urls to be banned to `./list/url_list`.
+ Add the apps to be killed to `./list/app_list`.
+ Add the users to be suspended to `./list/user_list`.

## Loggings

All logs go to `/root/curfew/log/`.
