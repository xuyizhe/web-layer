;;; packages.el --- xuyizhe-frontend layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Yizhe Xu
;;
;; Author: Yizhe Xu <barrenbass@gmail.com>
;; URL: https://github.com/xuyizhe/spacemacs-fontend-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst xuyizhe-frontend-packages
  '(
    web-mode
    ;; mmm-mode
    css-mode
    js-mode
    js2-mode
    js-jsx-mode
    js2-jsx-mode
    js2-refactor
    prettier-js
    typescript-mode
    vue-mode
    ng2-mode
    pug-mode
    elm-mode
    company
    company-lsp
    ;; (lsp-vue :toggle (configuration-layer/package-usedp 'lsp-mode))
    lsp-mode
    lsp-vue
    ))

(defun xuyizhe-frontend/init-vue-mode ()
  (use-package vue-mode :defer t))

(defun xuyizhe-frontend/init-lsp-vue ()
  (use-package lsp-vue
    :defer t
    :init
    (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)
    (add-hook 'major-mode-hook #'lsp-vue-enable)
    :config
    (setq vetur.validation.template t)))

(defun xuyizhe-frontend/post-init-lsp-mode ()
  (require 'lsp-clients)
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "~/.vscode/extensions/octref.vetur-0.20.0/server/bin/vls")
                    :major-modes '(web-mode)
                    :server-id 'vls)))

(defun xuyizhe-frontend/post-init-company ()
  (progn
    (setq company-minimum-prefix-length 1)
    (setq company-dabbrev-downcase nil)
    (setq company-idle-delay .1)
    (setq company-tooltip-align-annotations 't)
    (setq company-show-numbers t)
    (setq global-company-mode t)
    (add-hook 'web-mode-hook 'company-mode)))

(defun xuyizhe-frontend/post-init-company-lsp ()
  (setq company-lsp-enable-snippet t))

(defun xuyizhe-frontend/post-init-prettier-js ()

    ;; :hook ((js2-mode . prettier-js-mode)
    ;;        (typescript-mode . prettier-js-mode)
    ;;        (css-mode . prettier-js-mode)
    ;;        (web-mode . prettier-js-mode))


    (setq prettier-js-show-errors "echo")
    (setq prettier-js-args
          '("--print-width" "120"
            "--trailing-comma" "es5"
            "--single-quote" "true"
            "--arrow-parens" "always"))
    (add-hook 'js2-mode-hook 'prettier-js-mode)
    (add-hook 'typescript-mode-hook 'prettier-js-mode)
    (add-hook 'css-mode-hook 'prettier-js-mode)
    (add-hook 'web-mode-hook 'prettier-js-mode))

;; (defun xuyizhe-frontend/init-vue-mode ()
;;   (use-package vue-mode
;;     :init
;;     :config
;;     ;; (setq mmm-submode-decoration-level 0)
;;     (add-hook 'vue-mode-hook 'prettier-js-mode)
;;     (add-hook 'vue-mode-hook #'smartparens-mode)
;;     (add-hook 'vue-mode-hook 'company-mode)
;;     ;; (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)
;;     ))

(defun xuyizhe-frontend/post-init-js2-refactor ()
  (use-package js2-refactor))

(defun xuyizhe-frontend/post-init-web-mode ()
  (progn
    (add-to-list 'auto-mode-alist '("\\.tag\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  (setq web-mode-markup-indent-offset indent-level)
  (setq web-mode-css-indent-offset indent-level)
  (setq web-mode-code-indent-offset indent-level)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-dom-errors-show t)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  ;; (add-hook 'web-mode-hook (xuyizhe/web-mode-hook-base))
  ;; (setq web-mode-content-types-alist '(("vue" . "\\.vue\\'")))
  ;; (use-package company-web :ensure t)
  ;; (add-hook 'web-mode-hook
  ;; (lambda() (cond ((equal web-mode-content-type "html")
  ;; (xuyizhe/web-html-setup))
  ;; ((member web-mode-content-type '("vue"))
  ;; (xuyizhe/web-vue-setup))
  ;; )))

  ;; (setq company-backends-web-mode '((company-web-html
  ;;                                    company-css
  ;;                                    company-dabbrev-code
  ;;                                    company-keywords
  ;;                                    company-etags)
  ;;                                   company-files
  ;;                                   company-dabbrev))
  ;; (add-hook 'web-mode-hook 'prettier-js-mode)
  ;; ;; (add-hook 'web-mode-hook #'js2-refactor-mode)
  ;; (add-hook 'web-mode-hook 'js-auto-beautify-mode)
  ;; (add-hook 'web-mode-hook #'smartparens-mode)
  ;; (add-hook 'web-mode-hook 'company-mode)
  ;; (add-hook 'web-mode-hook #'lsp-vue-enable)
  ))

(defun xuyizhe-frontend/post-init-css-mode ()
  (setq css-indent-offset indent-level))

(defun xuyizhe-frontend/post-init-js-mode ()
  (setq js-indent-level indent-level)
  (add-hook 'js-mode-hook 'prettier-js-mode))

(defun xuyizhe-frontend/post-init-js2-mode ()
  (setq js2-basic-offset indent-level)
  (add-to-list 'tern--key-bindings-modes 'js2-mode)
  (add-hook 'js2-mode-hook 'prettier-js-mode))

(defun xuyizhe-frontend/post-init-js-jsx-mode ()
  (add-hook 'js-jsx-mode-hook 'prettier-js-mode))

(defun xuyizhe-frontend/post-init-js2-jsx-mode ()
  (add-hook 'js2-jsx-mode-hook 'prettier-js-mode))

(defun xuyizhe-frontend/post-init-typescript-mode ()
  (progn
    (setq typescript-indent-level indent-level)
    (add-hook 'typescript-mode-hook 'prettier-js-mode)))

(defun xuyizhe-frontend/post-init-elm-mode ()
  (setq elm-indent-offset indent-level))

(defun xuyizhe-frontend/post-init-ng2-mode ()
  (use-package ng2-mode))

(defun xuyizhe-frontend/post-init-pug-mode ()
  (setq pug-tab-width indent-level))
