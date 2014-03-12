;; Initialize packages.
 
(require 'package)
 
(dolist (source '(("melpa" . "http://melpa.milkbox.net/packages/")
("marmalade" . "http://marmalade-repo.org/packages/")))
(add-to-list 'package-archives source))
 
(package-initialize)
(unless package-archive-contents
(package-refresh-contents))
 
(defun require-package (p)
(unless (package-installed-p p)
(package-install p))
(require p))
 
(load-theme 'misterioso)
 
;; ------------------------------------------------------------------------------
 
;; Themeing
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'tango-dark t)
(set-face-attribute 'default nil :font "DejaVu Sans Mono-11")
;; Default windows size
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))
 
 
(global-linum-mode t)
(setq-default inhibit-startup-screen t)
(setq-default initial-scratch-message nil)
(show-paren-mode 1)
 
(setq ring-bell-function 'ignore)
 
(setq-default c-basic-offset 4)
 
;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
 


 
;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict")
 
(set-default 'ac-sources
'(ac-source-abbrev
ac-source-dictionary
ac-source-words-in-buffer
ac-source-words-in-same-mode-buffers
ac-source-semantic))
 
(ac-config-default)
 
(dolist (m '(c-mode c++-mode java-mode python-mode html-mode))
(add-to-list 'ac-modes m))
 
(global-auto-complete-mode t)
