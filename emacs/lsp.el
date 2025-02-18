;;; lsp.el --- DESCRIPTION -*- no-byte-compile: t; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :ensure t
  :custom
  (lsp-complete)
  :init
  (setq lsp-keymap-prefix "C-c c")
  :config
  (setq lsp-completion-provider :none))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-peek-enable t)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-modeline-code-actions-enable nil))

;;; lsp.el ends here
