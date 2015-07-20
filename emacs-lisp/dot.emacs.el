;; Copyright (C) 2013-2015 Luca Favatella <slackydeb@gmail.com>

(column-number-mode t)
(menu-bar-mode -1)

(show-paren-mode t)
(transient-mark-mode t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default show-trailing-whitespace t)

;; Ref: http://www.emacswiki.org/emacs/EightyColumnRule#toc5
;; Ref 2: https://www.gnu.org/software/emacs/manual/html_node/emacs/Useless-Whitespace.html
(require 'whitespace)
;(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-style '(face lines-tail))
;(setq whitespace-style '(face trailing tabs spaces lines newline empty))
(global-whitespace-mode t)

;; Refs:
;; * http://www.emacswiki.org/emacs/FlymakeCursor
;; * http://www.emacswiki.org/emacs/flymake-cursor.el
;; * http://www.emacswiki.org/emacs/download/flymake-cursor.el
(add-to-list 'load-path "~/.resources/emacs-lisp/flymake-cursor")
(require 'flymake-cursor)

;; Ref: www.emacswiki.org/emacs/BuildTags
;(defun create-tags (dir-name)
;  "Create tags file."
;  (interactive "Directory: ")
;  (eshell-command
;   (format "find %s -type f | etags -" dir-name)))

;(push "~/prefix/otp/lib/erlang/lib/tools-2.6.11/emacs" load-path)
;(require 'erlang-start)
;(require 'erlang-flymake)
;(setq-default erlang-indent-level 2)
