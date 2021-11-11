;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Variables set with Customize
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex")
 '(TeX-command-BibTeX "Biber")
 '(TeX-error-overview-open-after-TeX-run t)
 '(package-selected-packages
   (quote
    (slime company-jedi flycheck py-autopep8 elpy auctex)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indentation-face ((t (:inherit fringe :background "sky blue")))))
(put 'narrow-to-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package sources
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Behavior

;; Save sessions
(desktop-save-mode 1)

;; Backups (~ files)
(setq backup-directory-alist `(("." . "~/.emacs_saves")))
(setq backup-by-copying t) ; Might be slow under some circumstances

;; Show matching parentheses
(show-paren-mode 1)

;; Load aliases
(setenv "BASH_ENV" "~/.bash_aliases")

;; Shell prompt read only
(setq comint-prompt-read-only t)

;; Start server
(server-start)

;; Automatically revert buffers
;; this doesnt work quite how I'd like
(global-auto-revert-mode 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Look and feel
;; Highlight color
(set-face-attribute 'region nil :background "DodgerBlue1")

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)
(defvaralias 'cperl-indent-level 'tab-width)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C/C++ Configuration

;; Create GSS style.
(defconst gss-style
  '("bsd"
    (c-basic-offset                 . 2)                         ; Indent size is two spaces
    (c-offsets-alist                . ((substatement-open . 0)   ; Don't indent braces
                                       (innamespace       . 0))) ; Don't indent inside namespaces
    (c-echo-syntactic-information-p . t))                        ; Show syntactic analysis for the current line when indented
  "GSS Programming Style")
(c-add-style "gss" gss-style)

;; Hook for when c++ mode is enabled
(defun gss-c++-mode-hook ()
  (c-set-style "gss"))

(add-hook 'c++-mode-hook 'gss-c++-mode-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python
;; Add stuff to pythonpath
;; TODO: I don't know why the /usr/local/lib/python2.7/dist-packages has to be explicitly added
(setenv "PYTHONPATH"
  (let ((current (getenv "PYTHONPATH"))
        (new "/usr/local/share/gss_python_modules:/usr/local/share/gss_python_modules/gss:/home/sosler/gss_bin/:/usr/local/lib/python2.7/dist-packages"))
    (if current (concat new ":" current) new)))
(elpy-enable)

;; Set up company-jedi stuff
(defun company-jedi-setup ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'company-jedi-setup)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)

;; Indent depth of 4 spaces
(setq python-indent-offset 4)

;; Enable autopep8 on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Common Lisp
(setq inferior-lisp-program "/usr/bin/sbcl")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DocView
;; Continuous scroll
(setq-default doc-view-continuous t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; run shell-command in interactive mode so aliases get sourced
;(setq shell-command-switch "-ic")


