
;; [C-c C-c] clear the filter
;; [C-c C-n] quickly create a new note
;; [C-c C-m] for a filename prompt
;; [C-c C-r] rename file
;; [C-c C-d] delete file
;; [C-c C-q] quit deft.
;; [C-c C-g] refresh the file browser using the current filter string.
;; [C-c C-t] will toggle between incremental and regexp search modes.
;;           Regexp search mode is indicated by an “R” in the mode line.
;; [C-c C-a] archived
;;           Files will be moved to deft-archive-directory, a directory named archive within your deft-directory by default.
;; [C-o]     open a file in another window, without switching to the other window.
;; [C-u C-o] open the file in another window and switch to that window.

;; For more advanced editing operations, you can also edit the filter string in the minibuffer by pressing C-c C-l. While in the minibuffer, the history of previous edits can be cycled through by pressing M-p and M-n.

;; key to launch deft
;; (global-set-key (kbd "C-c d") 'deft)
;; (global-set-key (kbd "<F8>") 'deft)
(global-set-key [f8] 'deft)

(require 'deft)
(setq deft-directory "~/clouds/Cloud-Neuronfarm/Notes")
(setq deft-dir-list '("~/clouds/Cloud-Neuronfarm/Notes" "~/local/Nextcloud-SMV/Notes"))

;; Configure Deft to use .md as the file extension:
(setq deft-default-extension "md")
(setq deft-extension "md")

;; To use Org mode in Deft files
(setq deft-text-mode 'org-mode)

(setq deft-use-filename-as-title t)
(setq deft-use-filter-string-for-filename t)
(setq deft-file-naming-rules '((noslash . "-")
                               (nospace . "-")
                               (case-fn . downcase)))

;; (setq deft-auto-save-interval 0)

;; enable searching for files in subdirectories (those not matching deft-recursive-ignore-dir-regexp)
(setq deft-recursive t)

;; ;;function to run deft in specified directory
;; (defun deft-smv (dir)
;;   "Run deft in directory DIR but doesn't change deft-directory"
;;   (let ((temp deft-directory))
;;   (setq deft-directory "~/clouds/Cloud-Neuronfarm/Notes")
;;   (switch-to-buffer "*Deft*")
;;   (kill-this-buffer)
;;   (deft)
;;   (setq deft-directory temp)
;;   ))

;; (defun deft-neuronfarm (dir)
;;   "Run deft in directory DIR but doesn't change deft-directory"
;;   (let ((temp deft-directory))
;;   (setq deft-directory "~/local/Nextcloud-SMV/Notes")
;;   (switch-to-buffer "*Deft*")
;;   (kill-this-buffer)
;;   (deft)
;;   (setq deft-directory temp)
;;   ))

;; (global-set-key (kbd "C-x C-d")
;; 		(lambda () (interactive) (deft-neuronfarm "~/clouds/Cloud-Neuronfarm/Notes")))		
;; (global-set-key (kbd "C-x C-e")
;;                 (lambda () (interactive) (deft-smv "~/clouds/Cloud-SMV/Notes")))

(provide 'deft)
(global-set-key (kbd "C-x C-d") 'my-deft-cd)
;; voir : https://github.com/jrblevin/deft/issues/65

;; fonction pour changer de repertoire...
(defun my-deft-cd ()
  "Run Deft in selected directory.
Prompt the user for a directory and run Deft in it."
  (interactive)
  (let ((deft-directory (expand-file-name (read-directory-name "Deft directory: "))))
    (if (get-buffer deft-buffer)
        (and (switch-to-buffer deft-buffer) (deft-refresh))
      (deft))))




;; ;; helm-deft
;; ;; https://github.com/dfeich/helm-deft

;; (load-user-file "helm-deft.el")

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

