# Tmux WAN status

Tmux plugin that enables displaying WAN status and IP for your workstation.

Inspider by [https://github.com/tmux-plugins/tmux-online-status](https://github.com/tmux-plugins/tmux-online-status)

Introduces a new `#{wan_status}` format.

This plugin is useful if:
- need to know external IP just to find you current location (very helpful after 5 flights in 3 days)
- you spend most of your time in Tmux and don't want to "switch" away from the terminal to check whether you're connected.
- you have a flaky internet connection and you don't want to be surprised when a simple `curl` or `wget` fails because the connection just broke.

### Usage

Add `#{wan_status}` format string to your existing `status-left` tmux option.


Here's the example in `.tmux.conf`:

    set -g status-left "#{wan_status} "

#### Configure icons
If the icons don't display well on your machine you can change them in
`.tmux.conf`:

    set -g @online_wan_icon "ok"
    set -g @offline_wan_icon "crap!"

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @tpm_plugins "                 \
      tmux-plugins/tpm                    \
      stonevil/tmux-wan-status            \
    "

Hit `prefix + I` to fetch the plugin and source it.

`#{wan_status}` interpolation should now work.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/stonevil/tmux-wan-status ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/wan_status.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

`#{wan_status}` interpolation should now work.

### Limitations

WAN status icon most likely won't be instant. The duration depends on the `status-interval` Tmux option. So, it might take anywhere between 5 and 60 seconds for WAN status icon to change.

Set `status-interval` to a low number to make this faster, example:

    # in .tmux.conf
    set -g status-interval 5

### Other plugins

You might also find these useful:

- [lan-status](https://github.com/stonevil/tmux-lan-status) - LAN status and IP
- [vm-status](https://github.com/stonevil/tmux-vm-status) - started Virtual Machines status

### License

[MIT](LICENSE.md)
