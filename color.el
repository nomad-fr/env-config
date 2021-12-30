;; Color ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; M-x list-color-display to show all available color
;; custom colors

(set-face-attribute 'region nil :background "gray15") ;; couleur de fond des selections

(custom-set-faces
 '(minimap-active-region-background
   ((((background dark)) (:background "#181818"))
    (t (:background "gray10")) ;;color of minimap active region
    "Face for the active region in the minimap.
     By default, this is only a different background color."
    :group 'minimap))
 )

(set-foreground-color "grey")
(set-face-foreground 'font-lock-string-face  "#123467")
(set-face-foreground 'font-lock-comment-face  "#009380")
(make-face-italic 'font-lock-comment-face)	
(set-face-foreground 'font-lock-keyword-face  "orange")
(make-face-bold 'font-lock-keyword-face)  	
(set-face-foreground 'font-lock-string-face   "#77bbea") ; bleu cyant
(set-face-foreground 'font-lock-preprocessor-face "pink")
(set-face-foreground 'font-lock-constant-face   "green")	
(set-face-foreground 'font-lock-function-name-face "pink")	
(set-face-foreground 'font-lock-type-face    "lightblue")
(make-face-bold 'font-lock-type-face)	  
(set-face-foreground 'font-lock-variable-name-face "grey")	
(set-face-foreground 'font-lock-warning-face "red")
(set-face-underline  'font-lock-warning-face "red")		
(set-face-foreground 'minibuffer-prompt "orange")	
(set-background-color "#000000") ; dark grey


;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
(defface hl-line '((t (:background "pink")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t) ;; turn it on for all modes by default
(add-hook 'term-mode-hook (lambda ()
                    (setq-local global-hl-line-mode
                                nil)))


;; Color end ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
