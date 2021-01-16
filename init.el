;;; Init.el - Emacs configuration

;; User Info
(setq user-full-name "Ben Stannard")
(setq user-mail-address "ben.stannard@gmail.com")

;; Custom Settings
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(global-font-lock-mode 0) ;; turn off syntax coloring
(global-set-key (kbd "C-x C-b") #'ibuffer) ;; replace buffer-menu with ibuffer
(defalias 'yes-or-no-p 'y-or-n-p) ;; y or n
(require 'ido) ;; Ido mode
(ido-mode t)
(global-set-key (kbd "C-x w") 'whitespace-mode) ;; toggle whitespace-mode
(setq backup-directory-alist `(("." . "~/.saves")))

;; 48 Emacs Lisp Packages
;; Emacs is extended by implementing additional features in packages, which are Emacs Lisp libraries.
;; These could be written by you or provided by someone else.
;; package.el is the built in package manager in Emacs 24.1+
;; MELPA https://melpa.org/#/getting-started
(require 'package)
(setq package-enable-at-startup nil) ;; 2021/01/16 not sure
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; M-x package-refresh-contents, M-x package-install RET use-package RET
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Package configuration with use-package
(use-package avy
  :ensure t
  :bind ("C-x j" . avy-goto-word-or-subword-1)
  :config
  (setq avy-background t))

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-engines-alist
	'(("django"    . "\\.html\\'")))
  (setq web-mode-ac-sources-alist
	'(("css" . (ac-source-css-property))
	  ("html" . (ac-source-words-in-buffer ac-source-abbrev)))))

;;; init.el ends here
