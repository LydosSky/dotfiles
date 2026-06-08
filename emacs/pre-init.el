;;; pre-init.el --- DESCRIPTION -*- no-byte-compile: t; lexical-binding: t; -*-


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MISC

(fringe-mode '(0 . 4))
(setq-default left-margin-width 0)
;; (setq-default cursor-type '(bar . 3))

;; (setq-default fringes-outside-margins t)
(setq cairo-antialias-mode 'subpixel)
(set-face-attribute 'default nil :font "IoskeleyMono Nerd Font" :height 120)
(add-hook
 'server-after-make-frame-hook
 (lambda ()
   (set-face-attribute 'default nil :font "IoskeleyMono Nerd Font" :height 120)))
(electric-pair-mode)
(column-number-mode)
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(delete-selection-mode 1)

;;; Reducing clutter in ~/.emacs.d by redirecting files to ~/.emacs.d/var/
;; NOTE: This must be placed in 'pre-early-init.el'.
(setq user-emacs-directory (expand-file-name "var/" minimal-emacs-user-directory))
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(global-set-key (kbd "C-v") (lambda () (interactive) (scroll-up 1)))
(global-set-key (kbd "M-v") (lambda () (interactive) (scroll-down 1)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
