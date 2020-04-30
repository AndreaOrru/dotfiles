;; Disable GUI elements.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Load theme.
(setq custom-safe-themes t)
(require-package 'doom-themes)
(load-theme 'doom-gruvbox)

;; Set interface font.
(setq default-frame-alist '((font . "Mononoki-14")))
(setq-default line-spacing 3)

(setq inhibit-startup-screen t)    ;; Disable Emacs startup screen.
(setq ring-bell-function 'ignore)  ;; Disable audible bell.
(fset 'yes-or-no-p 'y-or-n-p)      ;; Use Y/N instead of yes/no.

;; Enable mouse in terminal.
(unless (display-graphic-p)
  (xterm-mouse-mode 1))

(provide 'init-interface)
