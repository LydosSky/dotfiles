;;; web-mode.el --- DESCRIPTION -*- no-byte-compile: t; lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; modules/web.el

;; Install and configure Web Mode
(use-package web-mode
  :ensure t
  :mode (("\\.html\\'" . web-mode) ; Associate .html files with Web Mode
         ("\\.php\\'" . web-mode)  ; Associate .php files with Web Mode
         ("\\.tsx\\'" . web-mode)) ; Associate .tsx files with Web Mode
  :config
  (setq web-mode-markup-indent-offset 2) ; Indentation for HTML
  (setq web-mode-css-indent-offset 2)    ; Indentation for CSS
  (setq web-mode-code-indent-offset 2)   ; Indentation for JS/JSX
  (setq web-mode-enable-auto-pairing t)  ; Enable auto-pairing of tags
  (setq web-mode-enable-current-element-highlight t)) ; Highlight current element

(use-package pug-mode
  :ensure t)

(use-package emmet-mode
  :ensure t
  :hook ((web-mode . emmet-mode)
         (pug-mode . emmet-mode))
  :config
  (setq emmet-move-cursor-after-expanding t)
  (setq emmet-preview-default t))

;; Enable auto-closing of tags
(setq web-mode-enable-auto-closing t)
;; Enable auto-expanding of tags
(setq web-mode-enable-auto-expanding t)
;; Enable auto-indentation
(setq web-mode-enable-auto-indentation t)
;; Enable syntax highlighting for embedded languages
(setq web-mode-enable-engine-detection t)
;; Integrate LSP with Web Mode
(with-eval-after-load 'lsp-mode
  (add-hook 'web-mode-hook 'lsp-deferred))

;; Keybindings for Web Mode
(define-key web-mode-map (kbd "C-c C-f") 'web-mode-fold-or-unfold) ; Fold/unfold code
(define-key web-mode-map (kbd "C-c C-n") 'web-mode-navigate) ; Navigate between elements

(add-hook 'css-mode 'lsp-mode)
(add-hook 'css-mode #'tree-sitter-hl-mode)
;;; web-mode.el ends here
