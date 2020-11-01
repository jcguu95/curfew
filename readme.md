# Through limit to freedom!

Self-control at the next-level by handling your root password to
someone else.

### Install

This dirty script set restrictions on my digital usage. Use at
your own risk! However, it's short an simple, so you can tweak
easily.

For it to work, this repo must stay in `/root`, so move it there
manually. Run `install` as root. This is going to start and
enable the script every time at boot as root.

### Uninstall

Run `uninstall` as root.

### Configuration

See examples in `./list`, change their names (e.g.
`.url_list.example` -> `url_list`), and config to your liking.

**WARNING**: The script is primitive. Make sure that no empty
lines are in the lists.

+ Add the urls to be banned to `./list/url_list`.
+ Add the apps to be killed to `./list/app_list`.
+ Add the users to be suspended to `./list/user_list`.

### Loggings

All logs go to `/root/curfew/log/`.

# TODOs

+ [ ] Inform users before doing anything.
