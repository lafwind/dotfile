;;Author : Lafwind

;;Emacs Lisp Package Archive
;;(add-to-list 'package-archives
;;'("melpa" . "http://melpa.milkbox.net/packages/") t)


;;指针颜色
(set-cursor-color "white")

;;鼠标颜色
(set-mouse-color "white")

;;显示行列号
;;(setq column-number-mode t)
(setq line-number-mode t)
(column-number-mode t)     ;在模式行上显示行号列号

;;显示行号
(global-linum-mode t)

(fset 'yes-or-no-p 'y-or-n-p)      ;Treat 'y' as yes, 'n' as no.

(set-background-color "black")
(set-foreground-color "white")
(setq default-directory "~/Source_Codes/")  ;寻找文件的默认路径
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
;;(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)  ;不生成#file_name#临时文件

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("f7b936d6e9eed9d631a4cb2bc356bc8b26da5b69359a5afe9f321fd6daea8539" default)))
 '(show-paren-mode t))

;;font
;;(set-default-font "Monaco-11")
(set-default-font "Source Code Pro-10.9")



;;window width height
;;(setq default-frame-alist
;; '((height . 36) (width . 80) (menu-bar-lines . 20) (tool-bar-lines . 0))) 

;;不要滚动栏，现在都用滚轴鼠标了，可以不用滚动栏了
(set-scroll-bar-mode nil)

;;colortheme
;;
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-lafwind-pink)
;;(color-theme-lafwind-red)
;;(load-theme 'lafwind-pink t)
(color-theme-molokai)
;;(load-theme 'tangotango t)
;;(color-theme-lafwind-default)
;;(load "~/.emacs.d/themes/color-theme-molokai.el")
;;(color-theme-molokai)
;;


;;Marmalade
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
;;CC-Mode
;;
(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

;;;;我的C/C++语言编辑策略
 
(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode t)
  ;;; hungry-delete and auto-newline
;;  (c-toggle-auto-hungry-state 1)
  ;;按键定义
  (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f7)] 'compile)
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)

;;预处理设置
(setq c-macro-shrink-window-flag t)
(setq c-macro-preprocessor "cpp")
(setq c-macro-cppflags " ")
(setq c-macro-prompt-flag t)
(setq hs-minor-mode t)
(setq abbrev-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
 
;;;;我的C++语言编辑策略
(defun my-c++-mode-hook()
(setq tab-width 4 indent-tabs-mode t)
(c-set-style "stroustrup")
;;  (define-key c++-mode-map [f3] 'replace-regexp)
)


;;yasnippet
;;
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;Douban-music-mode
(autoload 'douban-music "douban-music-mode" nil t)

;;Markdown Mode
(add-to-list 'load-path' "~/.emacs.d/modes")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Transparent
;;(set-frame-parameter (selected-frame) 'alpha '(85 50))
;;(add-to-list 'default-frame-alist '(alpha 96 96))

;;window width height
(setq default-frame-alist
 '((height . 36) (width . 80))) 

;; Slime
(add-to-list 'load-path' "~/.emacs.d/modes/slime")
(setq inferior-lisp-program "/usr/local/sbcl/bin/sbcl")
(require 'slime)
(slime-setup)

;;Lisp
(defun lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
      (call-interactively 'slime-indent-and-complete-symbol)))
(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))





;;Default by Emacs

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
