(require 'tramp)
;; (setq tramp-verbose 8); had been 3

;; tramp shell work arround for gobt
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@gobt:")
                   "remote-shell" "/usr/local/bin/bash"))

(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@bogt")
                   "remote-shell" "/usr/local/bin/bash"))
