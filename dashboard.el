;; set up the dashboard to open automatically at startup using dashboard-setup-startup-hook
(require 'dashboard)
(dashboard-setup-startup-hook)

;; configure initial-buffer-choice to show Dashboard in frames created with emacsclient -c
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(setq dashboard-week-agenda t)

;; customize which items are displayed
(setq dashboard-items '((recents   . 5)
                        (bookmarks . 5)
                        (projects  . 5)
                        (agenda    . 10)
			))



;; Content is not centered by default. To center, set
(setq dashboard-center-content t)
;; vertically center content
(setq dashboard-vertically-center-content t)

;; To disable shortcut "jump" indicators for each section, set
;; (setq dashboard-show-shortcuts nil)


;; enable cycle navigation between each section:
(setq dashboard-navigation-cycle t)
;; (setq dashboard-icon-type 'all-the-icons)  ; use `all-the-icons' package
(setq dashboard-display-icons-p t)     ; display icons on both GUI and terminal
;; (setq dashboard-icon-type 'nerd-icons) ; use `nerd-icons' package


(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
