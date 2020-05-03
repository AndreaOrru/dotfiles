;; Automatically enable the project's virtualenv.
(require-package 'auto-virtualenvwrapper)
(add-hook 'python-mode-hook 'auto-virtualenvwrapper-activate)

(provide 'init-python)
