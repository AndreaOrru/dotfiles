;; -*- lexical-binding: t -*-

;; Disable GUI elements.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Load theme.
(setq custom-safe-themes t)
(require-package 'doom-themes)
(load-theme 'doom-tomorrow-night)

;; GUI-specific options.
(when (display-graphic-p)
  (toggle-frame-fullscreen)      ;; Fullscreen mode.
  (fringe-mode '(16 . 0))        ;; Bigger fringe.
  (setq-default line-spacing 4)  ;; More vertical spacing.
  ;; Choose interface font size based on whether the external monitor is connected.
  (if (eq (call-process-shell-command "external-monitor.sh") 0)
      (setq default-frame-alist '((font . "Iosevka Fixed SS09 Extended-10")))
    (setq default-frame-alist '((font . "Iosevka Fixed SS09 Extended-14")))))

;; Adjust font size at runtime.
(require-package 'default-text-scale)
(add-hook 'after-init-hook 'default-text-scale-mode)

;; Show clearer window dividers.
(if (not (display-graphic-p))
    (set-face-attribute 'vertical-border nil
                        :background (doom-color 'base2)
                        :foreground (doom-color 'base2))
  (setq window-divider-default-places t
        window-divider-default-bottom-width 4
        window-divider-default-right-width 3)
  (add-hook 'after-init-hook 'window-divider-mode))

;; Enable mouse in terminal.
(unless (display-graphic-p)
  (xterm-mouse-mode 1))
;; Enable smooth scrolling.
(setq scroll-preserve-screen-position t
      scroll-margin 0
      scroll-conservatively 101
      mouse-wheel-progressive-speed nil
      mouse-wheel-scroll-amount '(3
                                  ((shift) . 1)))

(setq inhibit-startup-screen t)    ;; Disable Emacs startup screen.
(setq ring-bell-function 'ignore)  ;; Disable audible bell.
(fset 'yes-or-no-p 'y-or-n-p)      ;; Use Y/N instead of yes/no.

(provide 'init-interface)
