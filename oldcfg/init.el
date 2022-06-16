;;; Init.el - Emacs configuration
;; NOTES TO SELF
;; 2022-05-07: You are using el-get now. Use el-get-install to install packages. So far, pretty great!
;; 2022-05-07: use-package macro is for configuration
;; 2022-05-07: Switched over to Vim. Could figure out simple spacing for SQL

;; User Info
(setq user-full-name "Ben Stannard")

;; Custom Settings
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(blink-cursor-mode 0)
(defalias 'yes-or-no-p 'y-or-n-p)
(global-font-lock-mode 0) ;; turn off syntax coloring
(setq column-number-mode t)

;; Custom key-bindings
(global-set-key (kbd "C-x C-b") #'ibuffer) ;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x w") 'whitespace-mode) ;; toggle whitespace-mode

;; Interactively do things
(ido-mode 1)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Highlight matching pairs of parentheses.
(setq show-paren-delay 0)
(show-paren-mode)

;; Show stray whitespace.
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)

;; Use spaces, not tabs, for indentation.
;; (setq-default indent-tabs-mode nil)

;; Display the distance between two tab stops as 4 characters wide.
;; (setq-default tab-width 4)

;; Indentation setting for various languages.
;; (setq c-basic-offset 4)
;; (setq js-indent-level 2)
;; (setq css-indent-offset 2)

;; Write auto-saves and backups to separate directory.
(make-directory "~/.emacs.d/backup/" t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/backup/" t)))
(setq backup-directory-alist '(("." . "~/.emacs.d/backup/saves/")))

;; Enable installation of packages from MELPA. Stored under .emacs.d/elpa/
;; (require 'package)
;; (package-initialize)

;; Alt Basic Setup via MELPA for el-get at https://github.com/dimitri/el-get/blob/master/README.md
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

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
