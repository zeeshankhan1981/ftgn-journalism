((nil . ((eval . (progn
                  ;; Set up markdown mode
                  (add-hook 'markdown-mode-hook
                            (lambda ()
                              (setq-local fill-column 80)
                              (visual-line-mode 1)
                              (flyspell-mode 1)))))
              (eval . (progn
                  ;; Set up org mode
                  (add-hook 'org-mode-hook
                            (lambda ()
                              (setq-local fill-column 80)
                              (visual-line-mode 1)
                              (flyspell-mode 1)))))
              (eval . (progn
                  ;; Set up git integration
                  (add-hook 'find-file-hook
                            (lambda ()
                              (when (derived-mode-p 'markdown-mode 'org-mode)
                                (magit-auto-revert-mode 1))))))))
