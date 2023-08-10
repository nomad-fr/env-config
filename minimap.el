
;; minimap-mode always
(minimap-mode 1)




(setq minimap-window-location 'right)
(add-to-list 'minimap-major-modes 'markdown-mode)
(add-to-list 'minimap-major-modes 'eww-mode)
(add-to-list 'minimap-major-modes 'conf-unix-mode)
(add-to-list 'minimap-major-modes 'salt-mode)
(add-to-list 'minimap-major-modes 'python-mode)
(add-to-list 'minimap-major-modes 'html-mode)

(setq minimap-recenter-type 'free)



(setq
 ;; Configure minimap position
 minimap-window-location 'right ; Minimap on the right side
 minimap-width-fraction 0.0 ; slightly smaller minimap
 minimap-minimum-width 20 ; also slightly smaller minimap
 )


(defcustom +minimap-highlight-line nil
  "Whether minimap should highlight the current line more prominent."
  :set (lambda (sym value)
         (set sym value)
         (if (null value) (+minimap-set-highlight-line--off) (+minimap-set-highlight-line--on)))
  :type 'boolean
  :group 'minimap)

;; Change colors of minimap
(custom-set-faces
 ;; Change background
 '(minimap-active-region-background
   ((((background dark)) (:background "#2F4B73"))
    (t (:background "#D6D6D6")))
   :group 'minimap))
