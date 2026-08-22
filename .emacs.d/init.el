; (require 'package)
; (package-initialize) ; TODO: maybe useless???
; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package gruber-darker-theme
  :ensure t)

(use-package magit
  :ensure t)

; TODO: fix
; (setq inhibit-startup-message t) ; Disable default splash screen
(menu-bar-mode 0) ; Disable File, Edit, Options
(tool-bar-mode 0) ; Disable buttons
(scroll-bar-mode 0) ; Disable scroll-bar

(load-theme 'modus-vivendi)
; (load-theme 'gruber-darker t)

; (set-frame-font "Cozette")
; (set-frame-font "MxPlus IBM VGA 9x16-18")
(set-frame-font "Iosevka-15")
; (set-frame-font "DepartureMono-14")

;; Completion for M-x
; (setq ido-everywhere t)
; (ido-mode 1)
; (fido-mode)
(fido-vertical-mode) ; Vertical fuzzy finding completion

; (setq display-line-numbers-type 'relative) ; Make line numbers relative
(column-number-mode 1) ; Line numbers in the mode bar
(global-display-line-numbers-mode 1) ; Line numbers in the gutter

(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))) ; Fix backup files
; (setq lock-file-name-transforms
;       '((".*" ,(expand-file-name "emacs-locks/" user-emacs-directory) t)))
(setq create-lockfiles nil)

;; Fix config pollution
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

(defun duplicate-and-next-line ()
  (interactive)
  (duplicate-line)
  (next-line))


(setq eldoc-idle-delay 0) ; Make ElDoc instant

;; Whitespace
(setq-default show-trailing-whitespace t)

;; Keybinds
; (global-set-key (kbd "C-,") 'duplicate-and-next-line)
; (global-set-key (kbd "C-x C-v") 'compile)
