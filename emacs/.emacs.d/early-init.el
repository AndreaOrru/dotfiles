;; -*- lexical-binding: t -*-

;; Required for Emacs 27+.
(setq load-prefer-newer t)            ;; Prefer new byte-compiled files.
(setq package-enable-at-startup nil)  ;; Prevent (package-initialize) at startup.

;; Enable async native compilation (Emacs 28, native-comp branch).
(setq comp-deferred-compilation t
      comp-speed 3)

(provide 'early-init)
;; Local Variables:
;; no-byte-compile: t
;; End:
