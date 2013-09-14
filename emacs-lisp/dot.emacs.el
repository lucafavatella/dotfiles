;; Copyright 2013 Luca Favatella

;; haskell-mode
;; Ref: https://github.com/haskell/haskell-mode
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-mode-hook (quote (turn-on-haskell-indentation))))
