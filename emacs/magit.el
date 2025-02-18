;;; magit.el --- DESCRIPTION -*- no-byte-compile: t; lexical-binding: t; -*-

;; Install and configure Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))) ; Bind `C-x g` to open Magit status

;; Enable automatic refreshing of Magit buffers
(setq magit-auto-revert-mode t)

;; Show word-level differences in diffs
(setq magit-diff-refine-hunk t)

;; Set the default directory for Magit
(setq magit-repository-directories '(("~/projects" . 1))) ; Scan ~/projects for Git repos

;; Custom keybindings for Magit
(with-eval-after-load 'magit
  (define-key magit-status-mode-map (kbd "C-c C-c") 'magit-commit-create)
  (define-key magit-status-mode-map (kbd "C-c C-p") 'magit-push-current-to-pushremote))

;; Install and configure Magit-Todos
(use-package magit-todos
  :ensure t
  :after magit
  :config
  (magit-todos-mode t))

