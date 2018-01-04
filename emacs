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
