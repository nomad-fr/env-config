;; mu4e : begin

(require 'org-mu4e)

;;send mail using postfix
(setq send-mail-function 'sendmail-send-it)
(setq message-send-mail-function 'message-send-mail-with-sendmail)

(setq mu4e-maildir (expand-file-name "~/.localsyncmail/neuronfarm/"))

(setq mu4e-inbox-folder "/Inbox")
(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-sent-folder   "/Inbox")
(setq mu4e-trash-folder  "/Trash")

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

;; spell check
(add-hook 'mu4e-compose-mode-hook
        (defun my-do-compose-stuff ()
           "My settings for message composition."
           (set-fill-column 72)
           (flyspell-mode)))


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
"Bureau 322 : Tél +33 (0)1.83.95.75.59\n"))
               ("full-short" .
		"Michel Le Cocq\n")
               ("short" .
		"Michel Le Cocq\n")
               ("really-short" .
		"M\n")	       
	       ))))
    (message-insert-signature)))

(add-hook 'mu4e-compose-mode-hook
          (lambda () (local-set-key (kbd "C-c C-w") #'my-mu4e-choose-signature)))


;; mu4e :  end

