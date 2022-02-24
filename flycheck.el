;; spell check ;;;;

;; (if (system-type-is-bsd) ;; specifique FreeBSD
;;     (message "\tConfig flychech-grammalecte specific BSD")

;;     (flycheck-define-checker grammalecte
;;     "grammalecte"
;;     :command ("/usr/local/bin/grammalecte-server.py")
;;     :error-parser flycheck-parse-checkstyle
;;     :modes (mu4e-compose-mode)
;;     :standard-input t)  
;; )

;; spell check end  ;;;;
