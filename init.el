;; Some helpful sources below:
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
(global-set-key (kbd "M-g") 'goto-line)

;; Preferences
(setq inhibit-startup-screen t)
(setq-default show-trailing-whitespace t) ;; Show stray whitespace.
(setq-default indicate-empty-lines t)
(setq ring-bell-function 'ignore) ;; No visual bell please
(setq-default truncate-lines t) ;; truncate lines (disable word wrapping)
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
;; (if window-system (global-hl-line-mode t))
;;(set-face-foreground 'minibuffer-prompt "black")


(define-abbrev-table 'global-abbrev-table '(
    ("iferr" "if err != nil {}" nil 0)
))

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
  ;; :bind ("C-x j" . avy-goto-char-2)
  :bind ("C-x j" . avy-goto-word-or-subword-1)
  :config
  (setq avy-background t))

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history nil))

(use-package go-mode
  :mode "\\.go\\'"
  :config
  (add-hook 'before-save-hook #'gofmt-before-save))
  ;; (defun my/go-mode-setup ()
  ;;   "Basic Go mode setup."
  ;; (add-hook 'before-save-hook #'lsp-format-buffer t t)
  ;; (add-hook 'before-save-hook #'lsp-organize-imports t t))
  ;; (add-hook 'go-mode-hook #'my/go-mode-setup))

(use-package neotree
  :bind([f9] . neotree-toggle)
  ;; :hook (neo-after-create . (lambda (_)(call-interactively 'text-scale-twice)))
  :config
  (setq neo-autorefresh nil)
  (setq neo-smart-open t)
  (with-eval-after-load 'neotree
    (define-key neotree-mode-map (kbd "h") 'neotree-hidden-file-toggle)))

(use-package web-mode
  :mode
  "\\.jinja\\'"
  "\\.html\\'"
  "\\.tmpl\\'")

(use-package js2-mode
  :mode "\\.js\\'")

(use-package markdown-mode
  :mode ("\\.md\\'" . gfm-mode))

(use-package sql-indent
  :commands sqlind-minor-mode)

(use-package sqlformat
  :config
  (setq sqlformat-command 'pgformatter
        sqlformat-args '("-s2" "-g"))
  :hook (sql-mode . sqlformat-on-save-mode)
  :bind (:map sql-mode-map ("C-c C-f" . sqlformat)))

(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  (setq flycheck-check-syntax-automatically '(save new-line)
        flycheck-idle-change-delay 15.0
        flycheck-display-errors-delay 3.0
        flycheck-highlighting-mode 'symbols
        flycheck-indication-mode 'left-fringe
        flycheck-standard-error-navigation t
        flycheck-deferred-syntax-check nil)
  )

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package origami
  :ensure t
  :init
  (global-origami-mode)
  :bind
  ("C-c TAB" . origami-toggle-node))


(use-package json-mode
  :ensure t
  :init
  (add-hook 'json-mode-hook 'origami-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(deeper-blue))
 '(package-selected-packages
   '(web-mode use-package undo-tree sqlformat sql-indent smex smartparens smart-mode-line neotree magit lua-mode lsp-mode json-mode js2-mode ido-vertical-mode go-mode flycheck flx-ido exec-path-from-shell diff-hl cmake-mode avy auto-dark)))
