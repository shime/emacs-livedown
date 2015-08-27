;;; livedown.el --- Realtime Markdown previews for Emacs.

;; Copyright (C) 2014 Hrvoje Simic

;; Author: Hrvoje Simic <shime.ferovac@gmail.com>
;; Version: 1.0.0
;; Keywords: markdown, preview, live
;; URL: https://github.com/shime/emacs-livedown

;;; Commentary:

;; Realtime Markdown previews for Emacs.

(defgroup livedown nil
  "Realtime Markdown previews"
  :group 'livedown
  :prefix "livedown:")

(defcustom livedown:port 1337
  "Port on which livedown server will run."
  :type 'integer
  :group 'livedown)

(defcustom livedown:open t
  "Open browser automatically."
  :type 'boolean
  :group 'livedown)

(defcustom livedown:browser nil
  "Open alternative browser."
  :type 'string
  :group 'livedown)

(defcustom livedown:autostart nil
  "Auto-open previews when opening markdown files."
  :type 'boolean
  :group 'livedown)

(defun livedown:preview ()
    "Preview the current file in livedown."
    (interactive)

   (call-process-shell-command
             (format "livedown stop --port %s &"
                            livedown:port))

        (start-process-shell-command
            (format "emacs-livedown")
            (format "emacs-livedown-buffer")
            (format "livedown start %s --port %s %s %s "
                            buffer-file-name
                            livedown:port
                            (if livedown:browser (concat "--browser " livedown:browser) "")
                            (if livedown:open "--open" "")))
        (print (format "%s rendered @ %s" buffer-file-name livedown:port) (get-buffer "emacs-livedown-buffer")))

(defun livedown:kill ()
    "Stops the livedown process."
      (interactive)
        (call-process-shell-command
             (format "livedown stop --port %s &"
                            livedown:port)))

(if livedown:autostart
  (eval-after-load 'markdown-mode '(livedown:preview)))

(add-hook 'kill-emacs-query-functions (lambda () (livedown:kill)))

(provide 'livedown)
