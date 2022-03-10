(require 'deft)
(setq deft-directory "~/clouds/Cloud-Neuronfarm/Notes")
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
                (lambda () (interactive) (deft-neuronfarm "~/clouds/Cloud-Neuronfarm/Notes")))
(global-set-key (kbd "C-c D")
                (lambda () (interactive) (deft-smv "~/clouds/Cloud-SMV/Notes")))
(provide 'deft)


;; ;; helm-deft
;; ;; https://github.com/dfeich/helm-deft

;; (load-user-file "helm-deft.el")

;; (setq helm-deft-dir-list '("~/local/Nextcloud/Notes" "~/local/Nextcloud-SMV/Notes"))
;; (setq helm-deft-extension "txt")

;; Advising a function to provide better titles
;; https://jingsi.space/post/2017/04/05/organizing-a-complex-directory-for-emacs-org-mode-and-deft/#configuring-deft

(defun my-deft/strip-quotes (str)
  (cond ((string-match "\"\\(.+\\)\"" str) (match-string 1 str))
        ((string-match "'\\(.+\\)'" str) (match-string 1 str))
        (t str)))

(defun my-deft/parse-title-from-front-matter-data (str)
  (if (string-match "^title: \\(.+\\)" str)
      (let* ((title-text (my-deft/strip-quotes (match-string 1 str)))
             (is-draft (string-match "^draft: true" str)))
        (concat (if is-draft "[DRAFT] " "") title-text))))

(defun my-deft/deft-file-relative-directory (filename)
  (file-name-directory (file-relative-name filename deft-directory)))

(defun my-deft/title-prefix-from-file-name (filename)
  (let ((reldir (my-deft/deft-file-relative-directory filename)))
    (if reldir
        (concat (directory-file-name reldir) " > "))))

(defun my-deft/parse-title-with-directory-prepended (orig &rest args)
  (let ((str (nth 1 args))
        (filename (car args)))
    (concat
      (my-deft/title-prefix-from-file-name filename)
      (let ((nondir (file-name-nondirectory filename)))
        (if (or (string-prefix-p "README" nondir)
                (string-suffix-p ".txt" filename))
            nondir
          (if (string-prefix-p "---\n" str)
              (my-deft/parse-title-from-front-matter-data
               (car (split-string (substring str 4) "\n---\n")))
            (apply orig args)))))))

(provide 'my-deft-title)

(require 'my-deft-title)
  (advice-add 'deft-parse-title :around #'my-deft/parse-title-with-directory-prepended)

;; End - Advising a function to provide better titles
;;

