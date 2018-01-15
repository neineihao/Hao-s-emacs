(global-set-key (kbd "C-c c")
       'org-capture)

(setq org-capture-templates
      '( ("t" "To Do Item" entry (file+headline "~/Dropbox/org/Todo.org" "To Do Items")
	  "* TODO %?\nDEADLINE:%^T \n\n" :prepend t)

	 ("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Notes")
	  "* Note: %?\n%T\n\n" :prepend t)

	 ("a" "Appointment" entry (file  "~/Dropbox/org/gcal.org")
	  "* Appointment: %?\n  %^T\n\n")

	 ("i" "Idea" entry (file+headline "~/Dropbox/org/notes.org" "Ideas")
	  "* Idea: %?\n  :PROPERTIES:\n\n  :END:\n" :prepend t)

	 ("k" "Knowledge" entry (file+headline "~/Dropbox/org/notes.org" "Knowledges")
	  "* Knowledge: %?\n  :PROPERTIES:\n\n  :END:\n" :prepend t)

	  ("l" "Learn Course" entry (file+headline "~/Dropbox/org/notes.org" "Course")
	  "* Course : %?\n  :PROPERTIES:\n\n  :END:\n" :prepend t)


	  ))

(setq org-agenda-files (list "~/Dropbox/org/Todo.org" "~/Dropbox/org/gcal.org" "~/Dropbox/org/notes.org"))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(add-hook 'org-mode-hook 'org-bullets-mode)

(setq org-agenda-custom-commands
      '(("h" "Daily habits"
	 ((agenda ""))
	 ((org-agenda-show-log t)
	  (org-agenda-ndays 7)
	  (org-agenda-log-mode-items '(state))
	  (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":DAILY:"))))

	("c" "Simple agenda view"
	 ((agenda "")
	  (alltodo "")))
	))

(global-set-key (kbd "\e\et")
		(lambda () (interactive) (find-file "~/Dropbox/org/Todo.org")))

(global-set-key (kbd "\e\ea")
		(lambda () (interactive) (find-file "~/Dropbox/org/gcal.org")))

(global-set-key (kbd "\e\en")
		(lambda () (interactive) (find-file "~/Dropbox/org/notes.org")))

(global-set-key (kbd "\e\ec")
		(lambda () (interactive) (find-file "~/.emacs.d/capture.org")))
