;;; -*- lexical-binding: t; -*-

;; (require 'package)
;; (package-initialize) ; TODO: maybe useless???
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package magit :ensure t)

(use-package company :ensure t)
(use-package corfu :ensure t)

(use-package yasnippet
  :ensure t
  :config (use-package yasnippet-snippets :ensure t))

;; Org
;; (use-package org
;;   :config
;;   (use-package htmlize :ensure t)
;;   (org-babel-do-load-languages
;;    'org-babel-load-languages
;;    '((python . t)
;;      (C . t))))

(use-package markdown-mode :ensure t)

(setq use-short-answers t) ; yes-or-no to y-or-n

(which-key-mode)

;; TODO: fix
; (setq inhibit-startup-message t) ; Disable default splash screen
(menu-bar-mode 0) ; Disable File, Edit, Options
(tool-bar-mode 0) ; Disable buttons
(scroll-bar-mode 0) ; Disable scroll-bar

(setq ring-bell-function 'ignore)

(load-theme 'modus-vivendi-deuteranopia t)

;; (set-frame-font "Cozette-15")
;; (set-frame-font "MxPlus IBM VGA 9x16-18")
(set-frame-font "Iosevka-15")
;; (set-frame-font "Aporetic Sans Mono-15")
;; (set-frame-font "Aporetic Serif Mono-15")
;; (set-frame-font "Ioskeley Mono-15")
;; (set-frame-font "DepartureMono-15")

;; Completion for M-x
; (ido-mode 1)
; (ido-everywhere 1)
; (fido-mode)
(fido-vertical-mode) ; Vertical fuzzy finding completion
;; (vertico-mode)

; (setq display-line-numbers-type 'relative) ; Make line numbers relative
(column-number-mode 1) ; Line numbers in the mode bar
(global-display-line-numbers-mode 1) ; Line numbers in the gutter
(fringe-mode 0)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))) ; Fix backup files
; (setq lock-file-name-transforms
;       '((".*" ,(expand-file-name "emacs-locks/" user-emacs-directory) t)))
(setq create-lockfiles nil)

;; Fix config pollution
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

(defun my-duplicate-and-next-line ()
  (interactive)
  (duplicate-line)
  (forward-line))

;; (setq eldoc-idle-delay 0) ; Make ElDoc instant

;; Whitespace
(setq-default show-trailing-whitespace t)
(setq-default comment-column 0)

(electric-pair-mode) ; Auto close delimeters

;; C
(setq gdb-many-windows t) ; auto-arrange source/asm/locals/stack/breakpoints
(setq gdb-show-main t) ; jump to main() on start

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq comment-start "// "
                  comment-end "")))

;; Nix
(use-package nix-mode :ensure t)

;; Search
(defun my-search-grep (name)
  (interactive "sGrep: ")
  (compile (concat "grep -rn " name)))

(defun my-search-file (name)
  (interactive "sFile: ")
  (compile (concat "find | grep " name)))

(defun my-fold-whitespace ()
  (interactive)
  (move-end-of-line 1)
  (delete-char 1)
  (delete-horizontal-space)
  (insert " "))

;; Keybinds
;; (global-set-key (kbd "C-,") 'my-duplicate-and-next-line)
(global-set-key (kbd "C-c C-f") 'my-fold-whitespace)
(global-set-key (kbd "C-c r") 'compile)
(global-set-key (kbd "C-c C-r") 'recompile)
;; (global-set-key (kbd "C-v") 'my-scroll-up-recenter)
;; (global-set-key (kbd "M-v") 'my-scroll-down-recenter)
(global-set-key (kbd "M-n") 'minibuffer-next-completion)
(global-set-key (kbd "M-p") 'minibuffer-previous-completion)
