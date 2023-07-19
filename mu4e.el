;; mu4e : begin
(require 'mu4e)
;; (require 'org-mu4e)

(global-set-key [f9] 'mu4e)

(add-to-list 'load-path "~/VersionControl/GitHub/mu4e-overview/mu4e-overview.el")

;;send mail using postfix
(setq send-mail-function 'sendmail-send-it)
(setq message-send-mail-function 'message-send-mail-with-sendmail)

(setq mu4e-maildir (expand-file-name "~/.localsyncmail/neuronfarm/"))

;; (add-to-list 'mu4e-bookmarks
;;   '( :name  "ASR"
;;      :query "maildir:/IPGP/Listes/ASR"
;;      :key   ?z))
;; (add-to-list 'mu4e-bookmarks
;;   '( :name  "Respire"
;;      :query "maildir:/IPGP/Listes/Respire"
;;      :key   ?y))
;; (add-to-list 'mu4e-bookmarks
;;   '( :name  "Respire Copile"
;;      :query "maildir:/IPGP/Listes/Respire/copile"
;;      :key   ?x))
;; (add-to-list 'mu4e-bookmarks
;;   '( :name  "hackesr"
;;      :query "maildir:/IPGP/Listes/hackesr"
;;      :key   ?d))
;; (add-to-list 'mu4e-bookmarks
;;   '( :name  "IPGP"
;;      :query "maildir:/IPGP"
;;      :key   ?a))
;; (add-to-list 'mu4e-bookmarks
;;   '( :name  "Inbox"
;;      :query "maildir:/Inbox"
;;      :key   ?c))
;; (add-to-list 'mu4e-bookmarks
;;   '( :name  "Big messages"
;;      :query "size:5M..500M"
;;      :key   ?b))
;; (add-to-list 'mu4e-bookmarks
;;   '( :name  "Flag"
;;      :query "flag:flagged"
;;      :key   ?f))
;; (add-to-list 'mu4e-bookmarks
;;   '( :name  "IPGP : PDF in attachment"
;;      :query "maildir:/IPGP and mime:application/pdf"
;;      :key   ?g
;;      :hide-unread t
;;      ))
;; (add-to-list 'mu4e-bookmarks
;;   '( :name  "IPGP : more than7 days less than 2 month"
;;      :query "maildir:/IPGP and date:2m..1W"
;;      :key   ?h))
;; (add-to-list 'mu4e-bookmarks
;;   '( :name  "Unread not in Listes"
;; 	    :query "flag:unread NOT flag:listg"
;; 	    :key   ?i))
;; (add-to-list 'mu4e-bookmarks
;;   '( :name  "Spams"
;; 	    :query "maildir:/Spams/*"
;; 	    :key   ?j))

;; Today's messages -- date:today..now
;; Unread messages  -- flag:unread AND NOT flag:trashed
;; Last 7 days      -- date:7d..now


(setq mu4e-bookmarks
      `(
	( :name "Today NOT List"
          :query "date:today..now AND NOT maildir:/IPGP/Listes/*"
	  :key ?t)
	( :name  "Drafts"
	  :query "flag:draft and maildir:/Drafts/"
	  :key   ?d)	
	( :name  "Inbox"
	  :query "maildir:/Inbox"
	  :key   ?i)		
	( :name  "IPGP"
	  :query "maildir:/IPGP"
	  :key   ?I)
	( :name  "Flagged"
	  :query "flag:flagged"
	  :key   ?f)
	( :name  "Spams"
	  :query "maildir:/Spams"
	  :key   ?S)	
	( :name "IPGP   : last 7 days"
	  :query "maildir:/IPGP AND date:7d..now"
	  :key ?l)
	( :name  "IPGP   : 2 month old till last week"
	  :query "maildir:/IPGP and date:2m..1w"
	  :key   ?L)	
	( :name "List   : * till last week"
          :query "date:today..1w AND maildir:/IPGP/Listes/*"
	  :key ?T)	
	( :name  "List   : * all of them"
		 :query "maildir:/IPGP/Listes/*"
		 :key   ?g)
	( :name  "List   : ASR"
		 :query "maildir:/IPGP/Listes/ASR"
		 :key   ?a)	
	( :name  "List   : Respire"
	  :query "maildir:/IPGP/Listes/Respire"
	  :key   ?r)
	( :name  "List   : Respire Copile"
	  :query "maildir:/IPGP/Listes/Respire/copil"
	  :key   ?R)
	( :name  "List   : stockage"
	  :query "maildir:/IPGP/Listes/stockage"
	  :key   ?s)
	( :name  "List   : FreeBSD bugs"
	  :query "maildir:/IPGP/Listes/FreeBSD/bugs"
	  :key   ?B)
	( :name  "List   : FreeBSD fs"
	  :query "maildir:/IPGP/Listes/FreeBSD/fs"
	  :key   ?F)	
	( :name  "Unread : NOT list folder"
		 :query "flag:unread NOT maildir:/IPGP/Listes/*"
		 :key   ?U)
	( :name "Unread : All messages"
		:query "flag:unread AND NOT flag:trashed"
	  :key ?u)		
	))
      
(setq mu4e-inbox-folder "/Inbox")
(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-sent-folder   "/Inbox")
(setq mu4e-trash-folder  "/Trash")

;; rename file when moving them
(setq mu4e-change-filenames-when-moving t)

;; compose messages in a separate frame
(setq mu4e-compose-in-new-frame t)


;; mu4e seems to remove myself from the Cc:-list
;; how can I prevent that?
(setq mu4e-compose-keep-self-cc t)


;; default singature
;;(setq message-signature-file "~/.emacs.d/.signature.neuronfarm") ; put your signature in this file

; get mail
(setq mu4e-get-mail-command "mbsync -c ~/.emacs.d/.mbsyncrc neuronfarm"
      mu4e-html2text-command "w3m -T text/html"
      mu4e-update-interval 120
      mu4e-headers-auto-update t
      ;; mu4e-compose-signature-auto-include nil
      )

;; enable inline images
(setq mu4e-view-show-images t)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(setq mu4e-contexts
      `( ,(make-mu4e-context
       	  :name "NeuronFarm"
       	  :enter-func (lambda () (mu4e-message "Entering NeuronFarm context"))
          :leave-func (lambda () (mu4e-message "Leaving NeuronFarm context"))
       	  ;; we match based on the contact-fields of the message
       	  :match-func (lambda (msg)
       			(when msg 
       			  (mu4e-message-contact-field-matches msg 
       			    :to "nomad@neuronfarm.net")))
       	  :vars '( ( user-mail-address	    . "nomad@neuronfarm.net"  )
       		   ( user-full-name	    . "Michel Le Cocq" )
		   )) 
       ,(make-mu4e-context
	  :name "IPGP"
	  :enter-func (lambda () (mu4e-message "Switch to the IPGP context"))
	  ;; no leave-func
	  ;; we match based on the maildir of the message
	  ;; this matches maildir /Arkham and its sub-directories
	  :match-func (lambda (msg)
			(when msg
			  (string-match-p "^/IPGP" (mu4e-message-field msg :maildir))))
	  :vars '( ( user-mail-address	     . "lecocq@ipgp.fr" )
		   ( user-full-name	     . "Michel Le Cocq" )
		   )) ))      
      
