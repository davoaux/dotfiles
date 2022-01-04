(setq inhibit-startup-screen t)

;; lsp-mode recomended settings for performance
(setq gc-cons-threshold 100000000
      read-process-output-max (* 1024 1024))

;; Disable backup and autosave files
(setq auto-save-default nil
      make-backup-files nil)

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
(fringe-mode '(nil . 0))

(setq visible-bell nil
      ring-bell-function #'ignore)

;; Set font
(setq current-font "Source Code Pro")
(set-face-attribute 'default nil
		    :font current-font
		    :height 90
		    :weight 'normal)

(blink-cursor-mode 0)
(show-paren-mode 1)

;; (global-display-line-numbers-mode)
(column-number-mode)

;; Disable line numbers for some modes (change to just display line numbers on prog-mode?)
(dolist (mode '(org-mode-hook
		dired-mode-hook
		treemacs-mode-hook
		compilation-mode-hook
		helpful-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(add-hook 'prog-mode-hook
	  (lambda ()
	    (interactive)
	    (setq show-trailing-whitespace 1)))

;; Autopair matching delimiters
(electric-pair-mode t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; set ESC to quit prompts
(global-set-key (kbd "C-x q") 'kill-buffer-and-window)

(defalias 'yes-or-no-p 'y-or-n-p) ; test this out

(use-package ivy
  :bind ("C-x b" . ivy-switch-buffer)
  :config (ivy-mode 1))

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

;; Recurring themes

;;; (use-package gruvbox-theme
;;   :config
;;   (load-theme 'gruvbox-dark-medium t)
;;   (set-face-background 'line-number "#282828")
;;   (set-face-background 'line-number-current-line "#282828")
;;   (set-face-foreground 'line-number-current-line "#a1958b"))

;; (use-package constant-theme
;;   :config (load-theme 'constant t))

;; (use-package minimal-theme
;;   :config (load-theme 'minimal-light t))

(use-package sketch-themes
  :config (load-theme 'sketch-white t))

;; Unknown theme ‘gruvbox-dark-medium’
;; (custom-theme-set-faces 'gruvbox-dark-medium
;; 			`(line-number (:background "#282828"))
;; 			`(line-number-current-line (:foreground "#a1958b" :background "#282828")))

;; gruvbox.el theme definitions
;; (line-number                               (:foreground gruvbox-dark4 :background gruvbox-dark1))
;; (line-number-current-line                  (:foreground gruvbox-bright_orange :background gruvbox-dark2))

(use-package minions
  :config (minions-mode 1))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t
	evil-shift-width 2
	evil-echo-state nil
	evil-undo-system 'undo-fu)
  :config (evil-mode 1))

(use-package evil-leader
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "q" 'evil-quit
    "i" 'split-window-below
    "o" 'split-window-right
    "n" 'treemacs))

(use-package undo-fu :after evil)

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
  (setq projectile-project-search-path '("~/Workspace"
					 "~/go/src/github.com/parelkobra/")))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package company
  :init
  (setq company-minimum-prefix-length 1
	company-idle-delay 0.0
	company-global-modes '(not eshell-mode
				   org-mode
				   help-mode
				   message-mode))
  :hook (after-init . global-company-mode)
  :bind ("C-SPC" . company-complete))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-l"
	lsp-headerline-breadcrumb-enable nil)
  :hook ((go-mode . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp lsp-deferred)

;; TODO: set this shortcuts
;; "gr"          references     (lsp)
;; "K"           hover          (lsp-ui?)
;; "<C-f>"       code_action    (lsp)
;; "<leader>rn"  rename         (lsp)
;; "<leader>f"   formatting     (go-mode (gofmt)/lsp)

(use-package flymake
  :config (evil-define-key 'normal prog-mode-map
	    "[g" 'flymake-goto-prev-error
	    "]g" 'flymake-goto-next-error))

(use-package go-mode
  :bind
  ("<f5>" . compile)
  ("<f6>" . recompile)
  :hook (go-mode . (lambda ()
		     (setq tab-width 4))))

(defun dr/org-mode-setup ()
  (org-indent-mode t)
  (visual-line-mode t)
  (org-superstar-mode 1))

(use-package org-superstar)

(use-package org
  :after org-superstar
  :hook (org-mode . dr/org-mode-setup)
  :config
  (setq org-ellipsis " ▼"
	org-hide-emphasis-markers t)
  (evil-define-key 'normal org-mode-map "gx" 'org-open-at-point))
