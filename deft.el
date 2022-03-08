(require 'deft)
(setq deft-directory "/localstorage/clouds/Cloud-Neuronfarm/Notes")
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
;; (setq deft-auto-save-interval 0)

;; enable searching for files in subdirectories (those not matching deft-recursive-ignore-dir-regexp)
(setq deft-recursive t)

(global-set-key [f8] 'deft)



;;function to run deft in specified directory
(defun deft-smv (dir)
  "Run deft in directory DIR but doesn't change deft-directory"
  (let ((temp deft-directory))
  (setq deft-directory dir)
  (switch-to-buffer "*Deft*")
  (kill-this-buffer)
  (deft)
  (setq deft-directory temp)
  ))

(defun deft-neuronfarm (dir)
  "Run deft in directory DIR but doesn't change deft-directory"
  (let ((temp deft-directory))
  (setq deft-directory dir)
  (switch-to-buffer "*Deft*")
  (kill-this-buffer)
  (deft)
  (setq deft-directory temp)
  ))



(global-set-key (kbd "C-c d")
                (lambda () (interactive) (deft-neuronfarm "/localstorage/clouds/Cloud-Neuronfarm/Notes")))
(global-set-key (kbd "C-c D")
                (lambda () (interactive) (deft-smv "/localstorage/clouds/Cloud-SMV/Notes")))
(provide 'deft)
