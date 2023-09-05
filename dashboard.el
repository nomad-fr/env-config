(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; (setq dashboard-startup-banner nil)

;; Content is not centered by default. To center, set
;; (setq dashboard-center-content t)

;; To disable shortcut "jump" indicators for each section, set
;; (setq dashboard-show-shortcuts nil)


