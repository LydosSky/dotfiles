;;; flycheck.el --- DESCRIPTION -*- no-byte-compile: t; lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  (setq flycheck-highlight-mode nil)
  (setq flycheck-indication-mode nil)
  (setq flycheck-check-syntax-automatically '(save mode-)))

(setq flycheck-idle-change-delay 0.5)
(setq flycheck-global-modes '(not org-mode text-mode))
(add-hook 'prog-mode-hook 'flycheck-mode)

;;; flycheck.el ends here
