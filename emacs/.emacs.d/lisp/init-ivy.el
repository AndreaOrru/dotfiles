;; Install packages.
(require-package 'counsel)         ;; Ivy + extras.
(require-package 'imenu-anywhere)  ;; Semantic search across buffers.
(require-package 'ivy-hydra)       ;; Ivy action selection.
(require-package 'ivy-posframe)    ;; Show Ivy in sub-frames.
(require-package 'smex)            ;; Better M-x.
(require-package 'wgrep)           ;; Edit search results.

;; Enable Ivy mode.
(add-hook 'after-init-hook 'ivy-mode)

(with-eval-after-load 'counsel
  ;; Search words in any order in Ivy.
  (setq-default ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  ;; No ^ in Ivy regex by default.
  (setq-default ivy-initial-inputs-alist nil)

  ;; Search inside hidden files as well.
  (setq-default counsel-rg-base-command (concat counsel-rg-base-command " --hidden"))
  ;; Separate items in kill ring.
  (setq-default counsel-yank-pop-separator "\n\n"))

(with-eval-after-load 'ivy
  ;; Bigger Ivy minibuffer with fixed size.
  (setq-default
   ivy-height 15
   ivy-fixed-height-minibuffer t)

  (ivy-posframe-mode 1)  ;; Show Ivy in sub-frames.

  (global-set-key (kbd "C-s") 'swiper)            ;; Search by filtering.
  (global-set-key (kbd "M-p") 'counsel-yank-pop)  ;; Kill ring selection.

  ;; VIM-like keybindings inside Ivy minibuffer.
  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)
  (define-key ivy-switch-buffer-map (kbd "C-k") 'ivy-previous-line))

;; Display Ivy at point for Company completion filtering.
(with-eval-after-load 'ivy-posframe
  (setq ivy-posframe-display-functions-alist
	'((counsel-company . ivy-posframe-display-at-point)
	  (t . nil))))

;; Key bindings.
(with-eval-after-load 'evil-leader
  (evil-leader/set-key "SPC" 'counsel-M-x)
  (evil-leader/set-key "/" 'counsel-rg)

  (evil-leader/set-key "ji" 'counsel-semantic-or-imenu)
  (evil-leader/set-key "jI" 'ivy-imenu-anywhere)

  (evil-leader/set-key "r" 'ivy-resume))

(provide 'init-ivy)
