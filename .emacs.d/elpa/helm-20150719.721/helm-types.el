;;; helm-types.el --- Helm types classes and methods. -*- lexical-binding: t -*-

;; Copyright (C) 2015  Thierry Volpiatto <thierry.volpiatto@gmail.com>

;; Author: Thierry Volpiatto <thierry.volpiatto@gmail.com>
;; URL: http://github.com/emacs-helm/helm

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


;;; Code:

(require 'cl-lib)
(require 'eieio)


;;  Files
(defclass helm-type-file (helm-source) ()
  "A class to define helm type file.")

(defmethod helm-source-get-action-from-type ((object helm-type-file))
  (slot-value object 'action))

(defun helm-actions-from-type-file ()
  (let ((source (make-instance 'helm-type-file)))
    (helm--setup-source source)
    (helm-source-get-action-from-type source)))

(defcustom helm-type-file-actions
  (helm-make-actions
    "Find file"                             'helm-find-many-files
    "Find file as root"                     'helm-find-file-as-root
    "Find file other window"                'find-file-other-window
    "Find file other frame"                 'find-file-other-frame
    "Open dired in file's directory"        'helm-open-dired
    "Grep File(s) `C-u recurse'"            'helm-find-files-grep
    "Zgrep File(s) `C-u Recurse'"           'helm-ff-zgrep
    "Pdfgrep File(s)"                       'helm-ff-pdfgrep
    "Insert as org link"                    'helm-files-insert-as-org-link
    "Checksum File"                         'helm-ff-checksum
    "Ediff File"                            'helm-find-files-ediff-files
    "Ediff Merge File"                      'helm-find-files-ediff-merge-files
    "Etags `M-., C-u tap, C-u C-u reload tag file'"
    'helm-ff-etags-select
    "View file"                             'view-file
    "Insert file"                           'insert-file
    "Add marked files to file-cache"        'helm-ff-cache-add-file
    "Delete file(s)"                        'helm-delete-marked-files
    "Copy file(s) `M-C, C-u to follow'"     'helm-find-files-copy
    "Rename file(s) `M-R, C-u to follow'"   'helm-find-files-rename
    "Symlink files(s) `M-S, C-u to follow'" 'helm-find-files-symlink
    "Relsymlink file(s) `C-u to follow'"    'helm-find-files-relsymlink
    "Hardlink file(s) `M-H, C-u to follow'" 'helm-find-files-hardlink
    "Open file externally (C-u to choose)"  'helm-open-file-externally
    "Open file with default tool"           'helm-open-file-with-default-tool
    "Find file in hex dump"                 'hexl-find-file)
  "Default actions for type files."
  :group 'helm-files
  :type '(alist :key-type string :value-type function))

(defmethod helm--setup-source :primary ((_source helm-type-file)))

(defmethod helm--setup-source :before ((source helm-type-file))
  (set-slot-value source 'action 'helm-type-file-actions)
  (set-slot-value source 'persistent-help "Show this file")
  (set-slot-value source 'action-transformer '(helm-transform-file-load-el
                                               helm-transform-file-browse-url
                                               helm-transform-file-cache))
  (set-slot-value source 'candidate-transformer '(helm-skip-boring-files
                                                  helm-highlight-files
                                                  helm-w32-pathname-transformer)))

;; Bookmarks
(defclass helm-type-bookmark (helm-source) ()
  "A class to define type bookmarks.")

(defcustom helm-type-bookmark-actions
  (helm-make-actions
   "Jump to bookmark" 'helm-bookmark-jump
   "Jump to BM other window" 'helm-bookmark-jump-other-window
   "Bookmark edit annotation" 'bookmark-edit-annotation
   "Bookmark show annotation" 'bookmark-show-annotation
   "Delete bookmark(s)" 'helm-delete-marked-bookmarks
   "Edit Bookmark" 'helm-bookmark-edit-bookmark
   "Rename bookmark" 'helm-bookmark-rename
   "Relocate bookmark" 'bookmark-relocate)
  "Default actions for type bookmarks."
  :group 'helm-bookmark
  :type '(alist :key-type string
                   :value-type function))

(defmethod helm-source-get-action-from-type ((object helm-type-bookmark))
  (slot-value object 'action))

(defmethod helm--setup-source :primary ((_source helm-type-bookmark)))

(defmethod helm--setup-source :before ((source helm-type-bookmark))
  (set-slot-value source 'action 'helm-type-bookmark-actions)
  (set-slot-value source 'keymap helm-bookmark-map)
  (set-slot-value source 'help-message 'helm-bookmark-help-message))


;; Buffers
(defclass helm-type-buffer (helm-source) ()
  "A class to define type buffer.")

(defcustom helm-type-buffer-actions
  (helm-make-actions
   "Switch to buffer(s)" 'helm-switch-to-buffers
   (lambda () (and (locate-library "popwin")
                   "Switch to buffer in popup window"))
   'popwin:popup-buffer
   "Switch to buffer(s) other window `C-c o'"
   'helm-switch-to-buffers-other-window
   "Switch to buffer other frame `C-c C-o'"
   'switch-to-buffer-other-frame
   (lambda () (and (locate-library "elscreen")
                   "Display buffer in Elscreen"))
   'helm-find-buffer-on-elscreen
   "Query replace regexp `C-M-%'"
   'helm-buffer-query-replace-regexp
   "Query replace `M-%'" 'helm-buffer-query-replace
   "View buffer" 'view-buffer
   "Display buffer" 'display-buffer
   "Grep buffers `M-g s' (C-u grep all buffers)"
   'helm-zgrep-buffers
   "Multi occur buffer(s) `C-s'" 'helm-multi-occur-as-action
   "Revert buffer(s) `M-U'" 'helm-revert-marked-buffers
   "Insert buffer" 'insert-buffer
   "Kill buffer(s) `M-D'" 'helm-kill-marked-buffers
   "Diff with file `C-='" 'diff-buffer-with-file
   "Ediff Marked buffers `C-c ='" 'helm-ediff-marked-buffers
   "Ediff Merge marked buffers `M-='"
   (lambda (candidate)
     (helm-ediff-marked-buffers candidate t)))
  "Default actions for type buffers."
  :group 'helm-buffers
  :type '(alist :key-type string :value-type function))

(defmethod helm-source-get-action-from-type ((object helm-type-buffer))
  (slot-value object 'action))

(defmethod helm--setup-source :primary ((_source helm-type-buffer)))

(defmethod helm--setup-source :before ((source helm-type-buffer))
  (set-slot-value source 'action 'helm-type-buffer-actions)
  (set-slot-value source 'persistent-help "Show this buffer")
  (set-slot-value
   source 'filtered-candidate-transformer
   '(helm-skip-boring-buffers
     helm-buffers-sort-transformer
     helm-highlight-buffers)))

;; Functions
(defclass helm-type-function (helm-source) ()
  "A class to define helm type function.")

(defcustom helm-type-function-actions
  (helm-make-actions
   "Describe command" 'describe-function
   "Add command to kill ring" 'helm-kill-new
   "Go to command's definition" 'find-function
   "Debug on entry" 'debug-on-entry
   "Cancel debug on entry" 'cancel-debug-on-entry
   "Trace function" 'trace-function
   "Trace function (background)" 'trace-function-background
   "Untrace function" 'untrace-function)
    "Default actions for type functions."
  :group 'helm-elisp
  :type '(alist :key-type string :value-type function))

(defmethod helm-source-get-action-from-type ((object helm-type-function))
  (slot-value object 'action))

(defun helm-actions-from-type-function ()
  (let ((source (make-instance 'helm-type-function)))
    (helm--setup-source source)
    (helm-source-get-action-from-type source)))

(defmethod helm--setup-source :primary ((_source helm-type-function)))

(defmethod helm--setup-source :before ((source helm-type-function))
  (set-slot-value source 'action 'helm-type-function-actions)
  (set-slot-value source 'action-transformer
                  'helm-transform-function-call-interactively)
  (set-slot-value source 'candidate-transformer
                  'helm-mark-interactive-functions)
  (set-slot-value source 'coerce 'helm-symbolify))


;; Commands
(defclass helm-type-command (helm-source) ()
  "A class to define helm type command.")

(defun helm-actions-from-type-command ()
  (let ((source (make-instance 'helm-type-command)))
    (helm--setup-source source)
    (helm-source-get-action-from-type source)))

(defcustom helm-type-command-actions
  (append (helm-make-actions
           "Call interactively" 'helm-call-interactively)
          (helm-actions-from-type-function))
  "Default actions for type command."
  :group 'helm-command
  :type '(alist :key-type string :value-type function))

(defmethod helm--setup-source :primary ((_source helm-type-command)))

(defmethod helm--setup-source :before ((source helm-type-command))
  (set-slot-value
   source 'action 'helm-type-command-actions)
  (set-slot-value source 'coerce 'helm-symbolify)
  (set-slot-value source 'persistent-action 'describe-function))

;; Timers
(defclass helm-type-timers (helm-source) ()
  "A class to define helm type timers.")

(defcustom helm-type-timers-actions
  '(("Cancel Timer" . (lambda (_timer)
                        (let ((mkd (helm-marked-candidates)))
                          (cl-loop for timer in mkd
                                   do (cancel-timer timer)))))
    ("Describe Function" . (lambda (tm)
                             (describe-function (timer--function tm))))
    ("Find Function" . (lambda (tm)
                         (find-function (timer--function tm)))))
  "Default actions for type timers."
  :group 'helm-elisp
  :type '(alist :key-type string :value-type function))

(defmethod helm--setup-source :primary ((_source helm-type-timers)))

(defmethod helm--setup-source :before ((source helm-type-timers))
  (set-slot-value source 'action 'helm-type-timers-actions)
  (set-slot-value source 'persistent-action
                  (lambda (tm)
                    (describe-function (timer--function tm))))
  (set-slot-value source 'persistent-help "Describe Function"))

;; Builders.
(defun helm-build-type-file ()
  (helm-make-type 'helm-type-file))

(defun helm-build-type-function ()
  (helm-make-type 'helm-type-function))

(defun helm-build-type-command ()
  (helm-make-type 'helm-type-command))

(provide 'helm-types)

;; Local Variables:
;; byte-compile-warnings: (not cl-functions obsolete)
;; coding: utf-8
;; indent-tabs-mode: nil
;; End:

;;; helm-types.el ends here
