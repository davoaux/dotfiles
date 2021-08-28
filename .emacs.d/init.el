(setq inhibit-startup-screen t)

;; Disable backup and autosave files
(setq auto-save-default nil)
(setq make-backup-files nil)

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                           ("org" . "https://orgmode.org/elpa/")
                           ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

 ;; Disable GUI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)

(menu-bar-mode -1)
(set-fringe-mode 1) ; sign column size

(setq visible-bell t)

;; Set font
(set-face-attribute 'default nil :font "JetBrains Mono" :height 99)

(blink-cursor-mode 0)
(show-paren-mode 1)
;; (setq show-paren-style 'parenthesis)

(global-display-line-numbers-mode)
(column-number-mode)

;; Disable line numbers for some modes (change to just display line numbers on prog-mode?)
(dolist (mode '(org-mode-hook
		dired-mode-hook
		treemacs-mode-hook
		compilation-mode-hook
		helpful-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Autopair matching delimiters
(electric-pair-mode t)

;; Set ESC to quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "C-x q") 'kill-buffer-and-window)

(use-package ivy
  :init
  (bind-key "C-x b" 'ivy-switch-buffer)
  :config
  (ivy-mode 1))

(use-package counsel
  :after ivy
  :config (counsel-mode))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package which-key
  :init (which-key-mode)
  :config
  (setq which-key-delay 0.5)
  (which-key-setup-side-window-right-bottom))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox-dark-medium t)
  (set-face-background 'line-number "#282828")
  (set-face-background 'line-number-current-line "#282828")
  (set-face-foreground 'line-number-current-line "#a1958b")
  (set-face-attribute 'line-number-current-line nil :font "JetBrains Mono" :weight 'bold))

(use-package minions
  :config (minions-mode 1))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t
	evil-shift-width 2
	evil-echo-state nil
	evil-undo-system 'undo-fu)
  :config (evil-mode 1))

(use-package undo-fu
  :after evil)

(use-package evil-commentary
  :after evil
  :config (evil-commentary-mode))

(use-package treemacs)

(use-package all-the-icons)

(use-package treemacs-all-the-icons
  :after (treemacs all-the-icons)
  :config (treemacs-load-theme "all-the-icons"))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package projectile
  :config (projectile-mode)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)
	      ("C-x p" . projectile-find-file)
	      ("C-x g" . counsel-projectile-rg))
  :init
  (when (file-directory-p "~/workspace")
    (setq projectile-project-search-path '("~/workspace"))))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package company
  :hook (after-init . global-company-mode)
  :bind ("C-SPC" . company-complete))

(use-package go-mode)

(defun dr/org-mode-setup ()
  (org-indent-mode t)
  (visual-line-mode t))

(use-package org
  :hook (org-mode . dr/org-mode-setup)
  :config
  (setq org-ellipsis " ▼"
	org-hide-emphasis-markers t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8b8fd1c936a20b5ca6afe22e081798ffb5e7498021515accadc20aab3517d402" "fd23280005748f3d1e15d2ce612dbe7003d7d551b5debd4287b6eeafd8994413" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" default))
 '(package-selected-packages
   '(timu-spacegrey-theme tommyh-theme sorcery-theme minions company go-mode counsel-projectile projectile treemacs-all-the-icons evil-commentary evil helpful gruvbox-theme counsel ivy-rich which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
