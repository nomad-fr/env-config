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

;; Set default font
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-20"))

(setq python-shell-interpreter "/usr/bin/python3")

;; Turn off alarms completelyus
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
 '(custom-safe-themes
   (quote
    ("b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" default)))
 '(markdown-command "pandoc")
 '(package-selected-packages
   (quote
    (smart-mode-line-atom-one-dark-theme smart-mode-line org-caldav pov-mode apache-mode salt-mode xah-elisp-mode paredit emamux transpose-frame minimap markdown-mode magit elm-mode auto-package-update auto-complete-auctex auctex)))
 '(sml/mode-width
   (if
       (eq
	(powerline-current-separator)
	(quote arrow))
       (quote right)
     (quote full)))
 '(sml/pos-id-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (car powerline-default-separator-dir)))
		   (quote powerline-active1)
		   (quote powerline-active2))))
     (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (cdr powerline-default-separator-dir)))
		   (quote powerline-active1)
		   (quote sml/global))))
     (:propertize " " face sml/global))))
 '(sml/pre-id-separator
   (quote
    (""
     (:propertize " " face sml/global)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (car powerline-default-separator-dir)))
		   (quote sml/global)
		   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active2)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (cdr powerline-default-separator-dir)))
		   (quote powerline-active2)
		   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes))))


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
       ;; '((:calendar-id "default calendar" :files ("/localstorage/nomad/task-org-caldav/default")
       ;; 		       :inbox       "/localstorage/nomad/task-org-caldav/from_default"
       ;; 		       :url         "https://cloud.neuronfarm.net/remote.php/caldav/calendars/nomad")

       '((:calendar-id "ipgp" :files ("/localstorage/nomad/task-org-caldav/ipgp")
		       :url         "https://cloud.neuronfarm.net/remote.php/caldav/calendars/nomad")

    ))

(setq org-caldav-delete-calendar-entries 'ask)
(setq org-icalendar-timezone "Europe/Paris")

;; bookmark +
(add-to-list 'load-path "~/VersionControl/GitHub/bookmark-plus")
(require 'bookmark+)

;; change the mode-line color using the standard method ;;;
(custom-set-faces
 '(mode-line ((t (:foreground "#295488" :background "darkorange" :box nil))))
 '(mode-line-inactive ((t (:foreground "darkorange" :background "#295488" :box nil))))
 '(ido-subdir ((t (:foreground "#66ff00")))) ;; Face used by ido for highlighting subdirs in the alternatives.
 '(ido-first-match ((t (:foreground "#ccff66")))) ;; Face used by ido for highlighting first match.
 '(ido-only-match ((t (:foreground "#ffcc33")))) ;; Face used by ido for highlighting only match.
 '(ido-indicator ((t (:foreground "#ffffff")))) ;; Face used by ido for highlighting its indicators (don't actually use this)
 '(ido-incomplete-regexp ((t (:foreground "#ffffff")))) ;; Ido face for indicating incomplete regexps. (don't use this either)
 )
;; change the mode-line color end ;;;;;;;;;;;;;;;;;;;;;;;;;

(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
	(select-frame frame)


	
	;; mode-line PowerLine ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; https://github.com/jonathanchu/emacs-powerline
	(add-to-list 'load-path "~/VersionControl/GitHub/emacs-powerline")
	(require 'powerline)
	(require 'cl)
	;; You can choose between different arrow shapes:
	;; (setq powerline-arrow-shape 'arrow)   ;; the default
	(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
	;; (setq powerline-arrow-shape 'arrow14) ;; best for small fonts
	;; change the mode-line color : Change the :foreground, :background, powerline-color1, powerline-color2 to whatever you wish.
	(setq powerline-color1 "#292929")
	(setq powerline-color2 "#494949")
	;; change again mode-line color because of theme
	(custom-set-faces
	  '(mode-line ((t (:foreground "#295488" :background "darkorange" :box nil))))
	  '(mode-line-inactive ((t (:foreground "darkorange" :background "#295488" :box nil)))))
	;; mode-line PowerLine end ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	;; minimap-mode always
	(minimap-mode 1)
	(add-to-list 'minimap-major-modes 'markdown-mode)
	(add-to-list 'minimap-major-modes 'eww-mode)
	(add-to-list 'minimap-major-modes 'conf-unix-mode)
	(add-to-list 'minimap-major-modes 'salt-mode)
	;  disable the mode line in Minimap sidebars
	(add-hook 'minimap-sb-mode-hook (lambda () (setq mode-line-format nil)))
	
	(custom-set-faces
	 '(minimap-active-region-background
	   ((((background dark)) (:background "#181818"))
	    (t (:background "#D3D3D3222222"))
	    "Face for the active region in the minimap.
             By default, this is only a different background color."
	    :group 'minimap))
	 )

	(set-face-attribute 'default nil :height 100)
	  	    	    
	;; Color ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; highlight the current line; set a custom face, so we can
	;; recognize from the normal marking (selection)
	(defface hl-line '((t (:background "#292929")))
	  "Face to use for `hl-line-face'." :group 'hl-line)
	(setq hl-line-face 'hl-line)
	(global-hl-line-mode t) ;; turn it on for all modes by default

	(set-face-attribute 'region nil :background "#494949") ;; couleur de fond des selections
	    
	;; custom colors
	(set-foreground-color "grey")
	(set-face-foreground 'font-lock-string-face  "#123467")
	(set-face-foreground 'font-lock-comment-face  "#009380")
	(make-face-italic 'font-lock-comment-face)	
	(set-face-foreground 'font-lock-keyword-face  "orange")
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
	(set-face-foreground 'minibuffer-prompt "orange")	
	(set-background-color "#000000") ; dark grey 
	;; Color end ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
)))

