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
;; "Source Code Pro"
(setq current-font "JetBrains Mono")
(set-face-attribute 'default nil
		    :font current-font
		    :height 92
		    :weight 'normal)
		    ;; :weight 'extra-light)

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

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-x q") 'kill-buffer-and-window)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package diminish
  :config
  (diminish 'eldoc-mode)
  (diminish 'auto-revert-mode))

(use-package ivy
  :diminish ivy-mode
  :bind ("C-x b" . ivy-switch-buffer)
  :config (ivy-mode 1))

(use-package counsel
  :diminish counsel-mode
  :after ivy
  :config (counsel-mode))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :after (ivy ivy-rich all-the-icons)
  :init (all-the-icons-ivy-rich-mode 1))

(use-package which-key
  :diminish which-key-mode
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

;; (use-package nano-theme
;;   :config (load-theme 'nano-light t)
;;   :custom-face (trailing-whitespace ((t (:background "#ff8a8a")))))

(use-package sketch-themes
  :config (load-theme 'sketch-black t))

;; (use-package sketch-themes
;;   :config (load-theme 'sketch-white t))
;;   :custom-face
;;   (mode-line ((t (:background "#efefef" :foreground "#212121" :box (:line-width 5 :color "#efefef")))))
;;   (mode-line-inactive ((t (:background "#dddddd" :foreground "#efefef" :box (:line-width 5 :color "#dddddd"))))))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t
	evil-shift-width 2
	evil-echo-state nil
	evil-undo-system 'undo-fu
	evil-want-keybinding nil
	evil-want-integration t)
  :config (evil-mode 1))

(use-package evil-leader
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "q" 'evil-quit
    "i" 'split-window-below
    "o" 'split-window-right))

(use-package undo-fu :after evil)

(use-package evil-commentary
  :diminish evil-commentary-mode
  :after evil
  :config (evil-commentary-mode))

(use-package evil-collection
  :diminish evil-collection-unimpaired-mode
  :after evil
  :config (evil-collection-init 'magit))

(use-package magit
  :config (evil-leader/set-key "g" 'magit))

(use-package treemacs
  :config (evil-leader/set-key "n" 'treemacs))

(use-package all-the-icons)

(use-package treemacs-all-the-icons
  :after (treemacs all-the-icons)
  :config (treemacs-load-theme "all-the-icons"))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)
	      ("C-x p" . projectile-find-file)
	      ("C-x g" . counsel-projectile-rg))
  :init
  (setq projectile-project-search-path '("~/Workspace"
					 "~/go/src/github.com/davoaux")))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package company
  :diminish company-mode
  :init
  (setq company-minimum-prefix-length 1
	company-idle-delay 0.0
	company-global-modes '(not eshell-mode
				   org-mode
				   help-mode
				   message-mode))
  :hook (after-init . global-company-mode)
  :bind ("C-SPC" . company-complete))

;; TODO "K" hover lsp-ui
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-l"
	lsp-headerline-breadcrumb-enable nil)
  :hook ((go-mode . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp lsp-deferred
  :config (evil-define-key 'normal lsp-mode-map
	    "gr" 'lsp-find-references))

(use-package flycheck
  :diminish flycheck-mode
  :config (evil-define-key 'normal prog-mode-map
	    "[g" 'flycheck-previous-error
	    "]g" 'flycheck-next-error))

(use-package tide)

(use-package typescript-mode
  :after tide
  :hook ((typescript-mode . tide-setup)
	 (typescript-mode . tide-hl-identifier-mode)))

(use-package web-mode
  :mode ("\\.tsx" . web-mode)
  :hook (web-mode . typescript-mode))

(use-package go-mode
  :bind
  ("<f5>" . compile)
  ("<f6>" . recompile)
  :config (evil-leader/set-key-for-mode 'go-mode "f" 'gofmt))

(defun my/org-mode-setup ()
  (org-indent-mode t)
  (visual-line-mode t)
  (org-superstar-mode 1))

(use-package org-superstar)

(use-package org
  :diminish org-indent-mode visual-line-mode
  :after org-superstar
  :hook (org-mode . my/org-mode-setup)
  :config
  (setq org-ellipsis " ▼"
	org-hide-emphasis-markers t)
  (evil-define-key 'normal org-mode-map "gx" 'org-open-at-point))
