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
;; Make the fringe bigger.
(fringe-mode '(16 . 0))

;; Enable mouse in terminal.
(unless (display-graphic-p)
  (xterm-mouse-mode 1))

;; Start GUI in fullscreen mode.
(when (display-graphic-p)
  (toggle-frame-fullscreen))

;; Enable smooth scrolling.
(setq mouse-wheel-progressive-speed nil
      scroll-preserve-screen-position t
      scroll-margin 0
      scroll-conservatively 101)

(setq inhibit-startup-screen t)    ;; Disable Emacs startup screen.
(setq ring-bell-function 'ignore)  ;; Disable audible bell.
(fset 'yes-or-no-p 'y-or-n-p)      ;; Use Y/N instead of yes/no.

(provide 'init-interface)
