;; Add the lisp/ subdirectory to the load path.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Load submodules.
(require 'init-performance)
(require 'init-elpa)
(require 'init-no-littering)

(require 'init-interface)
(require 'init-modeline)

(require 'init-evil)
(require 'init-editing)
(require 'init-buffers)
(require 'init-files)
(require 'init-windows)

(require 'init-ivy)
(require 'init-company)
(require 'init-dired)
(require 'init-shell)

(require 'init-projects)
(require 'init-git)
(require 'init-lsp)
(require 'init-flycheck)
(require 'init-misc)

;; Save customized variables in a separate file.
(setq custom-file (no-littering-expand-etc-file-name "custom.el"))
(when (file-exists-p custom-file) (load custom-file))
