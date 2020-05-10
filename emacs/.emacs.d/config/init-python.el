;; -*- lexical-binding: t -*-

;; Enable Python Language Server.
(add-hook 'python-mode-hook 'lsp-deferred)

;; Automatically enable the project's virtualenv.
(require-package 'auto-virtualenvwrapper)
(add-hook 'python-mode-hook 'auto-virtualenvwrapper-activate)

;; Enable Python 3 documentation through Dash.
(after 'init-docs
  (add-hook 'python-mode-hook
            (lambda () (setq-local counsel-dash-docsets '("Python 3")))))

;; Enable Flycheck syntax checking for Python.
(add-hook 'python-mode-hook
          (lambda ()
            (flycheck-mode 1)
            (flycheck-disable-checker 'python-pylint)))

;; Enable Black for automatic formatting after save.
(require-package 'blacken)
(add-hook 'python-mode-hook 'blacken-mode)
(after 'blacken
  (setq blacken-fast-unsafe t))

;; Enable isort for automatic import sorting after save.
(require-package 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

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
  ;; Disable YAPF and autopep8 (we're using Black).
  (setq lsp-pyls-plugins-autopep8-enabled nil)
  (setq lsp-pyls-plugins-yapf-enabled nil))

(provide 'init-python)
