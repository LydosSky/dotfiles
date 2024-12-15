;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-enable t)
  )

(after! rjsx-mode
  (setq js2-highlight-level 0)
  (setq indent-tabs-mode nil)
  (setq lsp-diagnostics-provider :none)
  )



;; HACK could not find another way to do
;; copy paste from source and add my own
(setq consult-buffer-filter
      '("\\` "
        "^\\*"                          ;; HACK
        "\\`\\*Completions\\*\\'"
        "\\`\\*Flymake log\\*\\'"
        "\\`\\*Semantic SymRef\\*\\'"
        "\\`\\*vc\\*\\'"
        "\\`newsrc-dribble\\'" ;; Gnus
        "\\`\\*tramp/.*\\*\\'"))

(defun rainbow-color ()
  "face color for rainbow brackets"
  (doom-lighten(doom-color 'dark-cyan) .25))


(after! tree-sitter
  ;; Define custom faces for JSX
  (defface tree-sitter-hl-face:jsx-component-tag
    `((t :foreground ,(doom-color 'yellow)))
    "Face for JSX tags."
    :group 'tree-sitter-hl-faces)

  (defface tree-sitter-hl-face:jsx-html-tag
    `((t :foreground ,(doom-color 'cyan)))
    "Face for JSX html tags."
    :group 'tree-sitter-hl-faces)

  (defface tree-sitter-hl-face:jsx-attribute
    `((t :foreground ,(doom-color 'red)))
    "Face for JSX attributes."
    :group 'tree-sitter-hl-faces)

  (defface tree-sitter-hl-face:jsx-text
    `((t :foreground ,(doom-color 'base8)))
    "Face for JSX text."
    :group 'tree-sitter-hl-faces)

  (defface tree-sitter-hl-face:jsx-delimiter
    `((t :foreground ,(doom-darken (doom-color 'yellow) .25)))
    "Face for JSX delimiter (<,  />, >)"
    :group 'tree-sitter-hl-faces)

  (defface tree-sitter-hl-face:booolean
    `((t :foreground ,(doom-color 'orange) :weight bold))
    "Faces for Boolean values true false "
    :group 'tree-sitter-hl-faces)


  (tree-sitter-hl-add-patterns
      'javascript
    '((jsx_opening_element
       "<" @jsx-delimiter
       (identifier) @jsx-html-tag
       (match? @jsx-html-tag "^[a-z]")
       ">" @jsx-delimiter)

      (jsx_closing_element
       "</" @jsx-delimiter
       (identifier) @jsx-html-tag
       (match? @jsx-html-tag "^[a-z]")
       ">" @jsx-delimiter)

      (jsx_self_closing_element
       "<" @jsx-delimiter
       (identifier) @jsx-html-tag
       (match? @jsx-html-tag "^[a-z]")
       "/>" @jsx-delimiter)

      ;; Component tags
      (jsx_opening_element
       "<" @jsx-delimiter
       (identifier) @jsx-component-tag
       (match? @jsx-component-tag "^[A-Z]")
       ">" @jsx-delimiter)

      (jsx_closing_element
       "</" @jsx-delimiter
       (identifier) @jsx-component-tag
       (match? @jsx-component-tag "^[A-Z]")
       ">" @jsx-delimiter)

      (jsx_self_closing_element
       "<" @jsx-delimiter
       (identifier) @jsx-component-tag
       (match? @jsx-component-tag "^[A-Z]")
       "/>" @jsx-delimiter)

      (jsx_opening_element
       "<" @jsx-delimiter
       ">" @jsx-delimiter)

      (jsx_closing_element
       "</" @jsx-delimiter
       ">" @jsx-delimiter)

      (jsx_attribute
       (property_identifier) @jsx-attribute)

      (true) @boolean
      (false) @boolean



      (jsx_text) @jsx-text

      (function_declaration
       (formal_parameters
        (object_pattern
         (shorthand_property_identifier_pattern) @destructuring)))
      (arrow_function
       (formal_parameters
        (object_pattern
         (shorthand_property_identifier_pattern) @destructuring)))

      )
    )

  (add-function :before-until tree-sitter-hl-face-mapping-function
                (lambda (capture-name)
                  (pcase capture-name
                    ("jsx-html-tag" 'tree-sitter-hl-face:jsx-html-tag)
                    ("jsx-component-tag" 'tree-sitter-hl-face:jsx-component-tag)
                    ("jsx-attribute" 'tree-sitter-hl-face:jsx-attribute)
                    ("jsx-text" 'tree-sitter-hl-face:jsx-text)
                    ("jsx-delimiter" 'tree-sitter-hl-face:jsx-delimiter)
                    ("boolean" 'tree-sitter-hl-face:booolean)
                    ("destructuring" 'tree-sitter-hl-face:jsx-attribute)
                    )))

  (custom-set-faces!
    `(tree-sitter-hl-face:number :foreground  ,(doom-color 'orange) :weight bold)
    `(tree-sitter-hl-face:keyword :foreground ,(doom-color 'magenta))
    `(tree-sitter-hl-face:method :foreground  ,(doom-color 'blue))
    `(tree-sitter-hl-face:function :foreground ,(doom-color 'blue))
    `(tree-sitter-hl-face:constant :foreground ,(doom-color 'red))
    `(rainbow-delimiters-depth-1-face :foreground ,(rainbow-color))
    `(rainbow-delimiters-depth-2-face :foreground ,(rainbow-color))
    `(rainbow-delimiters-depth-3-face :foreground ,(rainbow-color))
    `(rainbow-delimiters-depth-4-face :foreground ,(rainbow-color))
    )


  )

(setq +format-on-save-disabled-modes (add-to-list '+format-on-save-disabled-modes 'rjsx-mode))
(setq +format-on-save-disabled-modes (add-to-list '+format-on-save-disabled-modes 'web-mode))




(add-hook 'rjsx-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(setq prettier-js-show-errors nil)


(setq idle-update-delay 0.1)
;;(setq motion-smooth-scroll t)
(setq lazy-motion-mode t)
(setq resdisplay-dont-pause t)

(after! doom-modeline
  (setq doom-modeline-icon nil)
  )

(use-package! lsp-tailwindcss
  :after lsp-mode
  :init
  (setq lsp-tailwindcss-add-on-mode t)
  (setq lsp-tailwindcss-server-path "/home/rylan/.nvm/versions/node/v22.11.0/bin/tailwindcss-language-server")
  )
