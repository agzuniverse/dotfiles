(use-package elpy)
(use-package blacken)
(elpy-enable)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(setq elpy-rpc-python-command "python3")

;; Use black to format on save when in Python mode
(add-hook 'python-mode-hook 
          (lambda () 
             (add-hook 'before-save-hook 'elpy-black-fix-code nil t)))

(provide 'setup-python)
