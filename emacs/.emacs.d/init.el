;; Add the lisp/ subdirectory to the load path.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; Save customized variables in a separate file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


;; Load submodules.
(require 'init-elpa)
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
(require 'init-help)


;; Load customized variables.
(when (file-exists-p custom-file)
  (load custom-file))
