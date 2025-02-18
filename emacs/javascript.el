;;; javascript.el --- DESCRIPTION -*- no-byte-compile: t; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(add-hook 'js-mode-hook 'lsp-mode)
(add-hook 'js-mode-hook 'tree-sitter-mode)
(add-hook 'js-mode-hook #'tree-sitter-hl-mode)
;;; javascript.el ends here
