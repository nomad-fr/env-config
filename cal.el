;;;



(require 'khalel)

(setq khalel-khal-command "/usr/bin/khal")
(setq khalel-vdirsyncer-command "/usr/bin/vdirsyncer")

(setq khalel-capture-key "e")

(setq khalel-import-org-file-confirm-overwrite nil)

(setq khalel-import-end-date "+30d")

(setq khalel-import-org-file (concat org-directory "/" "calendar.org"))

;; (setq org-agenda-files '("/local/org-caldav"))

;; (khalel-add-capture-template)

(setq khalel-default-calendar "smv")
