;;; Commentary:
;;;init.el --- for initialing the emacs
(require 'package)

;;; code:
;;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))

;;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))


;; melpa
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize) ;; You might already have this line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hide bar
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 删除空行和行尾空格
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 主题
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

 (load-theme 'atom-one-dark t)
;; (load-theme 'flatland t)
;; (load-theme 'spacegray t)
;;(load-theme 'eclipse t)
;; (load-theme 'smyx t)
;; (load-theme 'brin t)
;; (load-theme 'ujelly t)
;; (load-theme 'cyberpunk t)
;; (load-theme 'noctilux-definitions t)
;; (load-theme 'noctilux t)
;; (load-theme 'zenburn t)
;; (load-theme 'spolsky t)
;; (load-theme 'subatomic t)

;; (load-theme 'ample t)
;; (enable-theme 'ample)
;; (load-theme 'monokai t)
;; (load-theme 'molokai t)
;; (setq molokai-theme-kit t)

;;指针颜色
(set-cursor-color "white")

;;鼠标颜色
(set-mouse-color "white")

;; 显示行列号
;; (setq column-number-mode t)
(setq line-number-mode t)
(column-number-mode t)     ;在模式行上显示行号列号
(setq linum-format "  %d ")
;; (setq linum-format "%5d \u2502 ")
;; (custom-set-faces '(linum ((t (:foreground "pink" :background "#363a4a" :box nil)))) )

;; (setq-default left-fringe-width  0)
;; (setq-default right-fringe-width  0)
;; (set-face-attribute 'fringe nil :background "#363a4a")

;; (custom-set-faces '(linum ((t (:foreground "pink")))) )


;; 初始宽高
;; (add-to-list 'default-frame-alist '(height . 36))
(add-to-list 'default-frame-alist '(width . 136))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 显示行号
(global-linum-mode t)

(fset 'yes-or-no-p 'y-or-n-p)      ;Treat 'y' as yes, 'n' as no.

(setq default-directory "~/projects/")  ;寻找文件的默认路径

(setq inhibit-splash-screen t)
;;(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)  ;不生成#file_name#临时文件

;; (global-visual-line-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; fringe mode
(fringe-mode '(8 . 1))
;; (defun hide-fringes ()
;;   (set-window-fringes (selected-window) 1))
;;
;; (add-hook 'neotree-mode-hook 'hide-fringes)

;; font
;; (set-default-font "Monaco-11")
;; (set-default-font "Source Code Pro-10.9")
(set-frame-font "CamingoCode 10")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; company
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
;;(setq company-minimum-prefix-length 2)

(eval-after-load 'company
  '(progn
     (define-key company-active-map [backtab] 'company-select-previous)
     (define-key company-active-map [S-tab] 'company-select-previous)
     (define-key company-active-map [tab] 'company-select-next)))
(setq company-selection-wrap-around t)

;;; UI
(require 'color)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; yasnippet
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; flycheck

(add-hook 'after-init-hook #'global-flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fill-column-indictor
(require 'fill-column-indicator)
(setq fci-rule-width 3)
(setq fci-rule-color "#2a2c3e")
(setq fci-rule-column 80)

;;; (add-hook 'after-change-major-mode-hook 'fci-mode)
;;; (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;;; (global-fci-mode 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multiple-cursors

(require 'multiple-cursors)
(multiple-cursors-mode t)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; neotree
;;; (require 'neotree)
;;; (global-set-key [f8] 'neotree-toggle)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm

(require 'helm)
(require 'helm-config)
; (require 'helm-themes)
;(helm-mode 1)
;(setq enable-recursive-minibuffers t)

(setq helm-buffers-fuzzy-matching t)
(setq helm-imenu-fuzzy-matching t)
(setq helm-completion-in-region-fuzzy-matching t)
(setq helm-quick-update t)
(setq helm-split-window-in-side-p t)
(setq helm-move-to-line-cycle-in-source t)
(setq helm-ff-file-name-history-use-recentf t)

(evil-leader/set-key
  "f" 'helm-find
  "m" 'helm-imenu
  "hf" 'helm-find-files
  "hb" 'helm-buffers-list
)

;(global-set-key (kbd "M-x") 'helm-M-x)
;(global-set-key (kbd "M-x") 'helm-M-x)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)
; (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
; (global-set-key (kbd "C-x C-m") 'helm-imenu)

; (define-key helm-map (kbd "<tab>") nil)
;(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
;(define-key helm-map (kbd "C-z") 'helm-select-action)

;(add-to-list 'helm-completing-read-handlers-alist '(find-file . ido))

;;; helm UI
(setq helm-display-header-line nil) ;; t by default
(set-face-attribute 'helm-source-header nil :height 0.1)
(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 30)
(setq helm-autoresize-min-height 30)
(setq helm-split-window-in-side-p t)

;;; projectile
(projectile-global-mode)
(projectile-mode t)
; (setq projectile-completion-system 'helm)
; (helm-projectile-on)

;; Show projectile lists by most recently active
(setq projectile-sort-order (quote recently-active))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(setq ido-auto-merge-work-directories-length -1)

(add-hook 'ido-setup-hook
  (lambda ()
    (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
    (define-key ido-completion-map (kbd "C-j") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-k") 'ido-prev-match)))
; (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
; (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
;(define-key helm-map (kbd "C-z") 'helm-select-action)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; flx-ido
 (require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;;; disable ido faces to see flx highlights.
;(setq ido-enable-flex-matching t)
; (setq ido-use-faces nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ido-vertical-mode
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)

;;; UI
(setq ido-vertical-show-count t)
(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                    :background nil
                    :foreground "orange")
(set-face-attribute 'ido-vertical-only-match-face nil
                    :background nil
                    :foreground nil)
(set-face-attribute 'ido-vertical-match-face nil
                    :foreground nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smex
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                                        ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smartparens
;; global
;;; (require 'smartparens-config)
;;; (smartparens-global-mode t)

;; highlights matching pairs
;; (show-smartparens-global-mode t)

;;; evil mode
(require 'evil)
(evil-mode 1)

;; remove all keybindings from insert-state keymap, use emacs-state when editing
(setcdr evil-insert-state-map nil)

(define-key global-map (kbd "C-t") 'switch-to-completions)
;; ESC to switch back normal-state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; (define-key evil-motion-state-map "ge" nil)
(define-key evil-motion-state-map (kbd "ge") 'end-of-line)
(define-key evil-normal-state-map (kbd "ge") 'end-of-line)
(define-key evil-normal-state-map (kbd "gb") 'beginning-of-line)

; (global-set-key [escape] 'keyboard-quit)
(global-set-key [escape] 'keyboard-escape-quit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; evil-leader
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

;;; For all
(evil-leader/set-key
  "zsh" 'ansi-term
  ;;; For window
  "wk" 'windmove-up
  "wj" 'windmove-down
  "wl" 'windmove-right
  "wh" 'windmove-left
  "vs" 'split-window-right
  "hs" 'split-window-below
  "wm" 'maximize-window
  "ws" 'maximize-window
  ;; Start with M-
  ",x" 'smex

  ;; Start with C-
  "xc" 'save-buffers-kill-emacs
  "xk" 'kill-buffer
)

;;; ido
(evil-leader/set-key
  "xf" 'ido-find-file
  "xb" 'ido-switch-buffer
  "xxb" 'buffer-menu
)

;;; Magit
(evil-leader/set-key
  "gs" 'magit-status
  "gl" 'magit-log
 )

;;; evil-nerd-commenter

; (evilnc-default-hotkeys)

;; evil-nerd-comment:  Emacs key bindings
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

;; evil-nerd-comment: Vim key bindings
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Ruby
;;; Robe
(require 'robe)

(add-hook 'ruby-mode-hook 'robe-mode)
(global-company-mode t)
(eval-after-load 'company
  '(push 'company-robe company-backends))

;;;
(require 'rinari)
(global-rinari-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; web-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)

(setq-default indent-tabs-mode nil)
(setq web-mode-attr-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;;; load & configure js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; scss-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; scheme
;; geiser
(setq geiser-active-implementations '(guile))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sql-indent
(eval-after-load "sql"
  '(load-library "sql-indent"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; indent guide
;; (require 'indent-guide)
;; (indent-guide-global-mode)
;; (setq indent-guide-recursive t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Coffee Script

;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
;; This gives you a tab of 2 spaces
(custom-set-variables
 '(coffee-tab-width 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)



;; spacygray
(global-hl-line-mode 1)

;; powerline
(require 'powerline)
(require 'powerline-evil)
;; (display-time-mode t)
(require 'powerline-my-theme)
(powerline-my-theme)
; (powerline-default-theme)

(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;;; Longline
; (require 'longlines)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; customise
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;; init.el ends here
