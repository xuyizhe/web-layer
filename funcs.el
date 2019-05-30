;;; funcs.el --- xuyizhe-frontend layer functions file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Yizhe Xu
;;
;; Author: Yizhe Xu <barrenbass@gmail.com>
;; URL: https://github.com/xuyizhe/spacemacs-fontend-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; (defun xuyizhe/web-html-setup()
;;   "Setup for web-mode html files."
;;   (message "web-mode use html related setup")
;;   (flycheck-add-mode 'html-tidy 'web-mode)
;;   (flycheck-select-checker 'html-tidy)
;;   (add-to-list (make-local-variable 'company-backends)
;;                '(company-web-html company-files company-css company-capf company-dabbrev))
;;   (add-hook 'before-save-hook #'sgml-pretty-print))

;; (defun xuyizhe/web-vue-setup ()
;;   "Setup for js related."
;;   (message "web-mode use vue related setup")
;;   (setup-tide-mode)
;;   (prettier-js-mode)
;;   (flycheck-add-mode 'javascript-eslint 'web-mode)
;;   (flycheck-select-checker 'javascript-eslint)
;;   (xuyizhe/use-eslint-from-node-modules)
;;   (add-to-list (make-local-variable 'company-backends)
;;                '(comany-tide company-web-html company-css company-files)))

;; (defun xuyizhe/use-eslint-from-node-modules ()
;;   "Use local eslint from node_modules before global."
;;   (let* ((root (locate-dominating-file
;;                 (or (buffer-file-name) default-directory)
;;                 "node_modules"))
;;          (eslint (and root
;;                       (expand-file-name "node_modules/eslint/bin/eslint.js"
;;                                         root))))
;;     (when (and eslint (file-executable-p eslint))
;;       (setq-local flycheck-javascript-eslint-executable eslint))))
;; (add-hook 'flycheck-mode-hook #'xuyizhe/use-eslint-from-node-modules)


;; (defun xuyizhe/web-mode-hook-base ()
;;   (setq web-mode-markup-indent-offset indent-level)
;;   (setq web-mode-css-indent-offset indent-level)
;;   (setq web-mode-code-indent-offset indent-level)

;;   (setq web-mode-enable-auto-pairing t)
;;   (setq web-mode-enable-css-colorization t)
;;   (setq web-mode-enable-block-face t)
;;   (setq web-mode-enable-part-face t)
;;   (setq web-mode-enable-comment-interpolation t)
;;   (setq web-mode-enable-heredoc-fontification t)
;;   (setq web-mode-dom-errors-show t)
;;   (setq web-mode-enable-auto-closing t)

;;   ;; (set-face-attribute 'web-mode-html-tag-face nil :foreground "royalblue")
;;   ;; (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "powderblue")
;;   ;; (set-face-attribute 'web-mode-doctype-face nil :foreground "lightskyblue")

;;   (setq web-mode-enable-current-element-highlight t)
;;   (setq web-mode-enable-current-column-highlight t))

(defun xuyizhe-frontend/init-vls-config ()
  (with-eval-after-load 'lsp-clients
    (lsp-register-client
     (make-lsp-client :new-connection (lsp-stdio-connection "~/.vscode/extensions/octref.vetur-0.20.0/server/bin/vls")
                      :major-modes '(web-mode)
                      :ignore-messages '("readFile .*? requested by Vue but content not available")
                      :initialization-options (lambda ()
                                                '(:vetur
                                                  (:completion
                                                   (:autoImport t :useScaffoldSnippets t :tagCasing "kebab")
                                                   :grammar
                                                   (:customBlocks
                                                    (:docs "md" :i18n "json"))
                                                   :validation
                                                   (:template t :style t :script t)
                                                   :format
                                                   (:options
                                                    (:tabSize 2 :useTabs :json-false)
                                                    :defaultFormatter
                                                    (:html "prettyhtml" :css "prettier" :postcss "prettier" :scss "prettier" :less "prettier" :stylus "stylus-supremacy" :js "prettier" :ts "prettier")
                                                    :defaultFormatterOptions
                                                    (:js-beautify-html
                                                     (:wrap_attributes "force-expand-multiline")
                                                     :prettyhtml
                                                     (:printWidth 100 :singleQuote :json-false :wrapAttributes :json-false :sortAttributes :json-false))
                                                    :styleInitialIndent :json-false :scriptInitialIndent :json-false)
                                                   :trace
                                                   (:server "verbose")
                                                   :dev
                                                   (:vlsPath ""))
                                                  ))
                      :initialized-fn 'my-lsp-set-cfg
                      :server-id 'vls))))





