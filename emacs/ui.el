;;; ui.el --- DESCRIPTION -*- no-byte-compile: t; lexical-binding: t; -*-


(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one-light t)
  (doom-themes-org-config))

(use-package inhibit-mouse
  :ensure t
  :config
  (inhibit-mouse-mode))

(use-package spaceline
  :ensure t
  :init
  (setq powerline-default-separator 'bar)
  :config
  (spaceline-emacs-theme)
  (spaceline-toggle-hud-off)
  (spaceline-toggle-workspace-number-off)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-buffer-position-off)
  (spaceline-toggle-buffer-size-off)
  )

(setq-default cursor-type '(bar . 3))
(setq warning-minimum-level :error)
(set-frame-font "Roboto Mono-13" nil t)
(show-paren-mode 1)
(electric-pair-mode)
;;; ui.el ends here
