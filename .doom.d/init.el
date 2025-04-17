;;; ~/.doom.d/init.el --- Doom Emacs configuration -*- lexical-binding: t; -*-
(doom! :completion
       company           ; the ultimate code completion backend
       vertico           ; the search engine of the future

       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       modeline          ; snazzy, Atom-inspired modeline

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       snippets          ; my elves. They type so I don't have to

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree
       term              ; built-in terminal emulator

       :term
       vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax            ; tasing you for every semicolon you forget
       spell             ; tasing you for misspelling mispelling
       grammar           ; tasing grammar mistake every you make

       :tools
       (eval +overlay)   ; run code, run (also, repls)
       lookup            ; navigate your code and its documentation
       lsp               ; M-x vscode
       magit             ; a git porcelain for Emacs
       make              ; run make tasks from Emacs
       direnv            ; per-project env for Emacs

       :lang
       emacs-lisp        ; drown in parentheses
       markdown          ; writing docs for people to ignore
       org               ; organize your plain life in plain text
       python            ; beautiful is better than ugly
       sh                ; she sells (ba|z)sh shells on the C xor
       toml              ; uhh... config files
       yaml              ; JSON, but readable
       json              ; At least it ain't XML
       web               ; the tubes

       :config
       (default +bindings +smartparens))
