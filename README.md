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
$ vim -c "BundleInstall" -c "bufdo :q"
```

### Vim Plugin updates

Remember to run :BundleUpdate from time to time to keep vim plugins up-to-date.

Enjoy.
