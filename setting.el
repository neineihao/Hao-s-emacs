(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/setting.org"))
(global-set-key (kbd "<f3>") 'open-my-init-file)

(global-set-key (kbd "M-S") 'windmove-up)
(global-set-key (kbd "M-X") 'windmove-down)
(global-set-key (kbd "M-C") 'windmove-right)
(global-set-key (kbd "M-Z") 'windmove-left)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(winner-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(global-hl-line-mode t)
(set-face-attribute 'default nil :height 140)
(setq-default cursor-type 'bar)
(setq make-backup-files nil)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(defalias 'list-buffers 'ibuffer)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key [f1] 'shell)

(use-package try
   :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package hungry-delete
  :ensure t
  :config (require 'hungry-delete))
(global-hungry-delete-mode)

(use-package smartparens
  :ensure t
  :config (require 'smartparens-config))
(smartparens-global-mode t)

(use-package company
  :ensure t
  :config (add-hook 'after-init-hook 'global-company-mode))

(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package counsel
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(setq save=interprogram-paste-before-kill t)

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f2> f") 'counsel-describe-function)
    (global-set-key (kbd "<f2> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f2> l") 'counsel-find-library)
;;    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
;;    (global-set-key (kbd "C-c k") 'counsel-ag)
;;    (global-set-key (kbd "C-x l") 'counsel-locate)
;;    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)))

(use-package monokai-theme
  :ensure t)

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char)
	("M-g f" . avy-goto-line))

(windmove-default-keybindings)
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
    ))

(use-package ox-reveal
  :ensure ox-reveal)
(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)
(use-package htmlize
  :ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))

(use-package undo-tree
  :ensure t
  :init
   (global-undo-tree-mode))

(use-package expand-region
  :ensure t
  :config 
  (global-set-key (kbd "C-=") 'er/expand-region))
(use-package iedit
  :ensure t)

(defun load-if-exists(f)
  "load the elisp file inly if it exists and is readable"
  (if (file-readable-p f)
      (load-file f)))

(use-package web-mode
    :ensure t
    :config
	 (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	 (setq web-mode-engines-alist
	       '(("django"    . "\\.html\\'")))
	 (setq web-mode-ac-sources-alist
	       '(("css" . (ac-source-css-property))
		 ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-quoting t)) ; this fixes the quote problem I mentioned
