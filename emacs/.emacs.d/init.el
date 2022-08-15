;; -*- lexical-binding: t -*-

(setq inhibit-startup-screen t)

;; lsp-mode recomended settings for performance
(setq gc-cons-threshold 100000000
      read-process-output-max (* 1024 1024))

;; Disable backup and autosave files
(setq auto-save-default nil
      make-backup-files nil)

(setq native-comp-async-report-warnings-errors nil)

;; https://www.reddit.com/r/emacs/comments/qil2qh/symbols_function_definition_is_void/
;; For some weird reason I don't yet understand, declaring this function as nil
;; seems to fix some org-mode issues I'm getting by using org-modern
(defun native-comp-available-p () nil)

;; Set straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default t)

 ;; Disable GUI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(fringe-mode '(nil . nil))

;; ;; Add frame borders and window dividers
;; (modify-all-frames-parameters
;;  '((right-divider-width . 20)
;;    (internal-border-width . 20)))
;; (dolist (face '(window-divider
;;                 window-divider-first-pixel
;;                 window-divider-last-pixel))
;;   (face-spec-reset-face face)
;;   (set-face-foreground face (face-attribute 'default :background)))
;; (set-face-background 'fringe (face-attribute 'default :background))

(setq visible-bell nil
      ring-bell-function #'ignore)

;; Set font
;; "Source Code Pro"
(setq current-font "JetBrains Mono")
(set-face-attribute 'default nil
		    :font current-font
		    :height 94
		    :weight 'bold) ;; bold medium normal light extra-light)

(blink-cursor-mode 0)
(show-paren-mode 1)

(global-display-line-numbers-mode)
(column-number-mode)

;; Disable line numbers for some modes (change to just display line numbers on prog-mode?)
(dolist (mode '(org-mode-hook
		lisp-interaction-mode-hook
		gomoku-mode-hook
		dired-mode-hook
		neotree-mode-hook
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

;; Ensure environment variables inside Emacs look the same as in the user's shell
(use-package exec-path-from-shell
  :straight (:type git :host github :repo "purcell/exec-path-from-shell")
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

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

(use-package all-the-icons)

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

(defun night-owl/ivy-format-function-line (cands)
  "Transform CANDS into a string for minibuffer."
  (let ((str (ivy-format-function-line cands)))
    (font-lock-append-text-property 0 (length str) 'face 'ivy-not-current str)
    str))

(use-package night-owl-theme
  :config
  (setq ivy-format-function #'night-owl/ivy-format-function-line)
  (load-theme 'night-owl t))

;; (use-package lambda-themes
;;   :straight (:type git :host github :repo "lambda-emacs/lambda-themes")
;;   :custom
;;   (lambda-themes-set-italic-comments t)
;;   (lambda-themes-set-italic-keywords t)
;;   ;; (lambda-themes-set-variable-pitch t)
;;   (lambda-themes-set-variable-pitch nil)
;;   :config
;;   (load-theme 'lambda-light t))

;; https://github.com/greduan/emacs-theme-gruvbox/issues/192
;; (use-package gruvbox-theme
;;   :straight (:type git :host github :repo "greduan/emacs-theme-gruvbox")
;;   :config (load-theme 'gruvbox-light-medium t))

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

(use-package neotree
  :config
  (setq neo-theme 'nerd
	neo-smart-open t
	projectile-switch-project-action 'neotree-projectile-action)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "!") 'neotree-hidden-file-toggle)
  (evil-leader/set-key "n" 'neotree-toggle))

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

(use-package lsp-ui
  :after lsp-mode
  :init (setq lsp-ui-doc-position 'at-point)
  :config (evil-define-key 'normal lsp-mode-map "K" 'lsp-ui-doc-show))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-l"
	lsp-headerline-breadcrumb-enable nil)
  :hook ((go-mode . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp lsp-deferred
  :config (evil-define-key 'normal lsp-mode-map "gr" 'lsp-find-references))

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

(use-package org-modern
  :config (global-org-modern-mode))

(use-package org
  :diminish org-indent-mode visual-line-mode
  :after org-modern
  :hook (org-mode . org-hide-block-all)
  :config
  (setq org-auto-align-tags nil
	org-tags-column 0
	org-catch-invisible-edits 'show-and-error
	org-special-ctrl-a/e t
	org-insert-heading-respect-content t
	org-hide-emphasis-markers t
	org-pretty-entities t
	org-ellipsis "…")
  (evil-define-key 'normal org-mode-map "gx" 'org-open-at-point))
