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
(defun system-type-is-linux ()
  (interactive)
  "Return true if system is GNU/Linux-based"
  (string-equal system-type "gnu/linux"))
;; Check if system is berkeley-unix
(defun system-type-is-bsd ()
  (interactive)
  "Return true if system is berkeley-unix"
  (string-equal system-type "berkeley-unix"))

;; ‘M-x insert-system-name‘ or ‘M-x insert-system-type‘ to test them.


(if (system-type-is-linux)
    (message "\nLinux\n")  
)


(if (system-type-is-bsd)
    (message "\nBSD\n")  
)

;; Set default font
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-20"))

;; (setq python-shell-interpreter "/usr/bin/python3")

;; run Python code using Emacs
    ;; C-c C-z : open a python shell
    ;; C-c C-c : run the content of the buffer in the opened python shell
    ;; C-c C-r : run the selected region in the python shell

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--colors=Linux --profile=default --simple-prompt"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; Turn off alarms completelyus
(setq ring-bell-function 'ignore)

;; Preventing the Creation of Backup Files
 
;; (set scrollBarWidth "50")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

;; pb de signature de packages
(setq package-check-signature nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-enabled-themes '(boron))
 '(custom-safe-themes
   '("381d853432d631889a6d7a379f5b26db5bd4358400ff480e2596ab9ef92544de"
     "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378"
     "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d"
     "82225f1fa1e4d3b00c63700f691fc0dc7c9bdab8a996e6a78f451f9a15bd74fc"
     "b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d"
     "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7"
     "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9"
     "83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6"
     "b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97"
     "5e2cdea6453f8963037723ab91c779b203fb201bf5c377094440f0c465d688ec"
     "a3e99dbdaa138996bb0c9c806bc3c3c6b4fd61d6973b946d750b555af8b7555b"
     "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1"
     "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298"
     "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d"
     "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223"
     "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa"
     "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e"
     "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" default))
 '(flycheck-grammalecte-download-without-asking t)
 '(flycheck-grammalecte-report-apos nil)
 '(flycheck-grammalecte-report-spellcheck t)
 '(grammalecte-download-without-asking t)
 '(ispell-dictionary nil)
 '(markdown-command "pandoc")
 '(org-agenda-files nil)
 '(package-selected-packages
   '(all-the-icons-nerd-fonts apache-mode async auctex auto-complete-auctex
			      auto-package-update boron-theme csharp-mode
			      cyberpunk-theme dash dash-functional dashboard
			      deft demap dictionary dired-sidebar dirvish
			      editorconfig eglot elixir-ts-mode elm-mode emamux
			      epl exec-path-from-shell faceup flycheck
			      flycheck-grammalecte frame-local
			      git-commit-insert-issue gruvbox-theme
			      helm-directory idlwave khalel less-css-mode magit
			      markdown-mode minimap mu4e-marker-icons ob-tmux
			      org org-caldav ov paredit pdf-tools pkg-info
			      pov-mode projectile python s salt-mode
			      smart-mode-line
			      smart-mode-line-atom-one-dark-theme
			      tangotango-theme track-changes tramp
			      transpose-frame verilog-mode vterm wallpaper
			      which-key window-tool-bar with-emacs
			      xah-elisp-mode yaml-mode zenburn-theme))
 '(sml/pre-modes-separator (propertize " " 'face 'sml/modes)))

(defun markdown-to-html ()
  (interactive)
  (let* ((basename (file-name-sans-extension (buffer-file-name)))
         (html-filename (format "%s.html" basename)))
    (shell-command (format "pandoc -o %s %s"
                           html-filename (buffer-file-name)))
    (find-file-other-window html-filename)))

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

