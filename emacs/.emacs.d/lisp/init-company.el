(require-package 'company)
(require-package 'company-prescient)
(add-hook 'after-init-hook 'global-company-mode)


;; Taken from abo-abo's configuration.
(defun my/company-number ()
  "Forward to `company-complete-number'.

Unless the number is potentially part of the candidate.
In that case, insert the number."
  (interactive)
  (let* ((k (this-command-keys))
	 (re (concat "^" company-prefix k)))
    (if (or (cl-find-if (lambda (s) (string-match re s))
			company-candidates)
	    (> (string-to-number k)
	       (length company-candidates))
	    (looking-back "[0-9]+\\.[0-9]*" (line-beginning-position)))
	(self-insert-command 1)
      (company-complete-number
       (if (equal k "0")
	   10
	 (string-to-number k))))))


(with-eval-after-load 'company
  (setq company-show-numbers t)   ;; Show numbered completions.
  (setq company-idle-delay 0.15)  ;; Show completions faster.
  (company-prescient-mode 1)      ;; Order results by frequency.

  ;; Taken from abo-abo's configuration.
  ;; Map digits to completions directly, when possible.
  (let ((map company-active-map))
    (mapc (lambda (x) (define-key map (format "%d" x) 'my/company-number))
	  (number-sequence 0 9)))

  ;; Use TAB to start completion.
  (global-set-key (kbd "TAB") 'company-indent-or-complete-common)
  ;; Filter Company results with Ivy.
  (define-key company-active-map (kbd "C-s") 'counsel-company))

(provide 'init-company)
