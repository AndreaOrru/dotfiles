(require-package 'company)
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
  ;; Show numbered completions.
  (setq company-show-numbers t)
  ;; Show completions faster.
  (setq company-idle-delay 0.15)

  ;; Taken from abo-abo's configuration.
  ;; Map digits to completions directly, when possible.
  (let ((map company-active-map))
    (mapc (lambda (x) (define-key map (format "%d" x) 'my/company-number))
	  (number-sequence 0 9)))

  ;; HACK: Workaround for https://github.com/abo-abo/swiper/issues/2385
  (advice-add 'counsel-company
	      :before
	      (defun my/company-hide-popup (&rest args)
		(company-cancel)))

  ;; Filter Company results with Ivy.
  (define-key company-active-map (kbd "C-s") 'counsel-company))

(provide 'init-company)
