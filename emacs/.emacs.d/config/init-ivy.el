;; -*- lexical-binding: t -*-

;; Enable Ivy mode.
(require-package 'counsel)
(add-hook 'after-init-hook 'ivy-mode)

;; Use Ivy Rich to provide a friendlier Ivy interface.
(require-package 'ivy-rich)
(require-package 'all-the-icons-ivy-rich)
(add-hook 'after-init-hook 'ivy-rich-mode)
(when (display-graphic-p)
  (add-hook 'after-init-hook 'all-the-icons-ivy-rich-mode))
(after 'ivy-rich
  (setq ivy-rich-path-style 'abbrev)
  (setcdr (assq t ivy-format-functions-alist) 'ivy-format-function-line))

;; Extra functionalities.
(require-package 'ivy-hydra)       ;; Ivy action selection.
(require-package 'ivy-posframe)    ;; Show Ivy in sub-frames.
(require-package 'ivy-prescient)   ;; Order results by frequency.
(require-package 'wgrep)           ;; Edit search results.

(after 'counsel
  ;; Search words in any order in Ivy.
  (setq-default ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  (setq-default ivy-initial-inputs-alist nil)  ;; No ^ in Ivy regex by default.
  (ivy-prescient-mode 1)                       ;; Order results by frequency.

  ;; Search inside hidden files as well (but not the ".git" directory).
  (setq-default counsel-rg-base-command
                (concat counsel-rg-base-command " --hidden -g '!.git/**'"))
  ;; Separate items in kill ring.
  (setq-default counsel-yank-pop-separator "\n\n"))

(after 'ivy
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
(after 'ivy-posframe
  (setq ivy-posframe-display-functions-alist
    '((counsel-company . ivy-posframe-display-at-point)
      (t . nil))))

;; Semantic search across buffers.
(require-package 'imenu-anywhere)
(after 'imenu-anywhere
  ;; Consider only buffers in the same project.
  (setq imenu-anywhere-buffer-filter-functions '(imenu-anywhere-same-project-p))
  ;; Filter out Magit buffers.
  (setq-default imenu-anywhere-buffer-list-function
        (lambda ()
          (--remove (eq (buffer-local-value 'major-mode it) 'magit-status-mode)
                    (buffer-list)))))

;; Use Ivy for Xref filtering.
(require-package 'ivy-xref)
(setq xref-show-definitions-function 'ivy-xref-show-defs)

;; Key bindings.
(after 'init-evil
  (evil-leader/set-key "SPC" 'counsel-M-x)
  (evil-leader/set-key "/" 'counsel-rg)

  (which-key/describe-prefix "j" "jump")
  (evil-leader/set-key "ji" 'counsel-semantic-or-imenu)
  (evil-leader/set-key "jI" 'ivy-imenu-anywhere)

  (evil-leader/set-key "r" 'ivy-resume))

(provide 'init-ivy)
