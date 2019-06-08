(setq load-prefer-newer t)

(menu-bar-mode t)

(require 'uniquify)
(setq-default uniquify-buffer-name-style 'forward)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(line-number-mode t)
(column-number-mode t)
(which-function-mode t)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(show-paren-mode t)
(transient-mark-mode t)

(setq-default indent-tabs-mode nil)

(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("gnu" . 2)
        ("melpa-stable" . 1)
        ("melpa" . 0)))
(setq package-enable-at-startup nil)
(package-initialize)
;; Bootstrap use-package. Ref: https://web.archive.org/web/20161116064333/https://www.lunaryorn.com/posts/my-emacs-configuration-with-use-package.html#section-automatic-package-installation
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key) ;; For any `use-package` `:bind` variant.
(require 'use-package-ensure) ;; For `use-package-always-ensure`.
(setq use-package-always-ensure t)
(setq use-package-verbose t)

(use-package epl
  :config (defun my-upgrade ()
            "Refresh archives and upgrade packages.
No error is signaled on failed refresh."
            (interactive)
            (epl-refresh)
            (epl-upgrade)))

(use-package whitespace
  :init (global-whitespace-mode t)
  :config (setq whitespace-style '(face trailing tabs lines-tail))
  )

(use-package multiple-cursors)

(use-package zenburn-theme
  :config (load-theme 'zenburn t)
  )

(use-package org
  :config
  (setq org-catch-invisible-edits 'show-and-error)
  (setq org-log-done 'time)
  )

(use-package editorconfig
  :config (editorconfig-mode 1))

(use-package yaml-mode)

(use-package plantuml-mode)

(use-package dumb-jump
  :bind (("M-g j" . dumb-jump-go)
         ;; No need to bind `dumb-jump-back` - just use `M-,` i.e. `xref-pop-marker-stack`.
         ))

(use-package erlang
  :init
  (setq exec-path (cons (car (file-expand-wildcards "~/dev/kerl/installations/OTP-19.*/bin")) exec-path))
  (add-to-list 'auto-mode-alist '("/\\(?:sys\\|rebar\\)\\.config\\(?:\\..*\\)?\\'" . erlang-mode)) ;; Ref https://github.com/legoscia/dotemacs/blob/55595dc38802fe362aa4c188318519ce44e975a1/dotemacs.org#sysconfig-and-rebarconfig-are-erlang
  :config
  ;; (require 'erlang-start) ;; Rely on autoload cookies. Ref https://github.com/erlang/otp/commit/1347e55f96714c4b9bd3eb1d378393c1592ab9ac
  (require 'erlang-flymake) ;; Ref for include files in erlang-flymake: https://github.com/legoscia/dotemacs/blob/master/dotemacs.org#try-harder-to-find-include-files-in-flymake
  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1)
  (help-at-pt-set-timer)
  )

;(add-to-list 'load-path "~/dev/distel/elisp")
;(require 'distel)
;(distel-setup)
