;;; init.el - Emacs configuration

;; custom settings
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(global-set-key (kbd "C-x C-b") #'ibuffer) ;; replace buffer-menu with ibuffer
(defalias 'yes-or-no-p 'y-or-n-p) ;; y or n
(require 'ido) ;; Ido mode
(ido-mode t)
(global-set-key (kbd "C-x w") 'whitespace-mode) ;; toggle whitespace-mode


;; MELPA
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; M-x package-refresh-contents, M-x package-install RET use-package RET
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; Packages
(use-package avy
  :ensure t
  :bind ("C-x j" . avy-goto-word-or-subword-1)
  :config
  (setq avy-background t))

(use-package go-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-engines-alist
	'(("django"    . "\\.html\\'")))
  (setq web-mode-ac-sources-alist
	'(("css" . (ac-source-css-property))
	  ("html" . (ac-source-words-in-buffer ac-source-abbrev)))))

(use-package go-mode
  :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)

;;; init.el ends here
