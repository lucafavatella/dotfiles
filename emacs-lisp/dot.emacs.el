;; Copyright (C) 2013-2015 Luca Favatella <slackydeb@gmail.com>

(column-number-mode t)
(menu-bar-mode -1)

(show-paren-mode t)
(transient-mark-mode t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)
;; Bootstrap use-package. Ref: http://www.lunaryorn.com/2015/01/06/my-emacs-configuration-with-use-package.html#automatic-package-installation
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package whitespace
  :init (global-whitespace-mode t)
  :config (setq whitespace-style '(face trailing tabs lines-tail))
  )

(use-package flymake-cursor)

(use-package erlang)
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
