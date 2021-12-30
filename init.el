;;; Init.el - Emacs configuration

;; User Info
(setq user-full-name "Ben Stannard")

;; Custom Settings
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(blink-cursor-mode 0)

;; Custom key-bindings
(global-set-key (kbd "C-x C-b") #'ibuffer) ;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x w") 'whitespace-mode) ;; toggle whitespace-mode
(defalias 'yes-or-no-p 'y-or-n-p) ;; y or n
;; (global-font-lock-mode 0) ;; turn off syntax coloring

;; Interactively do things
(ido-mode 1)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Show stray whitespace.
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)

;; Display the distance between two tab stops as 4 characters wide.
(setq-default tab-width 4)

;; Indentation setting for various languages.
(setq c-basic-offset 4)
(setq js-indent-level 2)
(setq css-indent-offset 2)

;; Highlight matching pairs of parentheses.
(setq show-paren-delay 0)
(show-paren-mode)

;; Write auto-saves and backups to separate directory.
(make-directory "~/.emacs.d/backup/" t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/backup/" t)))
(setq backup-directory-alist '(("." . "~/.emacs.d/backup/saves/")))

;; Enable installation of packages from MELPA. Stored under .emacs.d/elpa/
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; If use-package is not installed, automatically install
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; use-package macro install
(eval-when-compile
  (require 'use-package))

;; Libraries
(use-package avy
  :ensure t
  :bind ("C-x j" . avy-goto-word-or-subword-1)
  :config
  (setq avy-background t))

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode)))

;;; init.el ends here
