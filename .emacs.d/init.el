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
(set-face-attribute 'default nil :font "FuraCode Nerd Font" :height 100)

(load-theme 'tango-dark)

(blink-cursor-mode 0)
(show-paren-mode 1)
;; (setq show-paren-style 'parenthesis)

(global-display-line-numbers-mode)
(column-number-mode)

;; Disable line numbers for some modes (change to just display line numbers on prog-mode?)
(dolist (mode '(org-mode-hook
		dired-mode-hook
		treemacs-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Autopair matching delimiters
(electric-pair-mode t)

;; Set ESC to quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "C-x q") 'kill-buffer-and-window)

(use-package counsel
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :init
  (bind-key "C-x b" 'ivy-switch-buffer)
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package which-key
  :init (which-key-mode)
  :config
  (setq which-key-delay 0.3))

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
  :config (load-theme 'gruvbox t))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-shift-width 2)
  (setq evil-echo-state nil)
  :config (evil-mode 1))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(counsel-projectile projectile treemacs-all-the-icons evil-commentary evil helpful gruvbox-theme counsel ivy-rich which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
