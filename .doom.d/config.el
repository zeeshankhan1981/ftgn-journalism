(require 'org)
(require 'markdown-mode)

;; Set up project-specific keybindings
(map! :leader
      "p b" #'make "html"  ; Build HTML
      "p s" #'make "serve" ; Serve locally
      "p c" #'make "clean") ; Clean build

;; Configure markdown mode for essays
(add-hook! 'markdown-mode-hook
  (lambda ()
    "Customize markdown mode for FTGN essays."
    (setq-local fill-column 80)
    (visual-line-mode 1)
    (flyspell-mode 1)
    (setq-local markdown-command "pandoc -f markdown -t html5")
    (setq-local markdown-css-paths '("css/style.css"))
    (setq-local markdown-xhtml-header-content
                "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">")))

;; Configure org mode for research notes
(add-hook! 'org-mode-hook
  (lambda ()
    "Customize org mode for research notes."
    (setq-local org-directory "notes")
    (setq-local org-agenda-files (list org-directory))))

;; --- Custom terminal keybindings for non-GUI Emacs ---
;; Open ansi-term with SPC t t
(map! :leader
      :desc "Open ansi-term" "t t" #'ansi-term)
;; Open eshell with SPC t e
(map! :leader
      :desc "Open eshell" "t e" #'eshell)
;; Open shell with SPC t s
(map! :leader
      :desc "Open shell" "t s" #'shell)

;; Set up git integration
(add-hook! 'find-file-hook
  (lambda ()
    (when (derived-mode-p 'markdown-mode 'org-mode)
      (magit-auto-revert-mode 1))))
