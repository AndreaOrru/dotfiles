;; Automatically enable the project's virtualenv.
(require-package 'auto-virtualenvwrapper)
(add-hook 'python-mode-hook 'auto-virtualenvwrapper-activate)

;; Enable Python 3 documentation through Dash.
(require 'dash-docs)
(unless (dash-docs-docset-installed-p "Python 3")
  (dash-docs-install-docset "Python 3"))
(add-hook 'python-mode-hook (lambda () (setq-local counsel-dash-docsets '("Python 3"))))

;; Enable Flycheck syntax checking for Python.
(add-hook 'python-mode-hook
          (lambda ()
            (flycheck-mode 1)
            (flycheck-disable-checker 'python-pylint)))

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
