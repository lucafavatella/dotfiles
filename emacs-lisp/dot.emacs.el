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

(push "~/dev/kerl/installations/17.3/lib/tools-2.7/emacs" load-path)
(setq erlang-root-dir "~/dev/kerl/installations/17.3")
(setq exec-path (cons "~/dev/kerl/installations/17.3/bin" exec-path))
(require 'erlang-start)
(setq-default erlang-indent-level 4)

(require 'erlang-flymake)
;; Ref for include files in erlang-flymake: https://github.com/legoscia/dotemacs/blob/master/dotemacs.org#try-harder-to-find-include-files-in-flymake

(add-to-list 'load-path "~/dev/distel/elisp")
(require 'distel)
(distel-setup)
