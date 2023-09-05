;; tab bar mode

;; (tab-bar-mode t) ;; turn it on for all modes by default
(global-set-key (kbd "s-<prior>") 'tab-bar-switch-to-prev-tab)
(global-set-key (kbd "s-<next>") 'tab-bar-switch-to-next-tab)
(global-set-key (kbd "s-k") 'tab-bar-close-tab)
(global-set-key (kbd "s-n") 'tab-bar-new-tab)

(setq tab-bar-show 1)                      ;; hide bar if <= 1 tabs open
(setq tab-bar-close-button-show nil)       ;; hide tab close / X button
(setq tab-bar-new-tab-choice "*dashboard*")  ;; buffer to show in new tabs
;; (setq tab-bar-tab-hints t)                 ;; show tab numbers

(setq tab-bar-format '(tab-bar-format-tabs tab-bar-separator))  ;; elements to include in bar
(add-to-list 'tab-bar-format 'tab-bar-format-align-right 'append)
(add-to-list 'tab-bar-format 'tab-bar-format-global 'append)
(setq display-time-format "%I:%M")
(setq display-time-interval 60)
(setq display-time-default-load-average nil)
(display-time)

;; Basic Usage
;;     tab-bar-mode - Enable display of the tab bar
;;     tab-new (C-x t 2) - Create a new tab
;;     tab-next (C-x t o, evil: g t) - Move to the next tab (also known as tab-bar-switch-to-next-tab)
;;     tab-bar-switch-to-prev-tab (evil: g T) - Switch to the previous tab
;;     tab-rename (C-x t r) - Rename the current tab (or numbered tab with prefix arg)
;;     tab-close (C-x t 0) - Close the current tab
;;     tab-close-other (C-x t 1) - Close other tabs
;;     tab-bar-undo-close-tab - Reopen the last closed tab
;;     tab-move (C-x t m) - Move the current tab to the right (or left with negative prefix)
;;     tab-bar-select-tab-by-name (C-x t RET) - Select tab by name using completion
