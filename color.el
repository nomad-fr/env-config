;; Color ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (load-theme 'tangotango)
;; (load-theme 'adwaita-dark)
;; (load-theme 'gruvbox-dark-hard)

;; M-x list-color-display to show all available color
;; custom colors

;; (custom-set-faces
;;  '(ido-first-match ((t (:foreground "#ccff66"))))
;;  '(ido-incomplete-regexp ((t (:foreground "#ffffff"))))
;;  '(ido-indicator ((t (:foreground "#ffffff"))))
;;  '(ido-only-match ((t (:foreground "#ffcc33"))))
;;  '(ido-subdir ((t (:foreground "#66ff00"))))
 
;;  '(mode-line ((t (:foreground "#295488" :background "darkorange" :box nil))))
;;  '(mode-line-inactive ((t (:foreground "darkorange" :background "#295488" :box nil))))

;; '(minimap-active-region-background
;;   ((((background dark)) (:background "#181818"))
;;    (t (:background "#3465A4")) "Face for the active region in the minimap.
;;              By default, this is only a different background color." :group 'minimap))
;; )

;; (add-to-list 'default-frame-alist '(foreground-color . "#E0DFDB"))
;; (add-to-list 'default-frame-alist '(background-color . "black"))

;; (set-face-foreground 'font-lock-string-face  "#123467")
;; (set-face-foreground 'font-lock-comment-face  "#009380")
;; (make-face-italic 'font-lock-comment-face)	
;; (set-face-foreground 'font-lock-keyword-face  "orange")
;; (make-face-bold 'font-lock-keyword-face)  	
;; (set-face-foreground 'font-lock-string-face   "#77bbea") ; bleu cyant
;; (set-face-foreground 'font-lock-preprocessor-face "pink")
;; (set-face-foreground 'font-lock-constant-face   "green")	
;; (set-face-foreground 'font-lock-function-name-face "pink")	
;; (set-face-foreground 'font-lock-type-face    "lightblue")
;; (make-face-bold 'font-lock-type-face)	  
;; (set-face-foreground 'font-lock-variable-name-face "grey")	
;; (set-face-foreground 'font-lock-warning-face "red")
;; (set-face-underline  'font-lock-warning-face "red")		
;; (set-face-foreground 'minibuffer-prompt "orange")	
;; (set-background-color "#000000")

;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
(global-hl-line-mode t) ;; turn it on for all modes by default
(set-face-background 'hl-line "#000000")
;;(set-face-attribute 'region nil :background "gray19") ;; couleur de fond des selections

;; Color end ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
