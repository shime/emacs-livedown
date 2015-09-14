# livedown.el

Emacs plugin for [Livedown](https://github.com/shime/livedown).

![](https://raw.githubusercontent.com/shime/livedown-demos/master/emacs.gif)

## Installation

First make sure you have [node](http://nodejs.org/) with [npm](https://www.npmjs.org/) installed.

Then install `livedown` with

    $ npm install -g livedown

Then install this plugin with

```shell
git clone https://github.com/shime/emacs-livedown.git ~/.emacs.d/emacs-livedown
cat <<EOF >> ~/.emacs.d/init.el
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-livedown"))
(require 'livedown)
EOF
```

## Configuration

This plugin uses some configurable variables, with the following defaults

```elisp
(custom-set-variables
 '(livedown:autostart nil) ; automatically open preview when opening markdown files 
 '(livedown:open t)        ; automatically open the browser window
 '(livedown:port 1337))    ; port for livedown server
```

Make sure to place them before the `require` line in your `init.el`.

You can also call the functions manually with

```elisp
M-x livedown:preview
M-x livedown:kill
```

Or for bonus points, define a keybinding with

```elisp
(global-set-key (kbd "C-M-m") 'livedown:preview)
```

## License

MIT
