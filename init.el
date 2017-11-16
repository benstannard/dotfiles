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



;;; init.el ends here
