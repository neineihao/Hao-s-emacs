;;block the welcome screen
(setq inhibit-startup-message t)

;;set package option
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;;easy to install other packages
(unless (package-installed-p 'use-packages)
  (package-refresh-contents)
  (package-install 'use-package))

;;try package
(use-package try
  :ensure t)

;;which key package to support M-x
(use-package which-key
  :ensure t
  :config (which-key-mode))

;;Org mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;Hungry delete
(use-package hungry-delete
  :ensure t
  :config (require 'hungry-delete))

;;Smart parenthesis
(use-package smartparens
  :ensure t
  :config (require 'smartparens-config))
(smartparens-global-mode t)

;;Ido mode
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer)

;;Monokai-theme
(use-package monokai-theme
  :ensure t)

;; package ace-window
;;(use-package ace-window
;;  :ensure t
;;  :init
;;  (progn
;;    (global-set-key [remap other-window] 'ace-window)
;;    (custom-set-faces
;;     '(aw-leading-char-face
;;       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
;;    ))

;;windows setting
(global-set-key (kbd "M-S") 'windmove-up)
(global-set-key (kbd "M-X") 'windmove-down)
(global-set-key (kbd "M-C") 'windmove-right)
(global-set-key (kbd "M-Z") 'windmove-left)

;;Some emacs setting
(winner-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(global-hl-line-mode t)
(set-face-attribute 'default nil :height 140)
(setq-default cursor-type 'bar)
(setq make-backup-files nil)
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;Setting shortcut for init.el
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

;;Enable recent file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)



;;defualt setting for #install other packages
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ace-window monokai-theme smartparens hungry-delete org-bullets which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
