(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; Set colortheme: molokai -> from https://github.com/hbin/molokai-theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/themes/")
(load-theme 'molokai t)
(setq molokai-theme-kit t)

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

(setq default-directory "~/Projects/")  ;寻找文件的默认路径


(setq inhibit-splash-screen t)
;;(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)  ;不生成#file_name#临时文件


;;font
;;(set-default-font "Monaco-11")
(set-default-font "Source Code Pro-10.9")
