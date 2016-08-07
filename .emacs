;; Copyright (C) 2013-2015 Luca Favatella <slackydeb@gmail.com>

(menu-bar-mode -1)

(line-number-mode t)
(column-number-mode t)

(show-paren-mode t)
(transient-mark-mode t)

(setq-default indent-tabs-mode nil)

(require 'uniquify)
(setq-default uniquify-buffer-name-style 'forward)

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
(setq use-package-verbose t)

(use-package whitespace
  :init (global-whitespace-mode t)
  :config (setq whitespace-style '(face trailing tabs lines-tail))
  )

(use-package multiple-cursors)

(use-package flymake-cursor)

(use-package zenburn-theme
  :config (load-theme 'zenburn t)
  )

;; (use-package flycheck-package) ;; For MELPA recipes.

(use-package yaml-mode)

;(use-package puml-mode)

(use-package ggtags)

(use-package erlang
  :init (setq exec-path (cons (car (file-expand-wildcards "~/dev/kerl/installations/OTP-19.*/bin")) exec-path))
  :config
  ;; (require 'erlang-start) ;; Rely on autoload cookies. Ref https://github.com/erlang/otp/commit/1347e55f96714c4b9bd3eb1d378393c1592ab9ac
  (require 'erlang-flymake) ;; Ref for include files in erlang-flymake: https://github.com/legoscia/dotemacs/blob/master/dotemacs.org#try-harder-to-find-include-files-in-flymake
  )

;(add-to-list 'load-path "~/dev/distel/elisp")
;(require 'distel)
;(distel-setup)
