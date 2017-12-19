;; Single dot emacs file and per-computer configuration
;; https://sigquit.wordpress.com/2008/09/28/single-dot-emacs-file/
;; Get current system's name
(defun insert-system-name()
  (interactive)
  "Get current system's name"
  (insert (format "%s" system-name)))
;; Get current system type
(defun insert-system-type()
  (interactive)
  "Get current system type"
  (insert (format "%s" system-type)))
;; Check if system is GNU/Linux
(defun system-type-is-gnu ()
  (interactive)
  "Return true if system is GNU/Linux-based"
  (string-equal system-type "gnu/linux"))
;; Check if system is berkeley-unix
(defun system-type-is-gnu ()
  (interactive)
  "Return true if system is berkeley-unix"
  (string-equal system-type "berkeley-unix"))

(setq python-shell-interpreter "/usr/bin/python3")


;; Turn off alarms completely
(setq ring-bell-function 'ignore)

;; Preventing the Creation of Backup Files
 
;; (set scrollBarWidth "50")

;; make emacs always use its own browser for opening URL links
(setq browse-url-browser-function 'eww-browse-url)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; pb de signature de packages
(setq package-check-signature nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "pandoc")
 '(package-selected-packages
   (quote

    (org-caldav pov-mode apache-mode salt-mode xah-elisp-mode paredit emamux transpose-frame minimap markdown-mode magit elm-mode auto-package-update auto-complete-auctex auctex))))

(defun markdown-to-html ()
  (interactive)
  (let* ((basename (file-name-sans-extension (buffer-file-name)))
         (html-filename (format "%s.html" basename)))
    (shell-command (format "pandoc -o %s %s"
                           html-filename (buffer-file-name)))
    (find-file-other-window html-filename)))

