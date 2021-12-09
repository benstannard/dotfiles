;;; Init.el - Emacs configuration

;; User Info
(setq user-full-name "Ben Stannard")

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


;; Indentation. copied from https://dougie.io/emacs/indentation/
;; START TABS CONFIG
;; Create a variable for our preferred tab width
(setq custom-tab-width 2)

;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs  ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

;; Hooks to Enable Tabs and Disable
(add-hook 'prog-mode-hook 'enable-tabs)
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)

;; Language-Specific Tweaks
(setq-default js-indent-level custom-tab-width)      ;; Javascript
;; (setq-default python-indent-offset custom-tab-width) ;; Python










;; 48 Emacs Lisp Packages
;; Emacs is extended by implementing additional features in packages, which are Emacs Lisp libraries.
;; These could be written by you or provided by someone else.
;; package.el is the built in package manager in Emacs 24.1+
;; setup config to download from MELPA https://melpa.org/#/getting-started
(require 'package)
(setq package-enable-at-startup nil) ;; 2021/01/16 not sure
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; M-x package-refresh-contents, M-x package-install RET use-package RET
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package avy
  :ensure t
  :bind ("C-x j" . avy-goto-word-or-subword-1)
  :config
  (setq avy-background t))


(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))




;; (use-package magit
;;   :ensure t
;;  :init (message "Loading Magit...")
;;  :bind ("C-x g" . magit-status))


;; (put 'upcase-region 'disabled nil)
;; (put 'narrow-to-region 'disabled nil)
;; (put 'narrow-to-page 'disabled nil)

;;; init.el ends here

