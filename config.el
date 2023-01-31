;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Markus Fruhmann"
      user-mail-address "markus@fruhmann.dev")

;; doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
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
(setq doom-font (font-spec :family "Hasklug Nerd Font" :size 16)
      doom-big-font (font-spec :family "Hasklug Nerd Font" :size 24)
      doom-variable-pitch-font (font-spec :family "Arial" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")


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

;; ----------------------------------------
;; Personal Configuration (from Practicalli)

;; Open Doom Emacs maximised
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Modeline
;; - add current workspace name
;; - add major mode icon
(after! doom-modeline
  (setq doom-modeline-persp-name t
        doom-modeline-major-mode-icon t))

;; Projects
;; Define a project path to discover projects using SPC Tab D
;; https://docs.projectile.mx/projectile/usage.html
;; (setq projectile-project-search-path '(("~/Documents/projects/" . 1)))

;; Disable projectile cache - saves requirement to invalidate cache when moving files
;; (setq projectile-enable-caching nil)

;; Delete whitespace on save, including in markdown-mode
(setq ws-butler-global-exempt-modes '(special-mode comint-mode term-mode eshell-mode diff-mode))

;; Completion results ordered by history of use and the alphabetical
(setq vertico-sort-function 'vertico-sort-history-alpha)

;; If on a Mac, switch option and command key
(when IS-MAC
  (setq mac-option-modifier nil
        mac-command-modifier 'meta
        select-enable-clipboard t))

;; Set scroll margin
(setq scroll-margin 2)

;; ----------------------------------------


;; ----------------------------------------
;; Additional Configuration
;; Files to load go here!
;; (load! "path/to/file")

;; Which-key and Evil Key Bindings - Spacemacs style
(load! "+bindings")

;; Clojure mode & Cider Configuration + key bindings
(load! "+clojure")

;; Magit and Version Control
(load! "+git")

;; LSP Configuration
(load! "+lsp")

;; Markdown mode
;; TODO: fix errors when uncommenting!
;; (load! "+markdown.el")

;; Org-mode  configuraiton
(load! "+org-mode")

;; Structural Editing - Smartparens
(load! "+smartparens")

;; Configure packages outside of Doom modules
;; - keycast
(load! "+package-config")