;; (add-to-list 'load-path "~/.emacs.d/elpa/python-mode-6.1.3/")
;; (setq py-install-directory "~/.emacs.d/elpa/python-mode-6.1.3/")
;; (require 'python-mode)


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq make-backup-files nil) 

;; Placing temp files in one directory
;;     (setq backup-directory-alist
;;           `((".*" . ,temporary-file-directory)))
;;     (setq auto-save-file-name-transforms
;;           `((".*" ,temporary-file-directory t)))

;; changement de fenetre Ctrl-X fleche
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; redimentionnement des fenetres avec Ctrl-C fleche
(global-set-key (kbd "C-c <up>") 'shrink-window)
(global-set-key (kbd "C-c <down>") 'enlarge-window)
(global-set-key (kbd "C-c <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-c <right>") 'enlarge-window-horizontally)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general settings
(setq inhibit-startup-message t			; don't show startup messages  
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)				; don't show the menu 
(tool-bar-mode -1)				; don't show the tool bar
(scroll-bar-mode -1)				; don't show scroll bar
;; (setq frame-title-format "")

(transient-mark-mode t)				; make the current 'selection' visible
(setq search-highlight t			; highlight when searching... 
      query-replace-highlight t)			; ...and replacing

(fset 'yes-or-no-p 'y-or-n-p)			; enable one letter y/n answers to yes/no 

(global-font-lock-mode t)			; always do syntax highlighting 

(set-language-environment "UTF-8")		; prefer utf-8 for language settings

;;
;; utf-8
;;
(setq locale-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-language-environment 'UTF-8) ; prefer utf-8 for language settings
(set-default-coding-systems 'utf-8)

(setq scroll-conservatively 10000)		; smooth scrolling
;;(mouse-wheel-mode t)				; Scrolling With “Wheeled” Mice
(setq-default ispell-program-name "aspell")	; set spelling program
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                            

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; the modeline
(column-number-mode t)				; show column numbers
(size-indication-mode t)			; show file size (emacs 22+)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key binding

(autoload 'setnu-mode "~/config/emacs/setnu.el" "set-nu" t)
(global-set-key (kbd "<f6>") 'setnu-mode)	; show line number with f6

(global-set-key (kbd "<f7>") 'ispell-region)	; ispell region with f7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; time mode
;; insérer automatiquement des time stamps
;; indiquez dans les 8 premières lignes du fichier ;; Time-stamp: <>
(add-hook 'write-file-hooks 'time-stamp)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mutt emacs editor 
(defun axels-mail-mode-hook () (turn-on-auto-fill)		;;; Auto-Fill is necessary for mails 
;;	(turn-on-font-lock)					;;; Font-Lock is always cool *g* 
	(flush-lines "^\\(> \n\\)*> -- \n\\(\n?> .*\\)*")	;;; Kills quoted sigs. 
	(not-modified)						;;; We haven't changed the buffer, haven't we? *g* 
	(mail-text)						;;; Jumps to the beginning of the mail text 
	(setq make-backup-files nil)				;;; No backups necessary. 
) 

;; (or (assoc "mutt-" auto-mode-alist) 
;; 	(setq auto-mode-alist (cons '("mutt-" . mail-mode) auto-mode-alist))) 
;; 	(add-hook 'mail-mode-hook 'axels-mail-mode-hook) 

;; (server-start) ;;; For use with emacsclient  Starts server for (among others) emacsclient
;; mutt / zopeedit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;some special purpose modes

;; http://www.emacswiki.org/emacs/DeleteSelectionMode
(delete-selection-mode 1)

;;;; ;; muttrc-mode (used when editing muttrc)
;;;; ;; http://www.emacswiki.org/cgi-bin/wiki/download/muttrc-mode.el
   (autoload 'muttrc-mode "~/config/emacs/muttrc-mode.el" "mode for editing muttrc" t)
    (setq auto-mode-alist 
    (append '(("muttrc\\'" . muttrc-mode))
            auto-mode-alist)) 
    (add-to-list 'auto-mode-alist '("\\.muttrc[^/]*\\'"   . muttrc-mode))

;; python-mode
  ;; (autoload 'python-mode "~/config/emacs/python-mode.el" "Python Mode." t)
  ;;     (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;; org mode
;; (add-to-list 'load-path "PATH_TO_WHERE_YOU_UNPACKED_ORGMODE")
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; ditaa
;; http://ditaa.sourceforge.net
;; (setq ditaa-cmd "java -jar ~/config/emacs/ditaa0_9.jar -E ")
;; (defun ditaa-generate ()
;;   (interactive)
;;   (shell-command
;;     (concat ditaa-cmd " " buffer-file-name)))

;; procmail-mode 
;; http://emacs-21.ki.nu/application/procmail-mode.html
  (autoload 'procmail-mode "~/.emacs.d/procmail-mode.el" "mode for editing procmail" t)
  (add-to-list 'auto-mode-alist '("\\.procmail[^/]*\\'"   . procmail-mode))

;; emacs live-preview-mode

;; (autoload 'markdown-preview-eww "~/VersionControl/GitHub/markdown-preview-eww/markdown-preview-eww.el" "Major mode for Previewing Markdown files" t)
;; (autoload 'markdown-preview-eww "~/VersionControl/GitHub/markdown-preview-eww_zonuexe/markdown-preview-eww.el" "Major mode for Previewing Markdown files" t)

;; markdown mode
;;
;; (autoload 'markdown-mode "~/.emacs.d/markdown-mode"
;;   "Major mode for editing Markdown files" t)


(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist      '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist      '("\\.page\\'" . markdown-mode))

(global-set-key (kbd "C-c C-c w") 'markdown-preview)

;; fonctionnel mais ncecessite d'ouvrir un buffer eww avant
(add-to-list 'display-buffer-alist
                 '(".eww". ((display-buffer-pop-up-window) .
                                        ((inhibit-same-window . t)))))

;; git mode : package magit
(autoload 'magit-status "magit" nil t)

;; ido mode : switch-to-buffer 【Ctrl+x b】 will call ido’s version.
(ido-mode 1)

;; dash mode
;;(add-to-list 'load-path "~/")

;; git mode
(autoload 'magit-status "magit" nil t)

;; svn mode


;; pour utiliser avec C-x b
;; (require 'ido)
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
(ido-mode 1)       

;; mail mode
;; (autoload 'mail-mode "mode for editing email" t)
(add-to-list 'auto-mode-alist '("\\.eml\\'" . mail-mode))

;; pf mode
(autoload 'pf-mode "~/.emacs.d/pf-mode.el" "Pf Mode." t)
      (add-to-list 'auto-mode-alist '("\\pf.conf\\'" . pf-mode))

;; minimap-mode always
(minimap-mode 1)
(add-to-list 'minimap-major-modes 'markdown-mode)
(add-to-list 'minimap-major-modes 'eww-mode)

;; show-parent-mode always
(show-paren-mode 1)

;; melpa
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                       	 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ;; ("marmalade" . "https://ojab.ru/marmalade/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
		         ("melpa" . "https://melpa.org/packages/")))

;; (require 'org-caldav)

;; (setq org-caldav-url "http://cloud.neuronfarm.net/remote.php/caldav/calendars/nomad/default%20calendar")
;; (setq org-caldav-calendar-id "<>")
;; (setq org-caldav-inbox (expand-file-name "/localstorage/task-org-caldav/default calendar"))
;; (setq org-caldav-files `(,org-caldav-inbox))

;; http://cloud.neuronfarm.net/remote.php/caldav/calendars/nomad/appart

(require 'org-caldav)
 (setq org-caldav-calendars
  '((:calendar-id "default%20calendar" :files ("/localstorage/task-org-caldav/default")
     :url         "https://cloud.neuronfarm.net/remote.php/caldav/calendars/nomad"
     :inbox       "/localstorage/task-org-caldav/default")
    ;; (:calendar-id "perso" :files ("/localstorage/task-org-caldav/perso")
    ;;  :url         "https://cloud.neuronfarm.net/remote.php/caldav/calendars/nomad"
    ;;  :inbox       ("/localstorage/task-org-caldav/perso"))
    ))

 (setq org-caldav-delete-calendar-entries 'ask)
 (setq org-icalendar-timezone "Europe/Paris")

(if (daemonp)
    (add-hook 'after-make-frame-functions
      (lambda (frame)
	(with-selected-frame frame		
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; Color
	
	;; highlight the current line; set a custom face, so we can
	;; recognize from the normal marking (selection)
	;; don't turn in on globally, only in specific modes (see djcb-c-mode-hook)
	;;(when-available 'global-hl-line-mode
	;;  (progn
	;;    (defface hl-line '((t (:background "blue")))
	    (defface hl-line '((t (:background "#646464")))
	      "Face to use for `hl-line-face'." :group 'hl-line)
	    (setq hl-line-face 'hl-line)
	    (global-hl-line-mode t) ;; turn it on for all modes by default
	
	;; font-lock-warning-face
	;;      for a construct that is peculiar,
	;;      or that greatly changes the meaning of other text, like ‘;;;###autoload’ in Emacs Lisp and ‘#error’ in C.
	;;- font-lock-function-name-face
	;;      for the name of a function being defined or declared.
	;;- font-lock-variable-name-face
	;;      for the name of a variable being defined or declared.
	;; font-lock-keyword-face
	;;      for a keyword with special syntactic significance, like ‘for’ and ‘if’ in C.
	;; font-lock-comment-face
	;;      for comments.
	;; font-lock-comment-delimiter-face
	;;      for comments delimiters, like ‘/*’ and ‘*/’ in C. On most terminals,
	;;      this inherits from font-lock-comment-face.
	;;- font-lock-type-face
	;;      for the names of user-defined data types.
	;;- font-lock-constant-face
	;;      for the names of constants, like ‘NULL’ in C.
	;; font-lock-builtin-face
	;;      for the names of built-in functions.
	;;- font-lock-preprocessor-face
	;;      for preprocessor commands. This inherits, by default, from font-lock-builtin-face.
	;; font-lock-string-face
	;;      for string constants.
	;; font-lock-doc-face
	;;      for documentation strings in the code. This inherits, by default, from font-lock-string-face.
	;; font-lock-negation-char-face
	;;      for easily-overlooked negation characters.
	
	;; custom colors
	  (set-foreground-color "grey")
	  (set-face-foreground 'font-lock-string-face  "#123467")
	  (set-face-foreground 'font-lock-comment-face  "#009380")
	  (make-face-italic 'font-lock-comment-face)
	  
	  (set-face-foreground 'font-lock-keyword-face  "lemonchiffon")
	  (make-face-bold 'font-lock-keyword-face)  
	
	  (set-face-foreground 'font-lock-string-face   "#77bbea") ; bleu cyant
	  (set-face-foreground 'font-lock-preprocessor-face "blue")
	  (set-face-foreground 'font-lock-constant-face   "green")
	
	  (set-face-foreground 'font-lock-function-name-face "pink")
	
	  (set-face-foreground 'font-lock-type-face    "lightblue")
	  (make-face-bold 'font-lock-type-face)
	    
	  (set-face-foreground 'font-lock-variable-name-face "grey")
	  
	  (set-face-foreground 'font-lock-warning-face "red")
	  (set-face-underline  'font-lock-warning-face "red")
	  
	  (set-face-foreground 'mode-line "black")(set-background-color "#102372")
	  (set-face-background 'mode-line "lemonchiffon")
	
	  (set-face-foreground 'minibuffer-prompt "orange")
	
	  (set-background-color "#000000") ; dark grey 
	
	;;custom colors minimap
	
	(set-default-font "monospace-20")
	  
	(custom-set-faces
	 ;; custom-set-faces was added by Custom.
	 ;; If you edit it by hand, you could mess it up, so be careful.
	 ;; Your init file should contain only one such instance.
	 ;; If there is more than one, they won't work right.
	 '(minimap-active-region-background ((((background dark)) (:background "#2A2A2A222222")) (t (:background "#D3D3D3222222"))) nil :group)
	 '(minimap-font-face ((t (:height 45 :width condensed))))
	 '(mode-line ((t (:background "lemonchiffon" :foreground "black" :box (:line-width -1 :style released-button) :height 0.7)))))
	
))))


