;; (setq calendar-week-start-day 1)

;; This is the sync on close function; it also prompts for save after syncing so
;; no late changes get lost 
  (defun org-caldav-sync-at-close ()
    (org-caldav-sync)
    (save-some-buffers))

;; This is the delayed sync function; it waits until emacs has been idle for 
;; "secs" seconds before syncing.  The delay is important because the caldav-sync
;; can take five or ten seconds, which would be painful if it did that right at save.  
;; This way it just waits until you've been idle for a while to avoid disturbing 
;; the user.
(defvar org-caldav-sync-timer nil
  "Timer that `org-caldav-push-timer' used to reschedule itself, or nil.")
(defun org-caldav-sync-with-delay (secs)
  (when org-caldav-sync-timer
    (cancel-timer org-caldav-sync-timer))
  (setq org-caldav-sync-timer
	      (run-with-idle-timer
	       (* 1 secs) nil 'org-caldav-sync)))

;; URL of the caldav server
;; (setq org-caldav-url "https://NEXTCLOUD-SERVER-URL/remote.php/dav/calendars/USERID")
;; calendar ID on server
;; (setq org-caldav-calendar-id "CALENDAR-ID")


;; Actual calendar configuration edit this to meet your specific needs
;;(setq org-caldav-url "https://cloud.neuronfarm.net/remote.php/dav/calendars/nomad/")

(setq org-caldavs
      '(
	(:caldav-url "https://cloud.neuronfarm.net/remote.php/dav/calendars/nomad/")
	(:caldav-url "https://smv-cloud.ipgp.fr/remote.php/dav/calendars/lecocq/")
	))

(setq org-caldav-calendars
      '(
	(:calendar-id "appart"
                      :files ("/local/org-caldav/appart.org")
                      :inbox "/local/org-caldav/appart-inbox.org")	
	(:calendar-id "vacances-michel"
                      :files ("/local/org-caldav/vacances-michel.org")
                      :inbox "/local/org-caldav/vacances-michel.org")
	(:calendar-id "gueko"
                      :files ("/local/org-caldav/gueko.org")
                      :inbox "/local/org-caldav/gueko.org")
	
	))

(setq org-caldav-backup-file "/local/org-caldav/org-caldav-backup.org")
(setq org-caldav-save-directory "/local/org-caldav/")

(setq org-icalendar-alarm-time 1)
;; This makes sure to-do items as a category can show up on the calendar
(setq org-icalendar-include-todo t)
;; This ensures all org "deadlines" show up, and show up as due dates
(setq org-icalendar-use-deadline '(event-if-todo event-if-not-todo todo-due))
;; This ensures "scheduled" org items show up, and show up as start times
(setq org-icalendar-use-scheduled '(todo-start event-if-todo event-if-not-todo))
;; Add the delayed save hook with a five minute idle timer
(add-hook 'after-save-hook
	        (lambda ()
	          (when (eq major-mode 'org-mode)
		          (org-caldav-sync-with-delay 300))))
;; Add the close emacs hook
(add-hook 'kill-emacs-hook 'org-caldav-sync-at-close)


(setq org-agenda-files '("/local/org-caldav"))



(setq org-agenda-start-day "-3d")
(setq org-agenda-span 14)
(setq org-agenda-start-on-weekday nil)

