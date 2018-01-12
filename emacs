;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Behavior

;; Save sessions

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Look and feel
;; Highlight color
(set-face-attribute 'region nil :background "DodgerBlue1")

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2) 
(defvaralias 'cperl-indent-level 'tab-width)

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
(setq python-indent-offset 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DocView
;; Continuous scroll
(setq-default doc-view-continuous t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Variables set with Customize
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (auctex)))
 '(LaTeX-command "latex")
 '(TeX-error-overview-open-after-TeX-run t)
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Okular")
     (output-html "xdg-open")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
