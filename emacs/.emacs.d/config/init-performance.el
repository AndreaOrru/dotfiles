;; Set garbage collection threshold to 128MB.
(setq gc-cons-threshold (* 128 1024 1024))
;; Set the maximum amount of data readable from processes to 4MB.
(setq read-process-output-max (* 4 1024 1024))

(provide 'init-performance)
