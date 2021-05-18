# Basic Usage

This repository uses GNU stow to manage dotfiles and other configuration files. To populate ~/.vimrc, ~/.bashrc, and various files in the ~/.config/*/ directories, you clone this repository in your home directory and run stow like so:

```bash
stow --dotfiles vim
stow --dotfiles bash
stow --dotfiles alacritty
```

This takes advantage of the fact that `stow`'s default target directory is the parent of the current working directory. The `--dotfiles` flag tells stow to treat source files with the name `dot-*` in a special way: instead of creating a symbolic link in the target directory with the same name as the source file, `stow` will first replace the `dot-` prefix with a literal `.`. For example, `dot-vimrc` will be pointed to by `.vimrc`.

To stow files in other directories, you can provide stow with an explicit target directory, e.g.:

```bash
stow --target /home/other-user/ vim
```

This will create a symbolic link from /home/other-user/dot-vimrc to vim/dot-vimrc.

You can always check `stow`'s man pages for more details.

# Bootstrap

This repository will also contain a bootstrap script that will stow the most commonly used dotfiles and print a list of the remaining packages to be stowed.
