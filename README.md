# Golang support for Emacs

Make sure you have Docker installed and are in the `docker` group.


### 1. Install golang-emacs:


    cd $GOPATH
    git clone git@github.com:dustinlacewell/golang-emacs.git .emacs.d


### 2. Add `$GOPATH/.emacs.d/bin` to your `$PATH`

### 3. Install the following go packages:


    go get -u golang.org/x/tools/cmd/goimports
    go get -u github.com/golang/lint/golint
    go get -u github.com/nsf/gocode


Now you can run emacs with the provided configuration. *It will download
packages on the first run*:


    cd $GOPATH
    emacs -q -l golang-emacs/init.el



![Screenshot](http://i.imgur.com/WIPJXgg.png)
