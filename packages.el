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
  '(web-mode
    mmm-mode
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
    lsp-mode
    lsp-vue
    company
    company-lsp
    company-quickhelp
    ))


(defun xuyizhe-frontend/post-init-prettier-js ()
  (use-package prettier-js
    :defer t
    :config
    (setq prettier-js-show-errors "echo")
    (setq
     prettier-js-args
     '("--print-width" "120"
       "--trailing-comma" "es5"
       "--single-quote" "true"
       "--arrow-parens" "always"))))

(defun xuyizhe-frontend/init-lsp-vue ()
  (use-package lsp-vue))

(defun xuyizhe-frontend/post-init-lsp-mode ()
  (use-package lsp-mode))

(defun xuyizhe-frontend/post-init-company-quickhelp ()
  (use-package company-quickhelp))

(defun xuyizhe-frontend/post-init-company-lsp ()
  (use-package company-lsp
    :config
    (setq company-lsp-enable-snippet t)))

(defun xuyizhe-frontend/post-init-company ()
  (use-package company
    :init
    :config
    (setq company-minimum-prefix-length 1)
    (setq company-dabbrev-downcase nil)
    (setq company-idle-delay .1)
    (setq company-tooltip-align-annotations 't)
    (setq company-show-numbers t)
    (setq global-company-mode t)

    (add-hook 'company-mode-hook 'company-quickhelp-mode)
    (add-to-list 'company-backends 'company-lsp)))

(defun xuyizhe-frontend/init-vue-mode ()
  (use-package vue-mode
    :init
    :config
    (setq mmm-submode-decoration-level 0)
    (add-hook 'vue-mode-hook 'prettier-js-mode)
    (add-hook 'vue-mode-hook #'smartparens-mode)
    (add-hook 'vue-mode-hook 'company-mode)
    (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)))

(defun xuyizhe-frontend/post-init-js2-refactor ()
  (use-package js2-refactor))

(defun xuyizhe-frontend/post-init-web-mode ()
  (use-package web-mode
    :defer t
    :init
    (add-to-list 'auto-mode-alist '("\\.tag\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
    :config
    (setq web-mode-markup-indent-offset indent-level)
    (setq web-mode-css-indent-offset indent-level)
    (setq web-mode-code-indent-offset indent-level)
    (setq web-mode-enable-current-element-highlight t)
    (setq web-mode-dom-errors-show t)
    (setq web-mode-enable-auto-closing t)
    (setq web-mode-enable-auto-pairing t)
    (setq web-mode-enable-css-colorization t)
    (setq company-backends-web-mode '((company-web-html
                                       company-css
                                       company-dabbrev-code
                                       company-keywords
                                       company-etags)
                                      company-files
                                      company-dabbrev))
    (add-hook 'web-mode-hook 'prettier-js-mode)
    ;; (add-hook 'web-mode-hook #'js2-refactor-mode)
    (add-hook 'web-mode-hook 'js-auto-beautify-mode)
    (add-hook 'web-mode-hook #'smartparens-mode)
    (add-hook 'web-mode-hook 'company-mode)
    (add-hook 'web-mode-hook 'lsp-vue-enable)))

(defun xuyizhe-frontend/post-init-css-mode ()
  (progn
    (setq css-indent-offset indent-level)
    ))

(defun xuyizhe-frontend/post-init-js-mode ()
  (use-package js-mode
    :defer t
    :config
    (setq js-indent-level indent-level)
    (add-hook 'js-mode-hook 'prettier-js-mode)))

(defun xuyizhe-frontend/post-init-js2-mode ()
  (use-package js2-mode
    :defer t
    :config
    (setq js2-basic-offset indent-level)
    (add-hook 'js2-mode-hook 'prettier-js-mode)))

(defun xuyizhe-frontend/post-init-js-jsx-mode ()
  (use-package js-jsx-mode
    :defer t
    :config
    (add-hook 'js-jsx-mode-hook 'prettier-js-mode)))

(defun xuyizhe-frontend/post-init-js2-jsx-mode ()
  (use-package js2-jsx-mode
    :defer t
    :config
    (add-hook 'js2-jsx-mode-hook 'prettier-js-mode)))

(defun xuyizhe-frontend/post-init-typescript-mode ()
  (progn
    (setq typescript-indent-level indent-level)
    (add-hook 'typescript-mode-hook 'prettier-js-mode)))

(defun xuyizhe-frontend/post-init-elm-mode ()
  (use-package elm-mode
    :defer t
    :config
    (setq elm-indent-offset indent-level)))

(defun xuyizhe-frontend/post-init-ng2-mode ()
  (use-package ng2-mode))

(defun xuyizhe-frontend/post-init-pug-mode ()
  (use-package pug-mode
    :defer t
    :config
    (setq pug-tab-width indent-level)))
