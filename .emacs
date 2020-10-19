(setq inhibit-startup-screen t)

;; Disable backup and autosave files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Appearance
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Tabs (need to look more deep into it)
(setq default-tab-width 4)

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable C-u to scroll up
(setq evil-want-C-u-scroll t)

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Highlight current line & disable blinking cursor
(global-hl-line-mode t)
(blink-cursor-mode 0)

;; Build-in line numbers
(global-display-line-numbers-mode)

;; Company (code completion)
;; Use company-mode in all buffers
(add-hook 'after-init-hook 'global-company-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" default))
 '(display-line-numbers-type 'relative)
 '(fancy-splash-image nil)
 '(package-selected-packages
   '(gruvbox-theme company fzf use-package evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 103 :width normal :foundry "ADBO" :family "FuraCode Nerd Font")))))

;; Load theme
(load-theme 'gruvbox t)
(set-background-color "#1d2021")
(set-foreground-color "#ebdbb2")
