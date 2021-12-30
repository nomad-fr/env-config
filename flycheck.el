;; spell check ;;;;

(require 'flycheck)

'(flycheck-grammalecte-download-without-asking t)
'(flycheck-grammalecte-report-apos nil)
'(flycheck-grammalecte-report-spellcheck t)
'(grammalecte-download-without-asking t)

(add-hook 'org-mode-hook 'turn-on-flyspell)

;;(package-install 'flycheck)

(global-flycheck-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)

(with-eval-after-load 'flycheck  
  (require 'flycheck-grammalecte)
  (setq flycheck-grammalecte-report-esp nil)
  (add-to-list 'flycheck-grammalecte-enabled-modes 'markdown-mode)
  (add-to-list 'flycheck-grammalecte-enabled-modes 'mu4e-compose-mode)
  (flycheck-grammalecte-setup))


(if (system-type-is-bsd) ;; specifique FreeBSD
    (message "\tConfig flychech-grammalecte specific BSD")

    (flycheck-define-checker grammalecte
    "grammalecte"
    :command ("/usr/local/bin/grammalecte-server.py")
    :error-parser flycheck-parse-checkstyle
    :modes (mu4e-compose-mode)
    :standard-input t)  
)

;; spell check end  ;;;;
