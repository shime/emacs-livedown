# livedown.el

Emacs plugin for [Livedown](https://github.com/shime/livedown).

## Installation

First make sure you have [node](http://nodejs.org/) with [npm](https://www.npmjs.org/) installed.

Then install `livedown` with

    $ npm install -g livedown

Then install this plugin with

```shell
git clone git@github.com:shime/emacs-livedown.git ~/.emacs.d/emacs-livedown
cat <<EOF >> ~/.emacs.d/init.el
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-livedown"))
(require 'livedown)
EOF
```

## Configuration

This plugin uses some configurable variables, with the following defaults

```elisp
(custom-set-variables
 '(livedown:open t)     ; automatically open the browser window
 '(livedown:port 1337)) ; port for livedown server
```

You can also call the open/kill functions manually with

```elisp
M-x livedown:preview
M-x livedown:kill
```

## License

MIT
