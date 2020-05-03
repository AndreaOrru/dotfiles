(require-package 'auto-virtualenvwrapper)
(add-hook 'python-mode-hook
          (lambda ()
            ;; Automatically enable the project's virtualenv.
            (auto-virtualenvwrapper-activate)
            ;; Disable YAPF and autopep8 to prioritize Black.
            (setq lsp-pyls-plugins-autopep8-enabled nil)
            (setq lsp-pyls-plugins-yapf-enabled nil)))

(provide 'init-python)
