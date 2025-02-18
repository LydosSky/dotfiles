;;; prisma.el --- DESCRIPTION -*- no-byte-compile: t; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package prisma-mode
  :straight (:host github :repo "pimeys/emacs-prisma-mode" :branch "main"))

(add-hook 'prisma-mode 'lsp-mode)
;;; prisma.el ends here

