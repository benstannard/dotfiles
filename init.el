;; Thank you jwiegley, belak, gamedolphin, many others. Some nice sources below:
;; https://github.com/jwiegley/use-package
;; https://gist.github.com/belak/ca1c9ae75e53324ee16e2e5289a9c4bc
;; https://raw.githubusercontent.com/gamedolphin/.emacs.d/master/init.el
;; https://medium.com/@zac.wood9/a-beginners-emacs-config-44400bcf54a1

;; User
(setq user-full-name "Ben Stannard")

;; Ensure backups make it to a different folder so we don't litter all everywhere
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;; Custom key-bindings
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

;; Preferences
(setq inhibit-startup-screen t)
(setq-default show-trailing-whitespace t) ;; Show stray whitespace.
(setq-default indicate-empty-lines t)
(setq ring-bell-function 'ignore) ;; No visual bell please
(show-paren-mode 1) ;; Show parens
(menu-bar-mode -1) ;; No Menu Bar
(tool-bar-mode -1) ;; No Tool Bar
(xterm-mouse-mode 1) ;; Support the mouse and colors in the terminal
(fset 'yes-or-no-p 'y-or-n-p) ;; Make it so you only need to type 'y' or 'n' not 'yes' or 'no'
(blink-cursor-mode -1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)
(global-hl-line-mode +1)

;; Add melpa to the package list and initialize our package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure and load use-package
(setq use-package-always-ensure t)
(eval-when-compile
  (defvar use-package-verbose t)
  (require 'use-package))

;; Packages
(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t
        sml/theme 'light)
  (sml/setup))

(use-package ido
  :config
  ;; smex is a better replacement for M-x
  (use-package smex
    :bind
    ("M-x" . smex)
    ("M-X" . smex-major-mode-commands))

  ;; Use ido everywhere we can
  ;; (use-package ido-ubiquitous
  ;;   :config
  ;;   (ido-ubiquitous-mode 1))

  ;; This makes ido work vertically
  (use-package ido-vertical-mode
    :config
    (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right
          ido-vertical-show-count t)
    (ido-vertical-mode 1))

  ;; This adds flex matching to ido
  (use-package flx-ido
    :config
    (flx-ido-mode 1)
    (setq ido-enable-flex-matching t
          flx-ido-threshold 1000))

  ;; Turn on ido everywhere we can
  (ido-mode 1)
  (ido-everywhere 1)

  (setq resize-mini-windows t
        ido-use-virtual-buffers t
        ido-auto-merge-work-directories-length -1))

(use-package avy
  :ensure t
  :bind ("C-x j" . avy-goto-word-or-subword-1)
  :config
  (setq avy-background t))

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history nil))

(use-package diff-hl
  :config
  ;; We only need diff-hl-margin-mode if we're in a terminal.
  (global-diff-hl-mode 1)
  (unless (window-system)
    (diff-hl-margin-mode 1)))

(use-package magit
  :ensure t)

(use-package web-mode
  :mode
  "\\.jinja\\'"
  "\\.html\\'")

(use-package less-css-mode
  :mode "\\.less\\'")

(use-package js2-mode
  :mode "\\.js\\'")

(use-package json-mode
  :mode "\\.json\\'")

(use-package markdown-mode
  :mode ("\\.md\\'" . gfm-mode))

(use-package sql-indent
  :commands sqlind-minor-mode)

(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode))

(require 'uniquify) ;; Improve buffer names when duplicate files are opened
(setq uniquify-buffer-name-style 'forward)

;; (use-package exec-path-from-shell
;;   :if (memq window-system '(mac ns x))
;;   :ensure t
;;   :config
;;   (exec-path-from-shell-initialize))

;; (use-package projectile
;;   :ensure t
;;   :after ivy
;;   :init
;;   (projectile-mode +1)
;;   :bind (:map projectile-mode-map
;;               ("s-p" . projectile-command-map)
;;               ("C-c p" . projectile-command-map)))

;; (use-package company
;;   :ensure t
;;   :init
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   :config
;;   (setq company-dabbrev-downcase 0)
;;   (setq company-idle-delay 0.1)
;;   (setq company-minimum-prefix-length 1)
;;   (setq company-tooltip-align-annotations t))

;; (use-package company
;;   :ensure t
;;   :init
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   :config
;;   (setq company-dabbrev-downcase 0)
;;   (setq company-idle-delay 0.1)
;;   (setq company-minimum-prefix-length 1)
;;   (setq company-tooltip-align-annotations t))

;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(undo-tree flx-ido ido-vertical-mode ido-ubiquitous smex smart-mode-line use-package))
 '(warning-suppress-log-types '((use-package) (use-package) (use-package)))
 '(warning-suppress-types '((use-package) (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
