;; -*- lexical-binding: t -*-

;; Automatically enable the project's virtualenv (as early as possible).
(require-package 'auto-virtualenvwrapper)
(add-hook 'python-mode-hook 'auto-virtualenvwrapper-activate -99)

;; Enable Microsoft Python Language Server.
(add-hook 'python-mode-hook 'lsp)
(require-package 'lsp-python-ms)

;; Enable Flycheck syntax checking for Python.
(add-hook 'python-mode-hook
          (lambda ()
            (flycheck-mode 1)
            (flycheck-select-checker 'python-mypy)
            (add-to-list 'flycheck-disabled-checkers 'lsp))
          99)

;; Enable isort for automatic import sorting after save.
(require-package 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)
;; Enable Black for automatic formatting after saving.
(require-package 'blacken)
(add-hook 'python-mode-hook 'blacken-mode)
(after 'blacken
  (setq blacken-fast-unsafe t))

;; Enable Python 3 documentation through Dash.
(after 'init-docs
  (add-hook 'python-mode-hook
            (lambda () (setq-local counsel-dash-docsets '("Python 3")))))

(provide 'init-python)
