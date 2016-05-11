# Javier Blanco config files

These are config files to set up a system the way I like it.

I am running on Mac OS X, but it will likely work on Linux as well.

## Installation

Run the following commands in your terminal.

```bash
$ chsh -s $(which zsh)
$ git clone https://github.com/jbgutierrez/config.git
$ rake
$ ./osx.sh
$ vim +PlugInstall +qall
```

Install Command Line Tools, try running `xcode-select --install` on
terminal and follow the instructions.  If it fails, open Xcode.app,
select from the menu "Xcode" - "Open Developer Tool" - "More Developer
Tools" to open the developer site, download the installer for your OS
version and run it.

Then run `provision-*.sh` to install development tools, interpreters, etc.

```bash
$ ./provision.sh
```

### Vim Plugin updates

Remember to run :PlugInstall from time to time to keep vim plugins up-to-date.

Enjoy.
