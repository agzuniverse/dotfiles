(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(global-display-line-numbers-mode)       ;; Enable line numbers globally
(setq display-line-numbers-type 'relative) ;; Display relative line numbers
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; Start emacs in fullscreen

;; Put all backup files into one directory
(setq backup-directory-alist
      '(("." . "~/.emacs.d/temp/")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/temp/" t)))

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

(use-package vscode-icon
  :ensure t
  :commands (vscode-icon-for-file))

(use-package dired-sidebar
  :bind (("C-x C-d" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (setq dired-sidebar-theme 'vscode))

(provide 'setup-general)
