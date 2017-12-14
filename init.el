;;; init.el - Emacs configuration

;;; custom settings
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
;; (global-hl-line-mode +1)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") #'ibuffer)

;; Ido mode
(require 'ido)
(ido-mode t)

;; backup go to .saves
(setq backup-directory-alist `(("." . "~/.saves")))

;; toggle whitespace-mode
(global-set-key (kbd "M-S") 'whitespace-mode)

;; y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; MELPA
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Packages
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char-2)
  :config
  (setq avy-background t))

;;; init.el ends here
