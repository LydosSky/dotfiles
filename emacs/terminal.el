;;; terminal.el --- DESCRIPTION -*- no-byte-compile: t; lexical-binding: t; -*-

(use-package vterm
  :ensure t
  :defer t
  :commands vterm
  :config
  ;; Speed up vterm
  (setq vterm-timer-delay 0.01))
