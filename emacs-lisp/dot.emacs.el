;; Copyright (C) 2013-2015 Luca Favatella <slackydeb@gmail.com>

(column-number-mode t)
(menu-bar-mode -1)

(show-paren-mode t)
(transient-mark-mode t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default show-trailing-whitespace t)

;; Ref http://www.lunaryorn.com/2015/01/06/my-emacs-configuration-with-use-package.html
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;
(require 'use-package)

;; Refs:
;; * http://www.emacswiki.org/emacs/EightyColumnRule#toc5
;; * https://www.gnu.org/software/emacs/manual/html_node/emacs/Useless-Whitespace.html
(use-package
 whitespace
 :init (global-whitespace-mode t)
 :config (setq whitespace-style '(face trailing tabs lines-tail))
 )

(use-package flymake-cursor :ensure t)

(use-package erlang :ensure t)
(setq exec-path (cons "~/dev/kerl/installations/17.3/bin" exec-path))
(require 'erlang-start)
(require 'erlang-flymake)
;; Ref for include files in erlang-flymake: https://github.com/legoscia/dotemacs/blob/master/dotemacs.org#try-harder-to-find-include-files-in-flymake

;; Ref: www.emacswiki.org/emacs/BuildTags
;(defun create-tags (dir-name)
;  "Create tags file."
;  (interactive "Directory: ")
;  (eshell-command
;   (format "find %s -type f | etags -" dir-name)))

;(add-to-list 'load-path "~/dev/distel/elisp")
;(require 'distel)
;(distel-setup)
