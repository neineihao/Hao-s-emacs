(global-set-key (kbd "C-c c")
       'org-capture)

(setq org-capture-templates
      '(("a" "Appointment" entry (file  "~/Dropbox/org/gcal.org" "Appointments")
	 "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
	("n" "Note" entry (file+headline "~/Dropbox/org/notes.org" "Notes")
	 "* Note %?\n%T")
	("l" "Link" entry (file+headline "~/Dropbox/org/links.org" "Links")
	 "* %? %^L %^g \n%T" :prepend t)
	("t" "To Do Item" entry (file+headline "~/Dropbox/org/i.org" "To Do Items")
	 "* %?\n%T" :prepend t)
	("s" "Screencast" entry (file "~/Dropbox/org/screencastnotes.org")
	 "* %?\n%i\n")))
