;;; init.el - Emacs configuration

;;; custom settings
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq backup-directory-alist `(("." . "~/.saves"))) ;; make backup files go to .saves
(defalias 'list-buffers 'ibuffer)
(global-font-lock-mode -1)


;; remapping keys
(global-set-key (kbd "M-]") 'backward-paragraph)
(global-set-key (kbd "C-]") 'forward-paragraph)

;; M-x list-packages
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
        (venv-initialize-eshell))

(use-package better-shell
  :ensure t
  :bind (("C-'" . better-shell-shell)
	 ("C-;" . better-shell-remote-open)))


;;; init.el ends here
