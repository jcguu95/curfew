# Through limit to freedom!

Self-control at the next-level by giving your root password to
someone else.

This script set restrictions on my digital usage. My shell-foo is
at a noob level (please feel free to educate me), so use at your
own risk!  However, it's short and simple, so can be tweaked
easily.

### (Un)install

For it to work, this repo must stay in `/root`. So move it there
manually. Run `install` as root. This *will start and enable* the
script every time at boot as root. Reboot and start seeing its
effect.

To uninstall, run `uninstall` as root.

### Usage + Configuration

See examples in `./list`, change their names (e.g.
`.url_list.example` -> `url_list`), and config to your liking.

**WARNING**: The script is primitive. Make sure that no empty
lines are in the lists.

+ Add the urls to be banned to `./list/url_list`.
+ Add the apps to be killed to `./list/app_list`.
+ Add the users to be suspended to `./list/user_list`.

To configure curfew time, alter the `main` shell script directly.

### Loggings

All logs go to `/root/curfew/log/`.

# TODOs

+ [ ] Inform users before doing anything.
+ [ ] I'm sure the solution isn't perfect. Please let me know how
  it can be harden.
+ [ ] Report any errors and warnings (loudly) at the end.
