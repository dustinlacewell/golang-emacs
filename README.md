# Golang support for Emacs

If you:


  1. Have Emacs
  2. Have Docker

Then, this package will allow you to do Golang development in Emacs with completion and other features, without having Golang installed on your system.

Make sure you are in the `docker` group.


### 0. Create side-`$GOPATH`:

    $ cd ~
    $ export GOPATH="$HOME/temp-gopath"
    $ mkdir -p "$GOPATH/bin"


### 1. Install golang-emacs:


    $ cd $GOPATH
    $ git clone git@github.com:dustinlacewell/golang-emacs.git .emacs.d


### 2. Add new `bin` directories to your `$PATH`


Add these to the **FRONT** of your `$PATH`, so that these binaries are found before your system-installed or current `$GOPATH/bin` binaries. This *should* completely shadow any existing go installation or `$GOPATH` state on your system.


    $ export PATH="$GOPATH/.emacs.d/bin:$GOPATH/bin:$PATH"
    
    
You can check that the *pseudo-binaries* are now available with the `which` command:

    
    $ which go
    /home/username/temp-gopath/.emacs.d/bin/go
    
    
**Note:** for these changes to persist, you'll need to make the related changes to your `.bashrc` file.
    

### 3. Install the following go packages:


    go get -u golang.org/x/tools/cmd/goimports
    go get -u github.com/golang/lint/golint
    go get -u github.com/nsf/gocode
    
    
The newly built installed binaries should now be available through the side-`$GOPATH`:

    $ which goimports
    /home/username/temp-gopath/bin/goimports
    
    
**Note:** while the built `gocode` binary is installed to the side-`$GOPATH/bin` folder as usual, this project provides a *pseudo-binary* that emacs will find and utilize. It provides some compability support for doing completion over the container boundry. 
    
    
    $ which gocode
    /home/username/temp-gopath/.emacs.d/bin/go
    

Now you can run emacs with the provided configuration. *It will download
packages on the first run*:


    cd $GOPATH
    emacs -q -l .emacs.d/init.el
    
    
**Note:** *as of now, emacs must be launched from `$GOPATH` because my elisp sucks.*



![Screenshot](http://i.imgur.com/WIPJXgg.png)