;; set `mu4e-context-policy` and `mu4e-compose-policy` to tweak when mu4e should
;; guess or ask the correct context, e.g.

;; start with the first (default) context; 
;; default is to ask-if-none (ask when there's no context yet, and none match)
;; (setq mu4e-context-policy 'pick-first)

;; compose with the current context is no context matches;
;; default is to ask 
;; (setq mu4e-compose-context-policy nil)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)
;; attachments go here
(setq mu4e-attachment-dir  "~/Downloads")

;; when you reply to a message, use the identity that the mail was sent to
;; the cpbotha variation -- function that checks to, cc and bcc fields
(defun cpb-mu4e-is-message-to (msg rx)
  "Check if to, cc or bcc field in MSG has any address in RX."
  (or (mu4e-message-contact-field-matches msg :to rx)
      (mu4e-message-contact-field-matches msg :cc rx)
      (mu4e-message-contact-field-matches msg :bcc rx)))

;; setup default identity here:
;; general emacs mail settings; used when composing e-mail
;; the non-mu4e-* stuff is inherited from emacs/message-mode
(setq user-mail-address "nomad@neuronfarm.net"
      user-full-name  "Michel Le Cocq")

;; don't save message to Sent Messages, IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

(add-hook 'mu4e-compose-mode-hook
   ;; add me in Bcc based on context
   (lambda()
    (let* ((ctx (mu4e-context-current))
  	    (name (if ctx (mu4e-context-name ctx))))
      (when name
  	(cond
  	  ((string= name "NeuronFarm")
            (save-excursion (message-add-header "Bcc: nomad@neuronfarm.net\n")))
  	  ((string= name "IPGP")
	   (save-excursion (message-add-header "Bcc: lecocq@ipgp.fr\n")))) ))
    )
   ;; spell check and flychek during composition
   ;; limit to 72
   (defun my-do-compose-stuff ()
           "My settings for message composition."
           (set-fill-column 72)
           (flycheck-mode)
	   (flyspell-mode)
	  )
)

(defun my-mu4e-choose-signature ()
  "Insert one of a number of sigs"
  (interactive)
  (let ((message-signature
          (mu4e-read-option "Signature:"
            '(("pro" .
	       (concat
"Michel LE COCQ : CNRS : UMR7154 - UMS3454\n"
"IPGP : Institut de Physique du Globe de Paris\n"
"Service Mutualisé Virtualisation / Sismologie / Géoscope\n"
"Bureau 313 : Tél +33 (0)6 26 56 15 61\n"))
            ("maison" .
	       (concat
"Michel Le Cocq | 06 16 25 43 24\n"
"45 bis Boulevard des Muriers\n"
"94210 La Varenne Saint Hilaire\n"))
               ("full-short" .
		"Michel Le Cocq\n")
               ("short" .
		"Michel Le Cocq\n")
               ("really-short" .
		"M\n")	       
	       ))))
    (save-restriction
      (narrow-to-region (point) (point))
      (message-insert-signature))
  ))

(add-hook 'mu4e-compose-mode-hook
          (lambda () (local-set-key (kbd "C-c C-w") #'my-mu4e-choose-signature)) )
 
;; a V opens the current message in the default web browsers.
(add-to-list 'mu4e-view-actions '("ViewInBrowser" . mu4e-action-view-in-browser) t)
(add-to-list 'mu4e-view-actions '("browse message" . mu4e-action-view-in-browser))

;; 29.12.2021 Désactivé pour voir su cela résoud le souci de mails qui n'apparaissent pas si 'vue' sur un autre client
;; speed up indexing
;; https://www.djcbsoftware.nl/code/mu/mu4e/Retrieval-and-indexing.html
(setq
  mu4e-index-cleanup nil      ;; don't do a full cleanup check
  mu4e-index-lazy-check t)    ;; don't consider up-to-date dirs

;; mu4e :  end