;; (autoload 'setnu-mode "~/config/emacs/setnu.el" "set-nu" t)
;; (global-set-key (kbd "<f6>") 'linum-mode)	; show line number with f6

(global-set-key (kbd "<f7>") 'ispell-region)	; ispell region with f7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; time mode
;; insérer automatiquement des time stamps
;; indiquez dans les 8 premières lignes du fichier ;; Time-stamp: <>
(add-hook 'write-file-hooks 'time-stamp)

(add-hook 'org-mode-hook #'auto-fill-mode)
(setq-default fill-column 80)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mutt emacs editor 
(defun axels-mail-mode-hook () (turn-on-auto-fill)		;;; Auto-Fill is necessary for mails 
;;	(turn-on-font-lock)					;;; Font-Lock is always cool *g* 
	(flush-lines "^\\(> \n\\)*> -- \n\\(\n?> .*\\)*")	;;; Kills quoted sigs. 
	(not-modified)						;;; We haven't changed the buffer, haven't we? *g* 
	(mail-text)						;;; Jumps to the beginning of the mail text 
	(setq make-backup-files nil)				;;; No backups necessary. 
) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;some special purpose modes

;; http://www.emacswiki.org/emacs/DeleteSelectionMode
(delete-selection-mode 1)

;; ;;;; ;; muttrc-mode (used when editing muttrc)
;; ;;;; ;; http://www.emacswiki.org/cgi-bin/wiki/download/muttrc-mode.el
;;    (autoload 'muttrc-mode "~/config/emacs/muttrc-mode.el" "mode for editing muttrc" t)
;;     (setq auto-mode-alist 
;;     (append '(("muttrc\\'" . muttrc-mode))
;;             auto-mode-alist)) 
;;     (add-to-list 'auto-mode-alist '("\\.muttrc[^/]*\\'"   . muttrc-mode))

;; python-mode
  ;; (autoload 'python-mode "~/config/emacs/python-mode.el" "Python Mode." t)
  ;;     (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;; org mode
;; (add-to-list 'load-path "PATH_TO_WHERE_YOU_UNPACKED_ORGMODE")
;;(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

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
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.page\\'" . markdown-mode))

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
;; (add-to-list 'auto-mode-alist '("\\.eml\\'" . mail-mode))

;; pf mode
(autoload 'pf-mode "~/.emacs.d/pf-mode.el" "Pf Mode." t)
      (add-to-list 'auto-mode-alist '("\\pf.conf\\'" . pf-mode))

;; show-parent-mode always
(show-paren-mode 1)


;; melpa
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
		         ("melpa" . "https://melpa.org/packages/"))
      )

;; (require 'org-caldav)

;; (setq org-caldav-url "http://cloud.neuronfarm.net/remote.php/caldav/calendars/nomad/default%20calendar")
;; (setq org-caldav-calendar-id "<>")
;; (setq org-caldav-inbox (expand-file-name "/localstorage/task-org-caldav/default calendar"))
;; (setq org-caldav-files `(,org-caldav-inbox))

;; http://cloud.neuronfarm.net/remote.php/caldav/calendars/nomad/appart

;; (require 'org-caldav)
;;  (setq org-caldav-calendars
;;        ;; '((:calendar-id "default calendar" :files ("/localstorage/nomad/task-org-caldav/default")
;;        ;; 		       :inbox       "/localstorage/nomad/task-org-caldav/from_default"
;;        ;; 		       :url         "https://cloud.neuronfarm.net/remote.php/caldav/calendars/nomad")

;;        '((:calendar-id "ipgp" :files ("/localstorage/nomad/task-org-caldav/ipgp")
;; 		       :url         "https://cloud.neuronfarm.net/remote.php/caldav/calendars/nomad")

;;     ))

(setq org-caldav-delete-calendar-entries 'ask)
(setq org-icalendar-timezone "Europe/Paris")

;; show line numbers
;; show line number with f6 : see key bindings
;; https://github.com/targzeta/linum-highlight-current-line-number
;; (add-to-list 'load-path "~/VersionControl/GitHub/linum-highlight-current-line-number/")
;; (require 'linum-highlight-current-line-number)
;; (setq linum-format 'linum-highlight-current-line-number)
;; If you want line number to start at 0, put this in your emacs init file:
;; (require 'linum)
;; (setq linum-format
;;       (lambda (line)
;;         (propertize (number-to-string (1- line)) 'face 'linum)))
;; show line numbers ; end

;; sidebar : https://github.com/sebastiencs/sidebar.el
(add-to-list 'load-path "/home/nomad/VersionControl/GitHub/font-lock+.el")
(add-to-list 'load-path "~/.local/share/icons-in-terminal/") ;; If it's not already done
;; (add-to-list 'load-path "/home/nomad/VersionControl/GitHub/sidebar.el")
;; (require 'sidebar)
;; (global-set-key (kbd "C-x C-F") 'sidebar-open)
;; (global-set-key (kbd "C-x C-a") 'sidebar-buffers-open)
;; sidebar : end

;; 
;; (unless window-system
;;   (add-hook 'linum-before-numbering-hook
;; 	    (lambda ()
;; 	      (setq-local linum-format-fmt
;; 			  (let ((w (length (number-to-string
;; 					    (count-lines (point-min) (point-max))))))
;; 			    (concat "%" (number-to-string w) "d"))))))

;; (defun linum-format-func (line)
;;   (concat
;;    (propertize (format linum-format-fmt line) 'face 'linum)
;;    (propertize " " 'face 'mode-line)))

;; (unless window-system
;;   (setq linum-format 'linum-format-func))
;;

;; open full screen
;; (add-to-list 'default-frame-alist '(fullscreen . fullboth)) 
(add-to-list 'default-frame-alist '(fullscreen . maximized)) 


;; bookmark + ;; https://github.com/emacsmirror/bookmark-plus.git
(add-to-list 'load-path "~/VersionControl/GitHub/bookmark-plus")
(require 'bookmark+)
(setq desktop-buffers-not-to-save "^$")

;; open link in firefox           ;;;;;;;;;;;;;;;;;;;;;;;;;
;; make emacs always use its own browser for opening URL links
;;(setq browse-url-browser-function 'eww-browse-url)
;; work around the bogus "-remote" flag specified by browse-url-firefox
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "firefox")
;; open link in firefox end       ;;;;;;;;;;;;;;;;;;;;;;;;;


;; spell check ;;;;

;; (add-hook 'org-mode-hook 'flycheck-mode)
;; (add-hook 'rst-mode-hook 'flycheck-mode)


;;(package-install 'flycheck)

(global-flycheck-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)

(with-eval-after-load 'flycheck  
  (require 'flycheck-grammalecte)
  (setq flycheck-grammalecte-report-esp nil)
  (add-to-list 'flycheck-grammalecte-enabled-modes 'markdown-mode)
  (add-to-list 'flycheck-grammalecte-enabled-modes 'rst-mode)
  (add-to-list 'flycheck-grammalecte-enabled-modes 'mu4e-compose-mode)
  (flycheck-grammalecte-setup))
;; spell check end  ;;;;

(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
	(select-frame frame)

	(set-face-attribute 'default nil :height 100)
	;; (set-face-attribute 'default nil :height 116) ;; 116 minimum size sinon le theme bave

	;; ajustement de la taille de police en fonction de la resolution
	(when window-system
	  ;; U4320 : 3840 x 2160
	  ;; moitiée : 1920 x 2160
	  (if (= (x-display-pixel-height) 2160)
	      (set-face-attribute 'default nil :height 170))	  
	  ;; Dell Xps13 : 3840 x 2400
	  (if (= (x-display-pixel-height) 2400)
	      (set-face-attribute 'default nil :height 70))

	  ;; Dell Xps13 : 3840 x 2400
	  (if (= (x-display-pixel-height) 2560)
	      (set-face-attribute 'default nil :height 70))

	  )	  		
)))

;; load my config files
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "mu4e.el")
(load-user-file "tramp.el")
(load-user-file "org-mode.el")
(load-user-file "flycheck.el")
(load-user-file "deft.el")
(load-user-file "color.el")
(load-user-file "tab-bar.el")
(setq dashboard-display-icons-p t)
(load-user-file "dashboard.el")
(load-user-file "cal.el")
;; (load-user-file "org-caldav.el")
;; (load-user-file "nano-agenda.el")

;;(load-user-file "dashboard.el")
;; (load-user-file "org-caldav.el")
;; (load-user-file "nano-agenda.el")

;; (setq bookmark-default-file  (concat user-emacs-directory "bookmarks"))
;; (bookmark-load bookmark-default-file t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-active-region-background ((((background dark)) (:background "#181818")) (t (:background "#D3D3D3222222")) "Face for the active region in the minimap.\12              By default, this is only a different background color." :group 'minimap)))

(fset 'euro
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 56 return 35 120 50 48 65 67 return] 0 "%d")) arg)))

;; key to launch eshell
(global-set-key [f5] 'eshell)

;; key to launch demap minimap
(use-package demap
	     :ensure t
	     :commands (demap-toggle))
(global-set-key [f4] 'demap-toggle)

;; launch dired-sidebar
(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))
(global-set-key [f3] 'dired-sidebar-toggle-sidebar)

;; (desktop-save-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(when (display-graphic-p)
  (require 'all-the-icons))
