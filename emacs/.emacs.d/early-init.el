;; -*- lexical-binding: t -*-

;; Required for Emacs 27+.
(setq load-prefer-newer t)            ;; Prefer new byte-compiled files.
(setq package-enable-at-startup nil)  ;; Prevent (package-initialize) at startup.

;; Enable async native compilation (Emacs 28, native-comp branch).
(setq comp-deferred-compilation t)

(provide 'early-init)
