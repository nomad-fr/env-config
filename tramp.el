(require 'tramp)
;; (setq tramp-verbose 8); had been 3

;; tramp shell work arround for neuronfarm host
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@gobt:")
                   "remote-shell" "/usr/local/bin/bash"))
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@bogt")
                   "remote-shell" "/usr/local/bin/bash"))


(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@192.168.0.7")
                   "remote-shell" "/usr/local/bin/bash"))
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@gobt.neuronfarm.net")
                   "remote-shell" "/usr/local/bin/bash"))


;; tramp shell work arround for IPGP host
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@bigfish.ipgp.fr:")
                   "remote-shell" "/usr/local/bin/bash"))
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@bigfish:")
                   "remote-shell" "/usr/local/bin/bash"))
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@narval.ipgp.fr:")
                   "remote-shell" "/usr/local/bin/bash"))
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@narval:")
                   "remote-shell" "/usr/local/bin/bash"))
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@beluga.ipgp.fr:")
                   "remote-shell" "/usr/local/bin/bash"))
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@beluga:")
                   "remote-shell" "/usr/local/bin/bash"))
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@magister.ipgp.fr:")
                   "remote-shell" "/usr/local/bin/bash"))
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:root@magister\:")
                   "remote-shell" "/usr/local/bin/bash"))
(add-to-list 'tramp-connection-properties
             (list (regexp-quote "/ssh:magister\:")
                   "remote-shell" "/usr/local/bin/bash"))
