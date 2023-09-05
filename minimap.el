;;; package --- Summary
;;; Commentary:
;; minimap-mode always
(minimap-mode 1)

(setq minimap-window-location 'right)
(add-to-list 'minimap-major-modes 'markdown-mode)
(add-to-list 'minimap-major-modes 'eww-mode)
(add-to-list 'minimap-major-modes 'conf-unix-mode)
(add-to-list 'minimap-major-modes 'salt-mode)
(add-to-list 'minimap-major-modes 'python-mode)
(add-to-list 'minimap-major-modes 'html-mode)
(add-to-list 'minimap-major-modes 'org-mode)


(setq minimap-recenter-type 'free)

;; (setq
;;   :custom-face
;;   (minimap-font-face ((t (:height 13 :weight bold :width condensed
;;                           :spacing dual-width :family "VT323"))))
;;   (minimap-active-region-background ((t (:extend t :background "gray24"))))
;; )

(setq
 ;; Configure minimap position
 minimap-window-location 'right ; Minimap on the right side
 minimap-width-fraction 0.0 ; slightly smaller minimap
 minimap-minimum-width 20 ; also slightly smaller minimap 
 minimap-hide-scroll-bar nil
 minimap-dedicated-window t
 )

;; remove line truncation arrow in minimap
(define-advice minimap-new-minimap (:after () hide-truncation-indicators)
  "Hide truncation fringe indicators in the minimap buffer."
  (with-current-buffer minimap-buffer-name
    (push '(truncation nil nil) ;; no truncation indicators
          ;; '(truncation nil right-arrow) ;; right indicator only
          ;; '(truncation left-arrow nil) ;; left indicator only
          ;; '(truncation left-arrow right-arrow) ;; default
          fringe-indicator-alist)))

;; ;; Change colors of minimap
;; (custom-set-faces
;;  ;; Change background
;;  '(minimap-active-region-background
;;    ((((background dark)) (:background "#000000"))
;;     (t (:background "#D6D6D6")))
;;    :group 'minimap
;;    )
;; )
