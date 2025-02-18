;;; formatter.el --- DESCRIPTION -*- no-byte-compile: t; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; modules/formatting.el

;; Install and configure apheleia
(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode)
  (setq apheleia-mode-alist
        '((pug-mode . prettier)
          (js-mode . prettier)
          (prisma-mode . prettier)))) ; Enable apheleia globally

;; Install and configure Prettier for JavaScript/TypeScript
;; (use-package prettier-js
;;   :ensure t
;;   :hook ((js-mode . prettier-js-mode)
;;          (typescript-mode . prettier-js-mode)))




;;; formatter.el ends here
