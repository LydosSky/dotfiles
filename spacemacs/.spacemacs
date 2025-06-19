;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (org :variables
          ;; org-enable-modern-support t
          org-enable-appear-support t
          org-enable-verb-support t
          org-startup-indented t)
     better-defaults
     ivy
     (xclipboard :variables
                 xclipboard-enable-cliphist t)
     emacs-lisp
     git
     (multiple-cursors :variables
                       multiple-cursors-backend 'mc)
     (lsp :variables
          lsp-ui-doc-enable t
          lsp-headerline-breadcrumb-enable nil
          lsp-ui-sideline-enable nil
          lsp-keymap-prefix "C-c c")
     markdown
     syntax-checking
     (version-control :variables
                      version-control-diff-side 'right
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)
     (tree-sitter :variables
                  tree-sitter-syntax-highlight-enable t
                  tree-sitter-fold-enable nil)
     (javascript :variables
                 javascript-lsp-linter nil
                 javascript-fmt-on-save t
                 javascript-fmt-tool 'prettier
                 js2-highlight-level 0
                 js-indent-level 2
                 )
     (html :variables
           css-enable-lsp t
           html-enable-lsp t
           web-fmt-tool 'prettier)
     prettier
     restclient
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      )
     dtrt-indent
     (ibuffer :variables
              ibuffer-group-buffers-by 'projects)
     react
     theming
     (shell :variables
            shell-default-shell 'vterm)
     (sql :variables
          sql-capitalize-keywords t
          sql-indent t)
     (c-c++ :variables
            c-c++-backend 'lsp-clangd
            c-c++-enable-clang-format-on-save t)
     toml
     )

   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider crreating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(compile-angel
                                      rainbow-mode
                                      base16-theme
                                      lsp-tailwindcss
                                      (prisma-mode :location (recipe
                                                              :fetcher github
                                                              :repo "pimeys/emacs-prisma-mode"))
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(rainbow-delimiters)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light). A theme from external
   ;; package can be defined with `:package', or a theme can be defined with
   ;; `:location' to download the theme package, refer the themes section in
   ;; DOCUMENTATION.org for the full theme specifications.
   dotspacemacs-themes '(base16-one-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   ;; dotspacemacs-mode-line-theme '(doom)
   dotspacemacs-mode-line-theme '(spacemacs)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t


   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Roboto Mono"
                               :size 13.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'. It's an experimental feature to speedup
   ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
   dotspacemacs-enable-load-hints nil

   ;; If t, enable the `package-quickstart' feature to avoid full package
   ;; loading, otherwise no `package-quickstart' attemption (default nil).
   ;; Refer the FAQ.org "package-quickstart" section for details.
   dotspacemacs-enable-package-quickstart nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 100

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-fu', `undo-redo' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system. The default is currently `undo-fu' as `undo-tree'
   ;; is not maintained anymore and `undo-redo' is very basic."
   dotspacemacs-undo-system 'undo-fu

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq base16-theme-256-color-source 'colors)
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (when (fboundp 'prettier-js-mode)
    (defvar my-prettier-modes '(web-mode css-mode pug-mode prisma-mode))
    (dolist (mode my-prettier-modes)
      (add-hook (intern (concat (symbol-name mode) "-hook")) 'prettier-js-mode))
    (setq prettier-js-show-errors nil))
  (setq evil-emacs-state-cursor '(bar . 3))
  (global-disable-mouse-mode)
  (set-face-attribute 'cursor nil :background "#daa520")
  ;; (defvar doom-one-light-palette
  ;;   (let ((palette (make-hash-table :test 'equal)))
  ;;     (dolist (color
  ;;              '((bg         . "#fafafa")
  ;;                (fg         . "#383a42")
  ;;                (bg-alt     . "#f0f0f0")
  ;;                (fg-alt     . "#c6c7c7")
  ;;                (base0      . "#f0f0f0")
  ;;                (base1      . "#e7e7e7")
  ;;                (base2      . "#dfdfdf")
  ;;                (base3      . "#c6c7c7")
  ;;                (base4      . "#9ca0a4")
  ;;                (base5      . "#383a42")
  ;;                (base6      . "#202328")
  ;;                (base7      . "#1c1f24")
  ;;                (base8      . "#1b2229")
  ;;                (grey       . "#9ca0a4")
  ;;                (red        . "#e45649")
  ;;                (orange     . "#da8548")
  ;;                (green      . "#50a14f")
  ;;                (teal       . "#4db5bd")
  ;;                (yellow     . "#986801")
  ;;                (blue       . "#4078f2")
  ;;                (dark-blue  . "#a0bcf8")
  ;;                (magenta    . "#a626a4")
  ;;                (violet     . "#b751b6")
  ;;                (cyan       . "#0184bc")
  ;;                (dark-cyan  . "#005478")))
  ;;       (puthash (car color) (cdr color) palette))
  ;;     palette)
  ;;   "Cached palette for the `doom-one-light` theme.")

  ;; (defun doom-color (color)
  ;;   "Retrieve the hex value of COLOR (a symbol) from the `doom-one-light` palette."
  ;;   (gethash color doom-one-light-palette))

  ;; (defface tree-sitter-hl-face:jsx-component-tag
  ;;   `((t :foreground ,(doom-color 'yellow)))
  ;;   "Face for JSX tags."
  ;;   :group 'tree-sitter-hl-faces)

  ;; (defface tree-sitter-hl-face:jsx-html-tag
  ;;   `((t :foreground ,(doom-color 'cyan)))
  ;;   "Face for JSX html tags."
  ;;   :group 'tree-sitter-hl-faces)

  ;; (defface tree-sitter-hl-face:jsx-attribute
  ;;   `((t :foreground ,(doom-color 'red)))
  ;;   "Face for JSX attributes."
  ;;   :group 'tree-sitter-hl-faces)

  ;; (defface tree-sitter-hl-face:jsx-text
  ;;   `((t :foreground ,(doom-color 'base6)))
  ;;   "Face for JSX text."
  ;;   :group 'tree-sitter-hl-faces)

  ;; (defface tree-sitter-hl-face:jsx-delimiter
  ;;   `((t :foreground ,(doom-darken (doom-color 'fg) .25)))
  ;;   "Face for JSX delimiter (<,  />, >)"
  ;;   :group 'tree-sitter-hl-faces)

  ;; (defface tree-sitter-hl-face:jsx-bracket
  ;;   `((t :foreground ,(doom-color 'teal) :weight bold))
  ;;   "Faces for JSX brackets {  } "
  ;;   :group 'tree-sitter-hl-faces)


  ;; (defface tree-sitter-hl-face:booolean
  ;;   `((t :foreground ,(doom-color 'orange) :weight bold))
  ;;   "Faces for Boolean values true false "
  ;;   :group 'tree-sitter-hl-faces)

  ;; (defface tree-sitter-hl-face:not-operator
  ;;   `((t :foreground ,(doom-color 'red) :weight bold))
  ;;   "Faces for ! (not) logic"
  ;;   :group 'tree-sitter-hl-faces)



  ;; (tree-sitter-hl-add-patterns
  ;;     'javascript
  ;;   '((jsx_opening_element
  ;;      "<" @jsx-delimiter
  ;;      (identifier) @jsx-html-tag
  ;;      (match? @jsx-html-tag "^[a-z]")
  ;;      ">" @jsx-delimiter)

  ;;     (jsx_closing_element
  ;;      "</" @jsx-delimiter
  ;;      (identifier) @jsx-html-tag
  ;;      (match? @jsx-html-tag "^[a-z]")
  ;;      ">" @jsx-delimiter)

  ;;     (jsx_self_closing_element
  ;;      "<" @jsx-delimiter
  ;;      (identifier) @jsx-html-tag
  ;;      (match? @jsx-html-tag "^[a-z]")
  ;;      "/>" @jsx-delimiter)

  ;;     ;; Component tags
  ;;     (jsx_opening_element
  ;;      "<" @jsx-delimiter
  ;;      (identifier) @jsx-component-tag
  ;;      (match? @jsx-component-tag "^[A-Z]")
  ;;      ">" @jsx-delimiter)

  ;;     (jsx_closing_element
  ;;      "</" @jsx-delimiter
  ;;      (identifier) @jsx-component-tag
  ;;      (match? @jsx-component-tag "^[A-Z]")
  ;;      ">" @jsx-delimiter)

  ;;     (jsx_self_closing_element
  ;;      "<" @jsx-delimiter
  ;;      (identifier) @jsx-component-tag
  ;;      (match? @jsx-component-tag "^[A-Z]")
  ;;      "/>" @jsx-delimiter)

  ;;     (jsx_opening_element
  ;;      "<" @jsx-delimiter
  ;;      ">" @jsx-delimiter)

  ;;     (jsx_closing_element
  ;;      "</" @jsx-delimiter
  ;;      ">" @jsx-delimiter)

  ;;     (jsx_attribute
  ;;      (property_identifier) @jsx-attribute)

  ;;     (true) @boolean
  ;;     (false) @boolean

  ;;     (unary_expression
  ;;      operator: "!" @not-operator)


  ;;     (jsx_text) @jsx-text

  ;;     (function_declaration
  ;;      (formal_parameters
  ;;       (object_pattern
  ;;        (shorthand_property_identifier_pattern) @destructuring)))

  ;;     (arrow_function
  ;;      (formal_parameters
  ;;       (object_pattern
  ;;        (shorthand_property_identifier_pattern) @destructuring)))

  ;;     (jsx_expression
  ;;      "{" @jsx-bracket
  ;;      "}" @jsx-bracket)

  ;;     (ternary_expression
  ;;      "?" @ternary
  ;;      ":" @ternary)
  ;;     )
  ;;   )

  ;; (add-function :before-until tree-sitter-hl-face-mapping-function
  ;;               (lambda (capture-name)
  ;;                 (pcase capture-name
  ;;                   ("jsx-html-tag" 'tree-sitter-hl-face:jsx-html-tag)
  ;;                   ("jsx-component-tag" 'tree-sitter-hl-face:jsx-component-tag)
  ;;                   ("jsx-attribute" 'tree-sitter-hl-face:jsx-attribute)
  ;;                   ("jsx-text" 'tree-sitter-hl-face:jsx-text)
  ;;                   ("jsx-delimiter" 'tree-sitter-hl-face:jsx-delimiter)
  ;;                   ("jsx-bracket" 'tree-sitter-hl-face:jsx-bracket)
  ;;                   ("boolean" 'tree-sitter-hl-face:booolean)
  ;;                   ("destructuring" 'tree-sitter-hl-face:jsx-attribute)
  ;;                   ("ternary" 'tree-sitter-hl-face:keyword)
  ;;                   ("not-operator" 'tree-sitter-hl-face:not-operator)
  ;;                   )))


  ;; (custom-set-faces
  ;;  `(tree-sitter-hl-face:number ((t (:foreground  ,(doom-color 'orange) :weight bold))))
  ;;  `(tree-sitter-hl-face:operator ((t (:foreground ,(doom-color 'fg)))))
  ;;  `(tree-sitter-hl-face:method ((t (:foreground  ,(doom-color 'blue)))))
  ;;  `(tree-sitter-hl-face:function ((t (:foreground ,(doom-color 'blue)))))
  ;;  `(tree-sitter-hl-face:constant ((t (:foreground ,(doom-color 'red)))))
  ;;  `(tree-sitter-hl-face:keyword ((t (:foreground ,(doom-color 'magenta)))))
  ;;  `(tree-sitter-hl-face:string.special ((t (:foreground ,(doom-color 'blue)))))
  ;;  `(tree-sitter-hl-face:variable.parameter ((t (:foreground ,(doom-color 'red))))))

  (with-eval-after-load 'spaceline
    (setq powerline-default-separator nil)
    (setq spaceline-minor-modes-p nil)
    (setq spaceline-buffer-encoding-p nil)
    (setq spaceline-hud-p nil)
    (setq spaceline-buffer-size-p nil)
    (setq spaceline-buffer-position-p nil)
    (setq spaceline-buffer-encoding-abbrev-p nil)
    (setq spaceline-window-number-p nil)
    (setq spaceline-workspace-number-p nil)
    (setq spaceline-evil-state-p nil)
    )

  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(custom-safe-themes
     '("3d9512412d5874972f9142a6c230258e33ff1168d1d21aa68d7a568f328a400b" "d1d0bd3d8be9acb87bbdcd1ed3f8d2597403db3f53a9d79560e0213d20b8d780" "882d6a5981fd85d9f987d31623e25e69b8d5635a53ab442f1a51e7c252790320" "efaccb17b8cf2de777a2a9fc7f64f4cad1ea0317df3bdb0b72c3ac6c920491f9" "30d174000ea9cbddecd6cc695943afb7dba66b302a14f9db5dd65074e70cc744" "350fef8767e45b0f81dd54c986ee6854857f27067bac88d2b1c2a6fa7fecb522" "2b20b4633721cc23869499012a69894293d49e147feeb833663fdc968f240873" "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66" "9f297216c88ca3f47e5f10f8bd884ab24ac5bc9d884f0f23589b0a46a608fe14" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" default))
   '(package-selected-packages
     '(company-restclient know-your-http-well ob-http ob-restclient restclient-helm helm restclient wfnames helm-core toml-mode sql-indent sqlup-mode eat esh-help eshell-prompt-extras eshell-z multi-term multi-vterm xref shell-pop terminal-here vterm yasnippet-snippets ws-butler writeroom-mode winum window-purpose which-key wgrep web-mode web-beautify vundo volatile-highlights vim-powerline vi-tilde-fringen vertico unfill undo-fu-session undo-fu treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired tree-sitter-langs toc-org term-cursor tagedit symon symbol-overlay string-inflection string-edit-at-point sqlite3 spacemacs-whitespace-cleanup spacemacs-purpose-popwin space-doc smeargle slim-mode scss-mode sass-mode rjsx-mode restart-emacs request rainbow-mode quickrun pug-mode prettier-js popwin pcre2el password-generator paradox overseer org-superstar orderless open-junk-file npm-mode nodejs-repl nameless mwim multi-line markdown-toc marginalia macrostep lsp-ui lsp-treemacs lsp-tailwindcss lsp-origami lorem-ipsum livid-mode link-hint json-reformat json-navigator json-mode js2-refactor js-doc inspector info+ indent-guide impatient-mode ibuffer-projectile hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt helm-make google-translate golden-ratio gitignore-templates git-timemachine git-modes git-messenger git-link gh-md flycheck-pos-tip flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr emmet-mode embark-consult elisp-slime-nav elisp-demos elisp-def editorconfig dumb-jump dtrt-indent drag-stuff dotenv-mode doom-themes doom-modeline disable-mouse dired-quick-sort diminish diff-hl devdocs define-word consult-yasnippet consult-lsp compleseus-spacemacs-help company-web company-statistics company-quickhelp column-enforce-mode code-review cliphist clean-aindent-mode centered-cursor-mode browse-at-remote auto-yasnippet auto-highlight-symbol auto-compile async all-the-icons aggressive-indent ace-link)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
