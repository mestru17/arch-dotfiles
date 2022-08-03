# arch-dotfiles
My Arch Linux dotfiles.

## Dependencies
Some dotfiles depend on certain third party packages being installed and might not work otherwise. The following table shows the depencies of each dotfile.
| Dotfile(s) | Dependencies | Installation |
| --- | --- | --- |
| .bashrc | [exa](https://github.com/ogham/exa), [git](https://git-scm.com), [starship](https://starship.rs) | `sudo pacman -S exa git starship` |
| .xprofile | [xorg-server](https://archlinux.org/packages/extra/x86_64/xorg-server/), [xorg-apps](https://archlinux.org/groups/x86_64/xorg-apps/), [nitrogen](https://archlinux.org/packages/extra/x86_64/nitrogen/), [picom](https://github.com/yshui/picom) | `sudo pacman -S xorg-server xorg-apps, nitrogen, picom` |
| .config/alacritty/alacritty.yml | [nerd-fonts-fira-code](https://aur.archlinux.org/packages/nerd-fonts-fira-code) | `yay -S nerd-fonts-fira-code` |
| .config/nitrogen/\* | [archlinux-wallpaper](https://archlinux.org/packages/community/any/archlinux-wallpaper/) | `sudo pacman -S archlinux-wallpaper` |
| .config/starship.toml | [ttf-font-awesome](https://archlinux.org/packages/community/any/ttf-font-awesome/) | `sudo pacman -S ttf-font-awesome` |

To install all dependencies at once, run the following (NOTE: This will not set up and configure Xorg (`xorg-server`) properly. You should probably do so manually and not with these commands; the same goes for if
you use Wayland. In either case, you can safely exclude `xorg-server` and `xorg-apps` from the commands below):
```bash
sudo pacman -S exa git starship xorg-server xorg-apps nitrogen picom archlinux wallpaper ttf-font-awesome
yay -S nerd-fonts-fira-code
```

## Installation
Make sure to install dependencies for the dotfiles that you need as explained in [Dependencies](#dependencies).

Then run:
```bash
curl -L https://raw.githubusercontent.com/mestru17/arch-dotfiles/master/install_dotfiles | bash
```

This runs the install script which handles cloning the repository properly. That is, it clones the repository as a bare repository, pulls the dotfiles, and configures it to not show untracked files when using
`git` commands. This is to prevent bloating the `git` commands with other home directory files that are not dotfiles.

After sourcing `.bashrc` or opening a new bash shell, you are then able to track the dotfiles with the new `config` alias. It works exactly like `git` but just in a way that it works with the locations of the
dotfiles and their bare repository. So if you run `config status`, for example, it is exactly equivalent to running `git status` but for your dotfile repository. Do not use normal `git` commands for the dotfiles
- only use `config`.
