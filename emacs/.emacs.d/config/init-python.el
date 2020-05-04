;; Automatically enable the project's virtualenv.
(require-package 'auto-virtualenvwrapper)
(add-hook 'python-mode-hook 'auto-virtualenvwrapper-activate)

;; Enable Flycheck syntax checking for Python.
(add-hook 'python-mode-hook 'flycheck-mode)
(after 'flycheck
  ;; Disable Pylint.
  (add-to-list 'flycheck-disabled-checkers 'python-pylint))

(after 'lsp-mode
  ;; Enable Flake8.
  (setq lsp-pyls-configuration-sources ["flake8"])
  (setq lsp-pyls-plugins-flake8-enabled t)
  ;; Disable plugins included inside Flake8.
  (setq lsp-pyls-plugins-mccabe-enabled nil)
  (setq lsp-pyls-plugins-pycodestyle-enabled nil)
  (setq lsp-pyls-plugins-pyflakes-enabled nil)
  ;; Disable PyLint.
  (setq lsp-pyls-plugins-pylint-enabled nil)
  ;; Disable YAPF and autopep8 to prioritize Black.
  (setq lsp-pyls-plugins-autopep8-enabled nil)
  (setq lsp-pyls-plugins-yapf-enabled nil))

(provide 'init-python)
