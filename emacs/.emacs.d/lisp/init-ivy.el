;; Install packages.
(require-package 'counsel)         ;; Ivy + extras.
(require-package 'imenu-anywhere)  ;; Semantic search across buffers.
(require-package 'ivy-hydra)       ;; Ivy action selection.
(require-package 'smex)            ;; Better M-x.
(require-package 'wgrep)           ;; Edit search results.

;; Enable Ivy mode.
(add-hook 'after-init-hook 'ivy-mode)

(with-eval-after-load 'counsel
  (setq-default
   ;; Search words in any order in Ivy.
   ivy-re-builders-alist '((t . ivy--regex-ignore-order))
   counsel-yank-pop-separator "\n\n"  ;; Separate items in kill ring.
   ivy-initial-inputs-alist nil))     ;; No ^ in Ivy regex by default.

(with-eval-after-load 'ivy
  ;; Bigger Ivy minibuffer with fixed size.
  (setq-default
   ivy-height 15
   ivy-fixed-height-minibuffer t)

  (global-set-key (kbd "C-s") 'swiper)            ;; Search by filtering.
  (global-set-key (kbd "M-p") 'counsel-yank-pop)  ;; Kill ring selection.

  ;; VIM-like keybindings inside Ivy minibuffer.
  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)
  (define-key ivy-switch-buffer-map (kbd "C-k") 'ivy-previous-line))

;; Key bindings.
(with-eval-after-load 'evil-leader
  (evil-leader/set-key "SPC" 'counsel-M-x)
  (evil-leader/set-key "/" 'counsel-rg)

  (evil-leader/set-key "ji" 'counsel-semantic-or-imenu)
  (evil-leader/set-key "jI" 'ivy-imenu-anywhere)

  (evil-leader/set-key "r" 'ivy-resume))

(provide 'init-ivy)
