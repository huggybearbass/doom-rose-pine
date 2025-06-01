;;; doom-rose-pine-theme.el --- A Rose Pine theme for Doom Emacs matching Neovim -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: June 1, 2025
;; Author: Ethan Henley assisted by Claude Sonnet 4
;; Maintainer: Ethan Henley
;; Source: https://github.com/rose-pine/neovim
;;
;;; Commentary:
;;
;; A Rose Pine theme for Doom Emacs that matches the Neovim Rose Pine theme
;;
;;; Code:

(require 'doom-themes)

;;
;;; Variables

(defgroup doom-rose-pine-theme nil
  "Options for the `doom-rose-pine' theme."
  :group 'doom-themes)

(defcustom doom-rose-pine-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-rose-pine-theme
  :type 'boolean)

(defcustom doom-rose-pine-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-rose-pine-theme
  :type 'boolean)

(defcustom doom-rose-pine-colorful-headers nil
  "If non-nil, use more colorful headers in org-mode and markdown."
  :group 'doom-rose-pine-theme
  :type 'boolean)

(defcustom doom-rose-pine-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line."
  :group 'doom-rose-pine-theme
  :type '(choice integer boolean))

;;
;;; Theme definition

(def-doom-theme doom-rose-pine
  "A dark theme inspired by Rose Pine for Neovim"

  ;; name        default   256           16
  ((bg         '("#191724" "color-235"   "black"        ))
   (fg         '("#e0def4" "color-230"   "brightwhite"  ))

   ;; Rose Pine official palette
   (base       '("#191724" "color-235"   "black"        ))
   (surface    '("#1f1d2e" "color-236"   "brightblack"  ))
   (overlay    '("#26233a" "color-237"   "brightblack"  ))
   (muted      '("#6e6a86" "color-243"   "brightblack"  ))
   (subtle     '("#908caa" "color-245"   "brightblack"  ))
   (text       '("#e0def4" "color-230"   "brightwhite"  ))
   (love       '("#eb6f92" "color-211"   "red"          ))
   (gold       '("#f6c177" "color-222"   "yellow"       ))
   (rose       '("#ebbcba" "color-224"   "brightred"    ))
   (pine       '("#31748f" "color-73"    "blue"         ))
   (foam       '("#9ccfd8" "color-152"   "cyan"         ))
   (iris       '("#c4a7e7" "color-183"   "magenta"      ))

   ;; Rose Pine highlight colors
   (highlight-low  '("#21202e" "color-236" "brightblack"))
   (highlight-med  '("#403d52" "color-238" "brightblack"))
   (highlight-high '("#524f67" "color-240" "brightblack"))

   ;; These are off-palette colours intended for use with terminal applications
   (bg-alt     surface)
   (fg-alt     subtle)

   ;; Standard Doom base colors (required)
   (base0      bg)
   (base1      '("#1e1c31" "color-236" "brightblack"))
   (base2      surface)
   (base3      overlay)
   (base4      muted)
   (base5      '("#817c9c" "color-244" "brightblack"))
   (base6      subtle)
   (base7      '("#c5c3ce" "color-251" "brightwhite"))
   (base8      text)

   (grey       muted)
   (red        love)
   (orange     '("#ea9a97" "color-216" "brightred"))
   (green      foam)
   (teal       pine)
   (yellow     gold)
   (blue       pine)
   (dark-blue  '("#26233a" "color-237" "blue"))
   (magenta    iris)
   (violet     iris)
   (cyan       foam)
   (dark-cyan  '("#56949f" "color-109" "cyan"))

   ;; Face categories -- required for all themes
   (highlight      highlight-med)
   (vertical-bar   overlay)
   (selection      highlight-med)
   (builtin        love)
   (comments       (if doom-rose-pine-brighter-comments pine muted))
   (doc-comments   (if doom-rose-pine-brighter-comments pine subtle))
   (constants      gold)
   (functions      rose)
   (keywords       pine)
   (methods        rose)
   (operators      subtle)
   (type           foam)
   (strings        gold)
   (variables      text)
   (numbers        gold)
   (region         highlight-med)
   (error          love)
   (warning        gold)
   (success        foam)
   (vc-modified    gold)
   (vc-added       foam)
   (vc-deleted     love)

   ;; Custom categories
   (hidden     `(,(car bg) "color-235" "black"))
   (-modeline-bright doom-rose-pine-brighter-modeline)
   (-modeline-pad
    (when doom-rose-pine-padded-modeline
      (if (integerp doom-rose-pine-padded-modeline) doom-rose-pine-padded-modeline 4)))

   (modeline-fg     fg)
   (modeline-fg-alt subtle)

   (modeline-bg
    (if -modeline-bright
        surface
      `(,(doom-darken (car bg) 0.1) ,@(cdr base))))
   (modeline-bg-alt
    (if -modeline-bright
        overlay
      `(,(doom-darken (car bg) 0.15) ,@(cdr base))))
   (modeline-bg-inactive   `(,(car bg-alt) ,@(cdr base)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt))))

  ;;;; Base theme face overrides
  (((line-number &override) :foreground muted)
   ((line-number-current-line &override) :foreground text :weight 'bold)
   ((font-lock-comment-face &override)
    :background (if doom-rose-pine-brighter-comments (doom-lighten bg 0.05)))
   ((font-lock-doc-face &override) :slant 'italic)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base highlight))

   ;;;; CSS mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground foam)
   (css-selector             :foreground rose)

   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground foam :weight 'bold)

   ;;;; elscreen
   (elscreen-tab-other-screen-face :background overlay :foreground muted)

   ;;;; ivy
   (ivy-current-match :background highlight-med :distant-foreground base :weight 'normal)
   (ivy-minibuffer-match-face-1 :foreground foam :weight 'bold)
   (ivy-minibuffer-match-face-2 :foreground pine :weight 'bold)
   (ivy-minibuffer-match-face-3 :foreground iris :weight 'bold)
   (ivy-minibuffer-match-face-4 :foreground love :weight 'bold)

   ;;;; LaTeX mode
   (font-latex-math-face :foreground foam)

   ;;;; markdown-mode
   (markdown-markup-face :foreground muted)
   (markdown-header-face :inherit 'bold :foreground love)
   ((markdown-code-face &override) :background surface)
   (mmm-default-submode-face :background surface)

   ;;;; org-mode
   (org-level-1 :foreground love :weight 'bold :height (if doom-rose-pine-colorful-headers 1.3 1.0))
   (org-level-2 :foreground gold :weight 'bold :height (if doom-rose-pine-colorful-headers 1.2 1.0))
   (org-level-3 :foreground rose :weight 'bold :height (if doom-rose-pine-colorful-headers 1.1 1.0))
   (org-level-4 :foreground foam :weight 'bold)
   (org-level-5 :foreground pine :weight 'bold)
   (org-level-6 :foreground iris :weight 'bold)
   (org-level-7 :foreground subtle :weight 'bold)
   (org-level-8 :foreground muted :weight 'bold)
   (org-hide :foreground hidden)
   (org-indent :inherit '(org-hide fixed-pitch))
   (org-ellipsis :underline nil :background bg :foreground muted)
   ((org-quote &override) :background surface)
   (org-todo :foreground love :weight 'bold)
   (org-done :foreground foam :weight 'bold)

   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt)))

   ;;;; web-mode
   (web-mode-builtin-face :foreground love)
   (web-mode-css-selector-face :foreground rose)
   (web-mode-css-property-name-face :foreground foam)
   (web-mode-css-color-face :foreground gold)
   (web-mode-css-string-face :foreground gold)
   (web-mode-css-function-face :foreground pine)
   (web-mode-css-variable-face :foreground text)
   (web-mode-html-attr-name-face :foreground foam)
   (web-mode-html-attr-value-face :foreground gold)
   (web-mode-html-keyword-face :foreground pine)
   (web-mode-html-tag-face :foreground love)
   (web-mode-keyword-face :foreground pine)
   (web-mode-string-face :foreground gold)
   (web-mode-type-face :foreground foam)
   (web-mode-function-name-face :foreground rose)

   ;;;; magit
   (magit-branch-local :foreground foam)
   (magit-branch-remote :foreground pine)
   (magit-diff-added :foreground foam :background (doom-blend foam bg 0.1))
   (magit-diff-removed :foreground love :background (doom-blend love bg 0.1))
   (magit-diff-added-highlight :foreground foam :background (doom-blend foam bg 0.2) :weight 'bold)
   (magit-diff-removed-highlight :foreground love :background (doom-blend love bg 0.2) :weight 'bold)
   (magit-hash :foreground gold)
   (magit-section-heading :foreground rose :weight 'bold)

   ;;;; company
   (company-tooltip :background surface :foreground text)
   (company-tooltip-selection :background overlay :foreground text)
   (company-tooltip-common :foreground foam :weight 'bold)
   (company-tooltip-common-selection :foreground foam :weight 'bold)
   (company-scrollbar-bg :background overlay)
   (company-scrollbar-fg :background muted)

   ;;;; treemacs
   (treemacs-directory-face :foreground foam)
   (treemacs-file-face :foreground text)
   (treemacs-root-face :foreground love :weight 'bold)
   (treemacs-git-modified-face :foreground gold)
   (treemacs-git-added-face :foreground foam)
   (treemacs-git-renamed-face :foreground iris)
   (treemacs-git-ignored-face :foreground muted)

   ;;;; dired
   (dired-directory :foreground foam :weight 'bold)
   (dired-executable :foreground rose)
   (dired-symlink :foreground iris)
   (dired-marked :foreground love :background highlight-low)

   ;;;; flycheck
   (flycheck-error :underline `(:style wave :color ,love))
   (flycheck-warning :underline `(:style wave :color ,gold))
   (flycheck-info :underline `(:style wave :color ,foam))

   ;;;; lsp-mode
   (lsp-face-highlight-textual :background highlight-low)
   (lsp-face-highlight-read :background highlight-med)
   (lsp-face-highlight-write :background highlight-high)

   ;;;; tree-sitter
   (tree-sitter-hl-face:keyword :foreground pine :weight 'bold)
   (tree-sitter-hl-face:type :foreground foam)
   (tree-sitter-hl-face:type.builtin :foreground foam :weight 'bold)
   (tree-sitter-hl-face:constructor :foreground rose)
   (tree-sitter-hl-face:function :foreground rose)
   (tree-sitter-hl-face:function.builtin :foreground love)
   (tree-sitter-hl-face:function.call :foreground rose)
   (tree-sitter-hl-face:function.macro :foreground love)
   (tree-sitter-hl-face:variable :foreground text)
   (tree-sitter-hl-face:variable.builtin :foreground love)
   (tree-sitter-hl-face:variable.parameter :foreground iris)
   (tree-sitter-hl-face:variable.special :foreground love)
   (tree-sitter-hl-face:property :foreground foam)
   (tree-sitter-hl-face:property.definition :foreground foam)
   (tree-sitter-hl-face:comment :foreground muted :slant 'italic)
   (tree-sitter-hl-face:doc :foreground subtle :slant 'italic)
   (tree-sitter-hl-face:string :foreground gold)
   (tree-sitter-hl-face:string.special :foreground iris)
   (tree-sitter-hl-face:escape :foreground iris)
   (tree-sitter-hl-face:embedded :foreground text)
   (tree-sitter-hl-face:number :foreground gold)
   (tree-sitter-hl-face:boolean :foreground love)
   (tree-sitter-hl-face:constant :foreground gold)
   (tree-sitter-hl-face:constant.builtin :foreground love)
   (tree-sitter-hl-face:constant.macro :foreground love)
   (tree-sitter-hl-face:label :foreground foam)
   (tree-sitter-hl-face:operator :foreground subtle)
   (tree-sitter-hl-face:punctuation :foreground subtle)
   (tree-sitter-hl-face:punctuation.bracket :foreground subtle)
   (tree-sitter-hl-face:punctuation.delimiter :foreground subtle)
   (tree-sitter-hl-face:punctuation.special :foreground love)
   (tree-sitter-hl-face:tag :foreground love)
   (tree-sitter-hl-face:attribute :foreground foam)

   ;;;; which-key
   (which-key-key-face :foreground foam)
   (which-key-group-description-face :foreground iris)
   (which-key-command-description-face :foreground text)
   (which-key-local-map-description-face :foreground gold)

   ;;;; whitespace-mode
   (whitespace-tab :foreground muted :background surface)
   (whitespace-newline :foreground muted)
   (whitespace-trailing :foreground love :background surface)
   (whitespace-line :background surface :foreground love)

   ;;;; highlight-indent-guides
   (highlight-indent-guides-odd-face :background surface)
   (highlight-indent-guides-even-face :background surface)
   (highlight-indent-guides-character-face :foreground overlay))

  ;;;; Base theme variable overrides
  ;; ()
  )

;;; doom-rose-pine-theme.el ends here
