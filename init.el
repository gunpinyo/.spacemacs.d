;;; package --- Summary

;; -*- mode: emacs-lisp -*-

;;; Commentary:
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.


;;; Code:
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     agda
     better-defaults
     (colors :variables
             colors-enable-nyan-cat-progress-bar (display-graphic-p)
             rainbow-mode t)
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode)
     command-log
     elm
     emacs-lisp
     git
     haskell
     html
     idris
     javascript
     (latex :variables
            latex-enable-auto-fill t
            latex-enable-folding t)
     markdown
     org
     (python :variables
             python-test-runner 'pytest
             python-enable-yapf-format-on-save t)
     ;; (ipython-noteboolk)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'multi-term)
     spell-checking
     syntax-checking
     typography
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(dash-functional  ;; lean dependency
     lua-mode         ;; lean dependency
     multiple-cursors
     drag-stuff)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects bookmarks)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 20
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Liberation Mono for Powerline"
                               ;;"DejaVu Sans Mono for Powerline"
                              :size 40
                              :weight normal
                              :width normal
                              :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   ;; dotspacemacs-emacs-leader-key "<print>"
   dotspacemacs-emacs-leader-key "C-SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "M-SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key "\\"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 20
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.0
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'any
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  (custom-set-variables '(spacemacs-theme-custom-colors
                          '((act1       . "black")
                            (act2       . "#205")
                            (base       . "#e9caad")
                            (base-dim   . "#897a5d")
                            (bg1        . "#000")
                            (bg2        . "#111")
                            (bg3        . "#181818")
                            (bg4        . "#222")
                            ;; (border     . "#xxxxxx")
                            ;; (cblk       . "#xxxxxx")
                            ;; (cblk-bg    . "#xxxxxx")
                            ;; (cblk-ln    . "#xxxxxx")
                            ;; (cblk-ln-bg . "#xxxxxx")
                            ;; (cursor     . "#xxxxxx")
                            (const      . "darkgreen")
                            (comment    . "#aaa")
                            (comment-bg . "#080808")
                            ;; (comp       . "#xxxxxx")
                            ;; (err        . "#xxxxxx")
                            (func       . "red")
                            ;; (head1      . "#xxxxxx")
                            ;; (head1-bg   . "#xxxxxx")
                            ;; (head2      . "#xxxxxx")
                            ;; (head2-bg   . "#xxxxxx")
                            ;; (head3      . "#xxxxxx")
                            ;; (head3-bg   . "#xxxxxx")
                            ;; (head4      . "#xxxxxx")
                            ;; (head4-bg   . "#xxxxxx")
                            (highlight  . "#333")
                            (keyword    . "RoyalBlue1")
                            (lnum       . "brown")
                            (mat        . "deep sky blue")
                            (meta       . "dark green")
                            (str        . "dark green")
                            (suc        . "green")
                            (ttip       . "dark green")
                            (ttip-sl    . "#222")
                            (ttip-bg    . "#111")
                            (type       . "#ff6800")
                            (var        . "#3387cc")
                            (war        . "#ff0000")
                            )))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; enable this when debuging
  (setq debug-on-error t)

  (global-font-lock-mode 1)
  (global-linum-mode 1)
  (setq powerline-default-separator 'arrow)
  (setq evil-default-state 'emacs)

  (setq-default line-spacing 16)
  (setq-default tab-width 2)
  (setq-default c-basic-indent 2)
  (setq-default indent-tabs-mode nil)

  ;; try to prevent "Invalid search bound (wrong side of point)"
  (setq-default volatile-highlights-mode nil)
  (setq-default cache-long-scans nil)
  (setq org-replace-disputed-keys t) ;; avoid conflict with cua

  ;; font (also see `dotspacemacs-default-font' for font general setting)
  (dolist (ft (fontset-list)) (set-fontset-font ft 'unicode
    (font-spec :name "DejaVu Sans Mono for Powerline") nil 'append))
  (mapc (lambda (face) (set-face-attribute face nil
    :weight 'normal :underline nil)) (face-list))

  ;; If indent-tabs-mode is off, untabify before saving
  (setq-default indent-tabs-mode nil)
  (add-hook 'before-save-hook (lambda ()
    (if (not indent-tabs-mode) (untabify (point-min) (point-max)))))

  ;; cua-mode
  (cua-mode t)
  (setq cua-auto-tabify-rectangles nil)
  (transient-mark-mode 1)
  (setq cua-keep-region-after-copy t)

  ;; fill-column-indicator
  (define-globalized-minor-mode global-fci-mode fci-mode
    (lambda ()
      (when (not (memq major-mode
                       (list 'dired-mode 'shell-mode)))
        (fci-mode 1))))
  (global-fci-mode 1)
  (setq fci-rule-column 80)
  (setq fci-rule-color "brown")

  ;; projectile
  (setq projectile-switch-project-action 'neotree-projectile-action)

  ;; neotree
  (setq neo-theme 'nerd)
  ;; (neotree-show)
  ;; (select-window-1)

  ;; multi-term
  (setq multi-term-program "/usr/bin/env zsh")

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;    Additional packages dependent
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; multiple-cursors
  (require 'multiple-cursors)

  ;; drag-stuff
  (require 'drag-stuff)
  (drag-stuff-define-keys)
  (drag-stuff-global-mode t)

  ;; command-log-mode
  (require 'command-log-mode)
  (setq clm/log-command-exceptions* '())
  ;; disable ability to count repeated commands
  ;;(add-hook 'pre-command-hook (lambda()(setq clm/last-keyboard-command nil)))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;    Layers dependent
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; agda
  (load-file (let ((coding-system-for-read 'utf-8))
               (shell-command-to-string "agda-mode locate")))
  ;; disable auto-indentation
  (setq spacemacs-indent-sensitive-modes
        (add-to-list 'spacemacs-indent-sensitive-modes 'agda2-mode))
  ;; obsolete variable
  (makunbound 'agda2-include-dirs)

  ;; elm
  (setq spacemacs-indent-sensitive-modes
        (add-to-list 'spacemacs-indent-sensitive-modes 'elm-mode))
  (add-hook 'elm-mode-hook 'global-company-mode)

  ;; idris
  (require 'idris-mode)

  ;; latex
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; python
  (require 'python)
  (setq python-shell-interpreter "python")
  (defun python-shell-parse-command ()
    "Return the string used to execute the inferior Python process."
    "/usr/local/bin/ipython3 -i")

  ;; spell-checking (flyspell)
  (setq ispell-program-name "aspell")
  (setq ispell-local-dictionary "en_GB")
  (setq ispell-local-dictionary-alist
        '(("en_GB" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil nil nil utf-8)))

  ;; syntax-checking
  (add-hook 'fundamental-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'text-mode-hook 'flyspell-mode)

  ;; flycheck
  (add-hook 'after-init-hook 'global-flycheck-mode)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; External from spacemacs config
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; WARNING: put extra thing into a layer if possible instead of here

  ;; lean
  ;; Install required/optional packages for lean-mode
  (defvar lean-mode-required-packages
    '(company dash dash-functional flycheck f
              fill-column-indicator s lua-mode mmm-mode))
  (let ((need-to-refresh t))
    (dolist (p lean-mode-required-packages)
      (when (not (package-installed-p p))
        (when need-to-refresh
          (package-refresh-contents)
          (setq need-to-refresh nil))
        (package-install p))))
  ;; disable auto-indentation
  (setq spacemacs-indent-sensitive-modes
        (add-to-list 'spacemacs-indent-sensitive-modes 'lean-mode))
  ;; Set up lean-root path
  (setq lean-rootdir "/usr")
  (setq-local lean-emacs-path "/usr/share/emacs/site-lisp/lean")
  (add-to-list 'load-path (expand-file-name lean-emacs-path))
  (require 'lean-mode)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;    Key Binding
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (defun forward-or-backward-sexp (&optional arg)
    "Go to the matching parenthesis character if one is adjacent to point."
    (interactive "^p")
    (cond ((looking-at "\\s(") (forward-sexp arg))
          ((looking-back "\\s)" 1) (backward-sexp arg))
          ;; Now, try to succeed from inside of a bracket
          ((looking-at "\\s)") (forward-char) (backward-sexp arg))
          ((looking-back "\\s(" 1) (backward-char) (forward-sexp arg))))

  (defun cua-set-mark-then-forward-or-backward-sexp ()
    "cua-set-mark before matching parenthesis"
    (interactive)
    (cua-set-mark)
    (forward-or-backward-sexp))

  (defun lunch-gnome-terminal ()
    "Lunch (gnome) terminal from emacs with current directory."
    (interactive)
    (shell-command "gnome-terminal"))

  (defun lunch-nautilus ()
    "Lunch nautilus (directory explorer) from emacs with current directory."
    (interactive)
    (shell-command "nautilus ."))

  (defun duplicate-line-or-region (&optional n)
    "Duplicate current line, or region if active.
    With argument N, make N copies.
    With negative N, comment out original line and use the absolute value."
    (interactive "*p")
    (let ((use-region (use-region-p)))
      (save-excursion
        (let ((text (if use-region        ; Get region if active, otherwise line
                        (buffer-substring (region-beginning) (region-end))
                      (prog1 (thing-at-point 'line)
                        (end-of-line)
                        (if (< 0 (forward-line 1)) ; Go to beginning of next
                            (newline))))))         ; line, or make a new one
          (dotimes (i (abs (or n 1))) ; Insert N times, or once if not specified
            (insert text))))
      (if use-region nil      ; Only if we're working with a line (not a region)
        (let ((pos (- (point) (line-beginning-position)))) ; Save column
          (if (> 0 n)                   ; Comment out original with negative arg
              (comment-region (line-beginning-position) (line-end-position)))
          (forward-line 1)
          (forward-char pos)))))

  (defun select-current-line ()
    "Select the current line"
    (interactive)
    (end-of-line) ; move to end of line
    (set-mark (line-beginning-position)))

  (defun shift-region (distance)
    (let ((beg (save-excursion (goto-char (region-beginning))
                               (line-beginning-position)))
          (end (save-excursion (goto-char (region-end))
                               (line-end-position))))
      (save-excursion
        (goto-char beg)
        (set-mark end)
        (indent-rigidly beg end distance)
        (setq deactivate-mark nil))))

  (defun shift-current-line (distance)
    (indent-rigidly (line-beginning-position)
                    (line-end-position)
                    distance))

  (defun shift-line-or-region (distance)
    (if (region-active-p)
      (shift-region distance)
      (shift-current-line distance)))

  (defun indent-line-or-region ()
    (interactive)
    (shift-line-or-region 2))

  (defun unindent-line-or-region ()
    (interactive)
    (shift-line-or-region -2))

  (defun half-indent-line-or-region ()
    (interactive)
    (shift-line-or-region 1))

  (defun half-unindent-line-or-region ()
    (interactive)
    (shift-line-or-region -1))

  (defun preview-neotree-and-come-back ()
    "enter selected node for preview then resume cursor back"
    (interactive)
    (neotree-enter)
    (select-window-0))

  (defun xah-unfill-paragraph ()
    "Replace newline chars in current paragraph by single spaces.
This command does the inverse of `fill-paragraph'.

URL `http://ergoemacs.org/emacs/emacs_unfill-paragraph.html'
Version 2015-11-28"
    (interactive)
    (let ((fill-column most-positive-fixnum))
      (fill-paragraph)))

(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa.

i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                  (windmove-find-other-window neighbour-dir next-win)))))
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir)
                  other-buf))))))))

  (define-key key-translation-map (kbd "<print>") (kbd "C-SPC"))
  (define-key key-translation-map (kbd "<menu>") (kbd "C-SPC"))
  (define-key key-translation-map (kbd "ESC") (kbd "C-g"))
  (define-key key-translation-map (kbd "C-z") (kbd "C-/"))
  (define-key key-translation-map (kbd "C-S-z") (kbd "C-?"))

  (global-set-key (kbd "M-[")            'unindent-line-or-region)
  (global-set-key (kbd "M-]")            'indent-line-or-region)
  (global-set-key (kbd "M-{")            'half-unindent-line-or-region)
  (global-set-key (kbd "M-}")            'half-indent-line-or-region)

  (global-set-key (kbd "M-/")            'helm-filtered-bookmarks)
  (global-set-key (kbd "C-<escape>")     'keyboard-escape-quit)

  (global-set-key (kbd "C-s")            'save-buffer)
  (global-set-key (kbd "C-f")            'helm-swoop)
  (global-set-key (kbd "C-:")            'ispell-word)
  (global-set-key (kbd "C-¬")            'avy-goto-word-or-subword-1)
  (global-set-key (kbd "C-<home>")       'mwim-beginning-of-code-or-line)
  (global-set-key (kbd "C-<end>")        'universal-argument)

  (global-set-key (kbd "C-j")            'join-line)
  (global-set-key (kbd "C-;")            'select-current-line)
  (global-set-key (kbd "C-d")            'duplicate-line-or-region)
  (global-set-key (kbd "C-S-d")          'kill-whole-line)

  (global-set-key (kbd "C-`")            'cua-set-mark)
  (global-set-key (kbd "C-'")            'er/expand-region)
  (global-set-key (kbd "C-@")            'mark-sexp)
  (global-set-key (kbd "C-#")            'forward-or-backward-sexp)
  (global-set-key (kbd "C-~")            'cua-set-mark-then-forward-or-backward-sexp)

  (global-set-key (kbd "C-n")            'mc/mark-next-like-this)
  (global-set-key (kbd "C-p")            'mc/mark-previous-like-this)
  (global-set-key (kbd "C-S-<mouse-1>")  'mc/add-cursor-on-click)

  (spacemacs/declare-prefix "o" "gunp-personal-keymap")
  (spacemacs/set-leader-keys "oa" 'mc/mark-all-like-this)
  (spacemacs/set-leader-keys "oi" 'shell-command)
  (spacemacs/set-leader-keys "oe" 'spacemacs/shell-pop-eshell)
  (spacemacs/set-leader-keys "of" 'neotree-find)
  (spacemacs/set-leader-keys "og" 'projectile-grep)
  (spacemacs/set-leader-keys "ol" 'flycheck-error-list)
  (spacemacs/set-leader-keys "on" 'lunch-nautilus)
  (spacemacs/set-leader-keys "op" 'projectile-run-shell-command-in-root)
  (spacemacs/set-leader-keys "oq" 'xah-unfill-paragraph)
  (spacemacs/set-leader-keys "or" 'set-rectangular-region-anchor)
  (spacemacs/set-leader-keys "ot" 'lunch-gnome-terminal)
  (spacemacs/set-leader-keys "ow" 'window-toggle-split-direction)

  (add-hook 'agda2-mode-hook (lambda ()
    "Modify keymaps used by `agda2-mode'."
    (local-set-key (kbd "M-,") 'agda2-go-back)
    (local-set-key (kbd "C-s") 'agda2-load) ;; load will call save cmd anyway
  ))

  (add-hook 'neotree-mode-hook (lambda ()
    "Modify keymaps used by `neotree-mode'."
    (local-set-key (kbd "n") 'neotree-create-node)
    (local-set-key (kbd "c") 'neotree-copy-node)
    (local-set-key (kbd "r") 'neotree-rename-node)
    (local-set-key (kbd "d") 'neotree-delete-node)
    (local-set-key (kbd "SPC") 'preview-neotree-and-come-back)
  ))
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-bound-variable-face ((t (:foreground "forest green"))))
 '(agda2-highlight-coinductive-constructor-face ((t (:foreground "deep pink"))))
 '(agda2-highlight-datatype-face ((t (:foreground "#ac422f"))))
 '(agda2-highlight-dotted-face ((t (:foreground "light salmon"))))
 '(agda2-highlight-error-face ((t (:background "red" :foreground "dim gray"))))
 '(agda2-highlight-field-face ((t (:foreground "deep pink"))))
 '(agda2-highlight-function-face ((t (:foreground "#ff6800"))))
 '(agda2-highlight-incomplete-pattern-face ((t (:background "light salmon" :foreground "dim gray"))))
 '(agda2-highlight-inductive-constructor-face ((t (:foreground "deep pink"))))
 '(agda2-highlight-keyword-face ((t (:foreground "blue violet"))))
 '(agda2-highlight-macro-face ((t (:foreground "aquamarine4"))))
 '(agda2-highlight-module-face ((t (:foreground "dark green"))))
 '(agda2-highlight-number-face ((t (:foreground "red"))))
 '(agda2-highlight-operator-face ((t (:foreground "gold"))))
 '(agda2-highlight-postulate-face ((t (:foreground "yellow"))))
 '(agda2-highlight-primitive-face ((t (:foreground "gold"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "red"))))
 '(agda2-highlight-record-face ((t (:foreground "#ac422f"))))
 '(agda2-highlight-string-face ((t (:foreground "red"))))
 '(agda2-highlight-symbol-face ((t (:foreground "dodger blue"))))
 '(agda2-highlight-termination-problem-face ((t (:background "hot pink" :foreground "dim gray"))))
 '(agda2-highlight-typechecks-face ((t (:background "deep sky blue" :foreground "dim gray"))))
 '(agda2-highlight-unsolved-constraint-face ((t (:background "yellow" :foreground "dim gray"))))
 '(agda2-highlight-unsolved-meta-face ((t (:background "orange" :foreground "dim gray"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(dired-directory ((t (:foreground "deep sky blue"))))
 '(dired-header ((t (:foreground "VioletRed2"))))
 '(dired-symlink ((t (:foreground "forest green"))))
 '(font-latex-math-face ((t (:foreground "magenta"))))
 '(font-latex-sedate-face ((t (:foreground "dark violet"))))
 '(font-latex-verbatim-face ((t (:foreground "forest green"))))
 '(idris-semantic-bound-face ((t (:foreground "navajo white"))))
 '(idris-semantic-function-face ((t (:foreground "#ff6800"))))
 '(idris-semantic-type-face ((t (:foreground "lime green"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "blue violet"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "blue violet"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "blue violet"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "blue violet"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "blue violet"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "blue violet"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "blue violet"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "blue violet"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "blue violet")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-face-groups nil)
 '(agda2-highlight-level (quote interactive))
 '(face-font-selection-order (quote (:width :height :weight :slant)))
 '(flyspell-auto-correct-binding [ignore])
 '(font-use-system-font t)
 '(paradox-github-token t)
 '(python-check-command "flake8"))
