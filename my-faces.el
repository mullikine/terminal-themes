(require 'helm)
; (require 'ivy)

(require 'powerline)

;; Also use term scale factor
;; (myrc-get "macbook_xt_scale_factor")
(set-face-attribute 'default nil :height (string-to-int (chomp (sor (myrc-get "emacs_font_size") "100"))))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:stipple nil :background "#151515" :foreground "#3f3f3f" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :family "Monospace")))))

;; this will break scimax
;; (set-default-font "Unconcealed 12")

(set-face-stipple 'default nil)
(set-face-inverse-video 'default nil)
(set-face-underline 'default nil)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:stipple nil :background "white" :weight bold :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal)))))

;; Put this in create frame instead. That's ok
(set-face-bold 'default t)
;; (set-face-attribute 'default (selected-frame) :weight 'bold)
(set-face-attribute 'default nil :weight 'bold)

(set-font-encoding 'default t)


;; (face-all-attributes 'mode-line)

(set-face-attribute 'mode-line nil
                    :box '(:line-width 5))

(set-face-attribute 'mode-line nil
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :box nil)
(set-face-attribute 'mode-line-highlight nil
                    :box nil)

(require 'lsp-ui)
(set-face-attribute 'lsp-ui-sideline-symbol nil
                    :box nil)
(set-face-attribute 'lsp-ui-sideline-current-symbol nil
                    :box nil)


(require 'popup)

;; (set-face-foreground 'fringe "#000000")
;; (set-face-background 'fringe "#111111")

(set-face-foreground 'fringe "#111111")
(set-face-background 'fringe "#000000")

(set-face-foreground 'popup-menu-face "#aa9922")
(set-face-background 'popup-menu-face "#111111")
(set-face-foreground 'popup-menu-selection-face "#111111")
(set-face-background 'popup-menu-selection-face "#aa9922")

(set-face-foreground 'mode-line "#222222")
(set-face-foreground 'mode-line-inactive "#222222")
(set-face-background 'mode-line "#111111")
(set-face-background 'mode-line-inactive "#111111")

(set-face-foreground 'lsp-ui-sideline-current-symbol "#66ff66")
(set-face-background 'lsp-ui-sideline-current-symbol "#000000")
(set-face-foreground 'lsp-ui-sideline-symbol "#6666ff")
(set-face-background 'lsp-ui-sideline-symbol "#000000")
;; "#753505"

(set-face-foreground 'lsp-ui-sideline-symbol-info "#444444")
(set-face-foreground 'lsp-ui-sideline-symbol-info "#753505")
;; lsp-ui-sideline-symbol-info

(set-face-foreground 'lsp-ui-peek-filename "#880000")
(set-face-background 'lsp-ui-peek-filename "#111111")
;; (set-face-foreground 'lsp-ui-peek-selection "#884444")
;; (set-face-foreground 'lsp-ui-peek-selection "#666600")
(set-face-foreground 'lsp-ui-peek-selection "#448844")
(set-face-background 'lsp-ui-peek-selection "#222222")
;; (set-face-foreground 'lsp-ui-peek-header "#66aa66")
(set-face-foreground 'lsp-ui-peek-header "#222222")
(set-face-background 'lsp-ui-peek-header "#111111")
;; (set-face-foreground 'lsp-ui-peek-footer "#aa66aa")
(set-face-foreground 'lsp-ui-peek-footer "#222222")
(set-face-background 'lsp-ui-peek-footer "#111111")
(set-face-foreground 'lsp-ui-peek-highlight "#4444ff")
(set-face-background 'lsp-ui-peek-highlight "#222222")


(set-face-foreground 'lsp-ui-sideline-global nil)
(set-face-background 'lsp-ui-sideline-global nil)




(set-face-foreground 'flyspell-incorrect "#cc2222")
(set-face-background 'flyspell-incorrect "#222222")
(set-face-underline 'flyspell-incorrect nil)
(set-face-background 'flyspell-duplicate "#222222")
(set-face-foreground 'flyspell-duplicate "#cc9922")
(set-face-underline 'flyspell-duplicate nil)


;; (set-face-background 'flycheck-info "#331111")
(set-face-background 'flycheck-info "#222222")
(set-face-background 'flycheck-error "#222222")
(set-face-background 'flycheck-warning "#222222")
(set-face-underline 'flycheck-info nil)
(set-face-underline 'flycheck-error nil)
(set-face-underline 'flycheck-warning nil)

; (require 'lsp-diagnostics)
;; These aren't defined. I need to use custom
;; (set-face-background 'lsp-lsp-flycheck-warning-unnecessary-face "#222222")
;; (set-face-underline 'lsp-lsp-flycheck-warning-unnecessary-face nil)
(custom-set-faces '(lsp-lsp-flycheck-warning-unnecessary-face ((t (:background "#222222" :foreground nil)))))

(require 'lsp-headerline)
(set-face-background 'lsp-headerline-breadcrumb-path-error-face nil)
(set-face-foreground 'lsp-headerline-breadcrumb-path-error-face "#662222")
(set-face-underline 'lsp-headerline-breadcrumb-path-error-face nil)

(set-face-background 'lsp-headerline-breadcrumb-path-hint-face nil)
(set-face-foreground 'lsp-headerline-breadcrumb-path-hint-face "#226622")
(set-face-underline 'lsp-headerline-breadcrumb-path-hint-face nil)

(set-face-background 'lsp-headerline-breadcrumb-path-info-face nil)
(set-face-foreground 'lsp-headerline-breadcrumb-path-info-face "#226622")
(set-face-underline 'lsp-headerline-breadcrumb-path-info-face nil)

(set-face-background 'lsp-headerline-breadcrumb-path-warning-face nil)
(set-face-foreground 'lsp-headerline-breadcrumb-path-warning-face "#666622")
(set-face-underline 'lsp-headerline-breadcrumb-path-warning-face nil)


(set-face-foreground 'mode-line-buffer-id "#222222")
(set-face-foreground 'mode-line-buffer-id-inactive "#222222")


;; sexy but hard to read
;; (set-face-foreground 'default "#3f3f3f")
;; Foreground is nice but it's the background in helm
;; (set-face-foreground 'default "#404040")

(ignore-errors
  (require 'lsp-ui)
  ;; (set-face-background 'lsp-ui-doc-background "#404040")
  ;; (set-face-background 'lsp-ui-doc-background "#151515")
  ;; (set-face-background 'lsp-ui-doc-background "#151515")
  (set-face-background 'lsp-ui-doc-background "#202020")
  ;; (set-face-background 'lsp-ui-doc-background "#202020")
  ;; (set-face-background 'lsp-ui-doc-background "#000000")
  (set-face-foreground 'lsp-ui-doc-background "#404040")
  ;; (set-face-foreground 'lsp-ui-doc-background "#151515")
  ;; (set-face-foreground 'lsp-ui-doc-background "#ff0000")

(set-face-background 'lsp-ui-sideline-global "#151515")
;; Don't do this. It will make teh sideline completely red 
;; (set-face-foreground 'lsp-ui-sideline-global "#753505")

  ;; (set-face-background 'lsp-ui-sideline-global "#202020")
  ;; (set-face-foreground 'lsp-ui-sideline-global "#155015")
  ;; (set-face-foreground 'lsp-ui-sideline-global "#050505")
  ;; (set-face-background 'lsp-ui-sideline-global "#888888")

  (set-face-background 'lsp-ui-peek-peek "#222222")
  (set-face-background 'lsp-ui-peek-peek "#181818"))

(require 'haskell-mode)
;; (set-face-inverse-video 'haskell-constructor-face t)
;; (set-face-inverse-video 'haskell-constructor-face nil)
(set-face-background 'haskell-constructor-face "#222222")


;; ghci commands, c++ #include, etc.
(set-face-background 'font-lock-preprocessor-face "#550055")

;; (set-face-foreground 'org-block "#777777")

(progn
  (set-foreground-color "#404040")
  ;; (set-foreground-color "#505050")
  (set-background-color "#151515")
  ;; (set-background-color "#050505")

  (set-face-foreground 'default "#404040")
  ;; (set-face-foreground 'default "#606060")
                                        ; (set-face-foreground 'default "#454545")
                                        ; (set-face-foreground 'default "#454577") ;; this is a lot like vim's normal foreground (in xterm anyway)
  (set-face-background 'default "#151515")
  ;; (set-face-background 'default "#222222")
  ;; (set-face-background 'default "#111111")
  ;; (set-face-background 'default "#000000")
  )

(require 'lsp-headerline)

;; This is how the toggle buttons *should* work,
;; with 0 to query and nil to toggle
(defun toggle-text-contrast (&optional changestate)
  (interactive)

  ;; 0 is a query
  (if (eq 0 changestate)
      (toggle-myrc "text_high_contrast" nil t)
    (let ((newstate (cond
               ((eq -1 changestate) 1)
               ((eq 1 changestate) nil)
               (t 1 (toggle-myrc "text_high_contrast" nil t)))))
      (toggle-myrc
       "text_high_contrast"
       (if newstate
           "off"
         "on"))
      (set-text-contrast-from-config)))
  ;; The default face is not being permanently set
  ;; (let ((fg (face-attribute 'default :foreground)))
  ;;   (cond
  ;;    ((string-match "#404040" fg)
  ;;     (set-text-contrast-from-config))

  ;;    ((string-match "#606060" fg)
  ;;     (set-text-contrast-from-config)))
  ;;   (if (minor-mode-p lsp-mode)
  ;;       (lsp-ui-doc-show)))
  )

;; The darkest I've managed to get  vertical border so far
(set-face-foreground 'vertical-border "#222222")

;; No fringe color -- like terminal
(set-face-background 'fringe nil)

(defun set-text-contrast-from-config ()
  (interactive)
  (let ((state (myrc-test "text_high_contrast")))
    (if state
        (progn
          (set-face-background 'lsp-ui-doc-background "#151515")
          (set-face-foreground 'default "#606060")
          (set-face-foreground 'lsp-headerline-breadcrumb-path-face "#606060")
          (set-face-background 'default "#000000")
          (set-face-background 'powerline-active0 "#000000")
          (set-face-background 'powerline-active1 "#000000")
          (set-face-background 'powerline-active2 "#000000")
          (set-face-background 'powerline-inactive0 "#000000")
          (set-face-background 'powerline-inactive1 "#000000")
          (set-face-background 'powerline-inactive2 "#000000")
          (set-face-background 'line-number "#000000")
          (set-face-background 'window-divider "#000000")
          (set-face-foreground 'window-divider "#000000")
          (set-face-background 'line-number-current-line "#000000")
          (set-face-background 'vertical-border "#000000")
          (set-face-foreground 'vertical-border "#111111")

          ;; This has not had a noticeable effect yet
          (setq helm-frame-background-color "#000000"))
      (progn
        (set-face-background 'lsp-ui-doc-background "#202020")
        (set-face-foreground 'default "#404040")
        (set-face-foreground 'lsp-headerline-breadcrumb-path-face "#222222")
        (set-face-background 'default "#151515")
        (set-face-background 'powerline-active0 "#111111")
        (set-face-background 'powerline-active1 "#111111")
        (set-face-background 'powerline-active2 "#111111")
        (set-face-background 'powerline-inactive0 "#111111")
        (set-face-background 'powerline-inactive1 "#111111")
        (set-face-background 'powerline-inactive2 "#111111")
        (set-face-background 'line-number "#111111")
        (set-face-background 'line-number-current-line "#111111")
        (set-face-background 'vertical-border "#111111")
        (set-face-foreground 'vertical-border "#222222")

        ;; This has not had a noticeable effect yet
        (setq helm-frame-background-color "#151515")))
    state))


(set-text-contrast-from-config)

(define-key global-map (kbd "<f11>") 'toggle-text-contrast)

(set-face-foreground 'org-block "#447744")
;;; (set-face-background 'org-block "#1c1c1c")
;; (set-face-background 'org-block "#111111")
(set-face-background 'org-block "#151515")
;; Do I really need to enumerate them all for scimax?
;; It broke spacemacs putting these here
;; unset them instead
;; (set-face-background 'org-block-python "#151515")
;; (set-face-background 'org-block-emacs-lisp "#151515")

;; scimax -- this undoes what scimax creates
(if (cl-search "server/user" my-daemon-name)
    (progn
      (set-face-background 'org-block-emacs-lisp nil)
      (set-face-background 'org-block-python nil)
      (set-face-background 'org-block-ipython nil)
      (set-face-background 'org-block-jupyter-hy nil)
      (set-face-background 'org-block-sh nil)))


;; (set-face-background 'org-block-begin-line "#1c1c1c")
(set-face-background 'org-block-begin-line nil)
;; (set-face-background 'org-block-end-line "#1c1c1c")
(set-face-background 'org-block-end-line nil)
;; (set-face-foreground 'org-block-begin-line "#af5faf")
;; (set-face-foreground 'org-block-end-line "#af5faf")
(set-face-foreground 'org-block-begin-line "#222222")
(set-face-foreground 'org-block-end-line "#222222")

(require 'org-faces)
;; Ensure the leading stars are not entirely hidden
(add-hook 'org-mode-hook
          '(lambda ()
             (set-face-background 'org-hide nil)
             (set-face-foreground 'org-hide "#222222")))

;;; (set-face-background 'font-lock-comment-face "#111111")
;; (set-face-background 'font-lock-comment-face "#1c1c1c")
;; (set-face-background 'font-lock-comment-face "#1c1c1c")
;; I think it's better overall to have the same background as normal text
;; (set-face-background 'font-lock-comment-face "#151515")
(set-face-background 'font-lock-comment-face nil)

(set-face-foreground 'org-code "#5fafd7")
(set-face-background 'org-code "#3a3a3a")

(set-face-background 'widget-field "#000000")

;;(set-face-foreground 'variable-pitch "#3a3a3a")

(require 'hl-line)
;; This isn't necessary unless I use gui emacs
;; (set-face-background 'hl-line "#3a3a3a")
(set-face-background 'hl-line "#202020")

;; This is for exordium
(set-face-foreground 'org-level-1 "#5fafd7")

(let ((fg "#444444")
      (bg "#222222"))

  (set-face-foreground 'org-table fg)
  (set-face-background 'org-table bg))

(require 'w3m)
(require 'eww)
(set-face-background 'eww-form-textarea "#1c1c1c")

(require 'shr)
(require 'annotate)

;; spacemacs emacs27 was not getting past this
(ignore-errors
  (let ((fg "#a73f5f")
        (bg "#331111")
        (wfg "#5555ff")
        (wbg "#222222")
        (cfg "#ffcc00")
        (cbg "#222222")
        (xfg "#ff55ff")
        (xbg "#222222"))

    (set-face-foreground 'annotate-annotation-secondary fg)
    (set-face-background 'annotate-annotation-secondary bg)

    (set-face-foreground 'annotate-annotation fg)
    (set-face-background 'annotate-annotation bg)

    ;; red is best because of night time and more shades on 256 color
    ;; terminal
    ;; (set-face-background 'shr-link "#3a3a3a")
    ;; (set-face-foreground 'shr-link "#204080")
    (set-face-foreground 'shr-link fg)
    (set-face-background 'shr-link bg)
    ;; (set-face-foreground 'shr-link "#3f5fa7")
    ;; (set-face-background 'shr-link "#111111")

    (set-face-foreground 'org-link fg)
    (set-face-background 'org-link bg)

    (set-face-foreground 'w3m-anchor fg)
    (set-face-background 'w3m-anchor bg)

    (set-face-foreground 'w3m-current-anchor fg)
    (set-face-background 'w3m-current-anchor bg)

    (set-face-foreground 'w3m-arrived-anchor bg)
    (set-face-background 'w3m-arrived-anchor fg)

    (set-face-foreground 'button fg)
    (set-face-background 'button bg)

    (set-face-foreground 'widget-button wfg)
    (set-face-background 'widget-button wbg)

    (set-face-foreground 'custom-button-pressed wfg)
    (set-face-background 'custom-button-pressed wbg)

    (set-face-foreground 'custom-button-pressed-unraised wfg)
    (set-face-background 'custom-button-pressed-unraised wbg)

    (set-face-foreground 'custom-button-unraised wfg)
    (set-face-background 'custom-button-unraised wbg)

    (set-face-foreground 'custom-link cfg)
    (set-face-background 'custom-link cbg)

    (set-face-foreground 'info-xref xfg)
    (set-face-background 'info-xref xbg)))

(defface org-bold
  '((t :foreground "#d2268b"
       :background "#2e2e2e"
       :weight bold
       :underline t))
  "Face for org-mode bold."
  :group 'org-faces)

(defface org-italic
  '((t :foreground "#8bd226"
       :background "#2e2e2e"
       :weight normal
       :slant italic
       :underline t))
  "Face for org-mode italic."
  :group 'org-faces)

(defface org-underline
  '((t :foreground "#8b26d2"
       :background "#2e2e2e"
       :weight normal
       :slant italic
       :underline t))
  "Face for org-mode underline."
  :group 'org-faces)

(defsetface org-strikethrough
  '((t :foreground "#660000"
       :weight normal
       :strike-through t))
  "Face for org-mode strikethrough.")

(setq org-emphasis-alist
  '(("*" ;; (bold :foreground "Orange" )
     org-bold)
    ("/" ;; italic
     org-italic)
    ("_" ;; underline
     org-underline
     )
    ("=" ;; (:background "maroon" :foreground "white")
     org-verbatim verbatim)
    ("~" ;; (:background "deep sky blue" :foreground "MidnightBlue")
     org-code verbatim)
    ;; ("+" (:strike-through t))
    ("+" org-strikethrough)))

(set-face-foreground 'org-verbatim "#f07000")
;; (set-face-foreground 'org-code "#f070f0")
(set-face-foreground 'org-code "#c0c0c0")

;;(set-face-background 'magit-diff-removed-highlight nil)
;;(set-face-foreground 'magit-diff-removed-highlight "#ff4b4b")
;;(set-face-background 'magit-diff-added-highlight nil)
;;(set-face-foreground 'magit-diff-added-highlight "#d7ff5f")
;;
;;(set-face-foreground 'diff-refine-added "#eeeeee")
;;(set-face-background 'diff-refine-added "#008700")

;; Because spacemacs had different ideas about the verbatim background
(set-face-background 'org-bold "#2e2e2e")
(set-face-background 'org-verbatim "#2e2e2e")
(set-face-background 'org-code "#2e2e2e")
(set-face-background 'org-italic "#2e2e2e")
(set-face-background 'org-underline "#2e2e2e")
(set-face-foreground 'org-underline "#8b26d2")

;; (let ((fg "#d2268b")
;;       (bg "#4e4e4e"))
;;   ;; (set-face-foreground 'bold fg)
;;   ;; (set-face-background 'bold bg)
;;   (set-face-foreground 'bold nil)
;;   (set-face-background 'bold nil))

(let ((fg "#00aa00")
      (bg "#006600")
      (fg_blue "#5555ff")
      (bg_blue "#2222bb")
      (fg_purple "#ff55ff")
      (bg_purple "#bb22bb")
      (fg_limegreen "#55ff55")
      (bg_limegreen "#22bb22")
      (fg_yellow "#ffff55")
      (bg_yellow "#bbbb22")
      (fg_orange "#ffA500")
      (bg_orange "#996200"))

  ;; (set-face-foreground 'region "#4e4e4e")
  ;; (set-face-background 'region "#d7ff5f")

  ;; nice green
  (set-face-foreground 'region fg)
  (set-face-background 'region bg)
  ;; (set-face-inverse-video 'region nil)
  ;; (set-face-inverse-video 'region t)

  ;; inverse video -- it's nice but i prefer green
  ;; (set-face-inverse-video 'region t)
  ;; (set-face-foreground 'region nil)
  ;; (set-face-background 'region nil)

  ;; (set-face-foreground 'default nil)
  ;; (set-face-background 'default nil)
  ;; (set-face-bold 'default nil)
  ;; (set-face-inverse-video 'default t)
  ;; (set-face-inverse-video 'default nil)

  (require 'iedit)
  (set-face-foreground 'iedit-occurrence fg_blue)
  (set-face-background 'iedit-occurrence bg_blue)

  (require 'lsp-mode)
  (set-face-foreground 'lsp-face-highlight-textual fg_orange)
  (set-face-background 'lsp-face-highlight-textual bg_orange)

  ;; (set-face-foreground 'lsp-face-highlight-read fg_yellow)
  ;; (set-face-background 'lsp-face-highlight-read bg_yellow)
  (set-face-foreground 'lsp-face-highlight-read fg_limegreen)
  (set-face-background 'lsp-face-highlight-read bg_limegreen)
  (set-face-foreground 'lsp-face-highlight-write fg_purple)
  (set-face-background 'lsp-face-highlight-write bg_purple)

  (set-face-background 'lsp-headerline-breadcrumb-path-face "#000000")
  (set-face-foreground 'lsp-headerline-breadcrumb-path-face "#222222")

  (set-face-background 'lsp-headerline-breadcrumb-separator-face "#000000")
  (set-face-foreground 'lsp-headerline-breadcrumb-separator-face "#222222")

  (require 'lsp-modeline)
  (require 'lsp-treemacs)
  (set-face-foreground 'lsp-modeline-code-actions-face "#224499")
  (set-face-foreground 'lsp-treemacs-file-error "#660000")
  (set-face-foreground 'lsp-modeline-code-actions-preferred-face "#667700")

  ;; (if (boundp 'iedit-overlay)
  ;;     (progn
  ;;       (set-face-foreground 'iedit-overlay fg_blue)
  ;;       (set-face-background 'iedit-overlay bg_blue)))

  (if (boundp 'evil-search-highlight-persist)
      (progn
        (set-face-foreground 'evil-search-highlight-persist-highlight-face fg)
        (set-face-background 'evil-search-highlight-persist-highlight-face bg)))

  (set-face-foreground 'highlight fg)
  (set-face-background 'highlight bg)


  (require 'smerge-mode)
  ;; Why are these different from scimax to spacemacs
  ;; Also, why are they brightened up?
  (set-face-background 'smerge-refined-removed "#870000")
  (set-face-foreground 'smerge-refined-removed "#b2b2b2")
  (set-face-background 'smerge-refined-change "#870000")
  (set-face-foreground 'smerge-refined-change "#b2b2b2")

  (set-face-background 'smerge-upper "#262626")

  (set-face-background 'smerge-lower "#1c1c1c")
  (set-face-foreground 'smerge-lower "#005f00")

  (set-face-background 'smerge-base "#1c1c1c")
  (set-face-foreground 'smerge-base "#262626")

  (set-face-background 'smerge-markers "#1c1c1c")
  (set-face-foreground 'smerge-markers "#3a3a3a")

  (if (boundp 'hi-yellow)
      (progn
        ;; (set-face-foreground 'hi-yellow "#black")
        ;; (set-face-background 'hi-yellow "#yellow1")
        (set-face-foreground 'hi-yellow fg)
        (set-face-background 'hi-yellow bg))
    (custom-set-faces '(hi-yellow ((t (:background "yellow1" :foreground "black"))))) ))

(require 'highlight-thing)
(let ((fg "#aaaaaa")
      (bg "#666666"))

  ;; (let ((fg "#aa0000")
  ;;       (bg "#660000"))

  ;; (let ((fg "#0000ff")
  ;;       (bg "#000099"))

  ;; (let ((fg "#ffffff")
  ;;       (bg "#999999"))

  (progn
    (set-face-foreground 'highlight-thing fg)
    (set-face-background 'highlight-thing bg)
    ;; (set-face-inverse-video 'highlight-thing nil)
    ))

;; (face-background ')
(set-face-background 'line-number "#000000")
(set-face-foreground 'line-number "#222222")
(set-face-background 'line-number-current-line "#000000")
(set-face-foreground 'line-number-current-line "#444444")

(ignore-errors
  (require 'magit)
  (set-face-background 'magit-section-highlight "#262626")
  ;; (set-face-background 'magit-section-highlight "#1c1c1c")
  )

(require 'term)
(set-face-foreground 'term-color-white "#001000")

(require 'markdown-mode)
(set-face-foreground 'markdown-url-face "#222222")
;; (set-face-foreground 'markdown-url-face "#111111")
(set-face-background 'markdown-url-face "#111111")
;; (set-face-background 'markdown-url-face nil)
;; (set-face-background 'markdown-url-face "#050505")

;; (set-face-background 'avy-background-face nil)
;; (set-face-background 'avy-background-face "#000000")

(require 'eterm-256color)
(set-face-background 'eterm-256color-black nil)
(set-face-foreground 'eterm-256color-black "#000000")
;; This is needed for zsh
(set-face-foreground 'eterm-256color-bright-black "#303030")

(defun my-list-faces (&optional regexp)
  "List all faces, using the same sample text in each.
The sample text is a string that comes from the variable
`list-faces-sample-text'.

If REGEXP is non-nil, list only those faces with names matching
this regular expression.  When called interactively with a prefix
argument, prompt for a regular expression using `read-regexp'."
  (interactive (list (and current-prefix-arg
                          (read-regexp "List faces matching regexp"))))
  (let ((all-faces (zerop (length regexp)))
        (frame (selected-frame))
        (max-length 0)
        faces line-format
        disp-frame window face-name)
    ;; We filter and take the max length in one pass
    (delq nil
          (mapcar (lambda (f)
                    (let ((s (symbol-name f)))
                      (when (or all-faces (string-match-p regexp s))
                        (setq max-length (max (length s) max-length))
                        f)))
                  (sort (face-list) #'string-lessp)))))



;; Maybe I should just do this for all the faces
(dolist (f
         (my-list-faces)
         ;; '(markup-meta-face
         ;;   adoc-align
         ;;   variable-pitch
         ;;   helm-source-header
         ;;   aw-leading-char-face
         ;;   aw-minibuffer-leading-char-face
         ;;   biblio-results-header-face
         ;;   bui-info-heading
         ;;   ccls-tree-root-face
         ;;   ccls-tree-header-line-face
         ;;   cfw:face-toolbar-button-off
         ;;   cfw:face-toolbar-button-on
         ;;   cfw:face-title
         ;;   define-it-headline-face
         ;;   dictionary-word-definition-face
         ;;   edbi:face-title)
         )
  (ignore-errors
    (set-face-attribute f nil :height 1.0 :weight 'bold)))

(defun reload-spacemacs-dark ()
  (interactive)
  (load-theme 'spacemacs-dark)
  (set-face-bold 'default t)

  ;; oddly, setting org-set-heading-height-1 changes this appearance of tables
  (org-set-heading-height-1)
  (load "/home/shane/source/git/config/emacs/config/my-faces.el")
  (load-library "my-lsp-custom")
  (message "reload-spacemacs-dark"))
(defalias 'reload-spacemacs-theme 'reload-spacemacs-dark)

(require 'writegood-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(colour-button-face ((t :foreground nil :background nil :weight bold :inherit nil :underline nil)))
 '(glossary-button-face ((t :foreground "#3fa75f"  :weight bold :underline t)))
 '(hi-yellow ((t (:background "yellow1" :foreground "black"))))
 '(magit-popup-argument ((t (:inverse-video t))))
 '(off-button-face ((t :foreground "#222222" :background "#444444" :weight bold :underline t)))
 '(on-button-face ((t :foreground "#444444" :background "#00aa00" :weight bold :underline t)))
 '(org-strikethrough ((t :foreground "#660000" :weight normal :strike-through t)))
 '(unk-button-face ((t :foreground "#aa00aa" :background "#222222" :weight bold :underline t)))
 '(writegood-duplicates-face ((t (:inherit font-lock-warning-face :foreground "DeepPink"))))
 '(writegood-passive-voice-face ((t (:inherit font-lock-warning-face :foreground "LemonChiffon"))))
 '(writegood-weasels-face ((t (:inherit font-lock-warning-face :foreground "moccasin")))))

;; j:writegood-duplicates-face
;; j:writegood-passive-voice-face
;; j:writegood-weasels-face

(require 'helm)
(set-face-background 'helm-separator "#262626")
(set-face-foreground 'helm-separator "#d72f4f")
(set-face-foreground 'helm-source-header "#262626")
(set-face-background 'helm-source-header "#d72f4f")

(set-face-background 'helm-selection "#262626")
(set-face-foreground 'helm-selection "#d72f4f")

(require 'ivy)
(set-face-foreground 'ivy-current-match "#262626")
(set-face-background 'ivy-current-match "#d72f4f")

(set-face-background 'ivy-minibuffer-match-face-2 "#562626")
(set-face-foreground 'ivy-minibuffer-match-face-2 "#d72f4f")


(require 'telephone-line)

(set-face-background 'telephone-line-evil-emacs "#111111")
(set-face-foreground 'telephone-line-evil-emacs "dark violet")

(set-face-background 'telephone-line-evil-insert "#111111")
(set-face-foreground 'telephone-line-evil-insert "forest green")

(set-face-background 'telephone-line-evil-motion "#111111")
(set-face-foreground 'telephone-line-evil-motion "dark blue")

(set-face-background 'telephone-line-evil-normal "#111111")
(set-face-foreground 'telephone-line-evil-normal "red3")

(set-face-background 'telephone-line-evil-operator "#111111")
(set-face-foreground 'telephone-line-evil-operator "violet")

(set-face-background 'telephone-line-evil-visual "#111111")
(set-face-foreground 'telephone-line-evil-visual "dark orange")

(require 'powerline)

; (ignore-errors
(require 'smart-mode-line)
; )

;; For some reason, when I switched to the Del XPS, 55 became grey
;; (set-face-foreground 'powerline-active0 "#662222")
(set-face-foreground 'powerline-active0 "#222222")
;; (set-face-background 'powerline-active0 "#111111")
(set-face-background 'powerline-active0 "#111111")

(set-face-foreground 'powerline-active1 "#222222")
(set-face-background 'powerline-active1 "#111111")

(set-face-foreground 'powerline-active2 "#333333")
(set-face-background 'powerline-active2 "#111111")

;; For some reason, when I switched to the Del XPS, 66 became grey
;; (set-face-foreground 'powerline-inactive0 "#226622")
;; (set-face-foreground 'powerline-inactive0 "#662222")
(set-face-foreground 'powerline-inactive0 "#222222")
(set-face-background 'powerline-inactive0 "#111111")

(set-face-foreground 'powerline-inactive1 "#222222")
(set-face-background 'powerline-inactive1 "#111111")

(set-face-foreground 'powerline-inactive2 "#333333")
(set-face-background 'powerline-inactive2 "#111111")

(require 'sx-question-print)
(set-face-background 'sx-question-mode-content-face nil)


;; (set-face-background 'markdown-code-face "#111111")
(set-face-background 'markdown-code-face nil)



;; https://stackoverflow.com/questions/884498/how-do-i-intercept-ctrl-g-in-emacs
(defun my-customize-face (face)
  (interactive
   (let ((inhibit-quit t)
         (hlm global-hl-line-mode))
     (if hlm
         (global-hl-line-mode -1))

     (let ((f))
       ;; with-local-quit always returns nil
       (unless (with-local-quit
                 (setq f (str-or (fz (my-list-faces)
                                     (if (and
                                          (face-at-point)
                                          (yn "Face at point?"))
                                         ;; (button-get (button-at-point) 'face)
                                         ;; If no face, check button face
                                         (sym2str
                                          (face-at-point)
                                          ;; (let ((global-hl-line-mode nil))
                                          ;;   (face-at-point))
                                          ))
                                     nil
                                     "face: ")
                                 nil)))
         (progn
           ;; (message "you hit C-g")
           (setq quit-flag nil)))
       (if hlm
           (global-hl-line-mode t))
       (list f))))
  (if face
      (customize-face (str2sym face))))

(require 'calibredb)
(progn
  ;; calibredb-ids-face
  (set-face-foreground 'calibredb-author-face "#990055")
  (set-face-background 'calibredb-author-face nil)

  (set-face-foreground 'calibredb-id-face "#990055")
  (set-face-background 'calibredb-id-face nil)

  (set-face-foreground 'calibredb-title-face "#995555")
  (set-face-background 'calibredb-title-face nil)

  (set-face-foreground 'calibredb-ids-face "#990055")
  (set-face-background 'calibredb-ids-face nil)

  (set-face-foreground 'calibredb-format-face "#990055")
  (set-face-background 'calibredb-format-face nil)

  (set-face-foreground 'calibredb-date-face "#550099")
  (set-face-background 'calibredb-date-face nil)

  (set-face-foreground 'calibredb-edit-annotation-header-title-face "#990055")
  (set-face-background 'calibredb-edit-annotation-header-title-face nil)

  (set-face-foreground 'calibredb-tag-face "#995500")
  (set-face-background 'calibredb-tag-face nil))


(set-face-foreground 'widget-field "#990055")
(set-face-background 'widget-field nil)

(provide 'my-faces)