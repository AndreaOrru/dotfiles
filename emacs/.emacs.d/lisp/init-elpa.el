(require 'package)

;; Setup MELPA repository
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq load-prefer-newer t)            ;; Prefer new byte-compiled files.
(setq package-enable-at-startup nil)  ;; Prevent (package-initialize) at startup.
(package-initialize)                  ;; Load Emacs Lisp packages.

;; Utility function to ensure required packages are installed.
(defun require-package (package)
  "Ensure that PACKAGE is installed."
  (unless (or (package-installed-p package)
              (require package nil 'noerror))
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

;; Utility to update packages.
(require-package 'auto-package-update)

(provide 'init-elpa)
