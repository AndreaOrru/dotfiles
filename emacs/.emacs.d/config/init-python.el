;; -*- lexical-binding: t -*-

;; Enable Python Language Server.
(add-hook 'python-mode-hook 'lsp)

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

;; Black for formatting and isort for import saving.
(require-package 'blacken)
(require-package 'py-isort)
(defun blacken-py-isort-buffer ()
  "Sort a Python's buffer imports with isort and format it with Black."
  (interactive)
  (py-isort-buffer)
  (blacken-buffer))

(defun my/init-lsp-python-mode ()
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
  (setq lsp-pyls-plugins-yapf-enabled nil)

  ;; Substitute the default lsp-format-buffer function with black/isort.
  (setq blacken-fast-unsafe t)
  (evil-local-set-key 'normal (kbd ",==") 'blacken-py-isort-buffer))

(add-hook 'python-mode-hook
          (lambda () (add-hook 'lsp-mode-hook 'my/init-lsp-python-mode)))

(provide 'init-python)
