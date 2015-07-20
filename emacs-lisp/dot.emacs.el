;; Copyright (C) 2013 Luca Favatella <slackydeb@gmail.com>

(column-number-mode t)
(show-paren-mode t)
(transient-mark-mode t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default show-trailing-whitespace t)
;(require 'whitespace)

;; Refs:
;; * http://www.emacswiki.org/emacs/FlymakeCursor
;; * http://www.emacswiki.org/emacs/flymake-cursor.el
;; * http://www.emacswiki.org/emacs/download/flymake-cursor.el
(add-to-list 'load-path "~/.resources/emacs-lisp/flymake-cursor")
(require 'flymake-cursor)

;(push "~/prefix/otp/lib/erlang/lib/tools-2.6.11/emacs" load-path)
;(require 'erlang-start)
;(require 'erlang-flymake)
;(setq-default erlang-indent-level 2)

(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives
;	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; ???
;; Ref: ???
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
	   (lambda ()
	     (abbrev-mode 1)
	     (auto-fill-mode 1)
	     (if (eq window-system 'x)
		 (font-lock-mode 1))))
