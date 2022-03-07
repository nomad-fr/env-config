;; automatically go to org-mode when a file with .org extension is opened
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Define the location of the file to hold tasks
(setq org-default-notes-file "~/Cloud-NeuronFarm/Notes/.todo-list.org")

;; definition to call org-capture
(define-key global-map "\C-cc" 'org-capture)

(setq org-todo-keywords 
      '((sequence "TODO" "DOING" "BLOCKED" "REVIEW" "|" "DONE" "ARCHIVED")))

;; Setting Colours (faces) for todo states to give clearer view of work 
(setq org-todo-keyword-faces
  '(("TODO" . org-warning)
   ("DOING" . "yellow")
   ("BLOCKED" . "red")
   ("REVIEW" . "orange")
   ("DONE" . "green")
   ("ARCHIVED" .  "blue")))

