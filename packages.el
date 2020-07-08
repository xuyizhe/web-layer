;;; packages.el --- xuyizhe-web layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Yizhe Xu
;;
;; Author: Yizhe Xu <barrenbass@gmail.com>
;; URL: https://github.com/xuyizhe/web-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst xuyizhe-web-packages
  '(web-mode
    css-mode
    ;; (js2-mode :toggle (configuration-layer/layer-usedp 'javascript))
    ;; js2-refactor
    prettier-js
    typescript-mode
    pug-mode
    elm-mode
    ;; nodejs-repl
    ;; indium
    ))

(defun xuyizhe-web/post-init-web-mode ()
  (progn
    (add-to-list 'auto-mode-alist '("\\.tag\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
    (setq web-mode-markup-indent-offset indent-level)
    (setq web-mode-css-indent-offset indent-level)
    (setq web-mode-code-indent-offset indent-level)
    (setq web-mode-attr-indent-offset indent-level)
    (setq web-mode-enable-current-element-highlight t)
    (setq web-mode-dom-errors-show t)
    (setq web-mode-enable-auto-closing t)
    (setq web-mode-enable-auto-pairing t)
    (setq web-mode-enable-css-colorization t)))

(defun xuyizhe-web/post-init-css-mode ()
  (setq css-indent-offset indent-level))

;; (defun xuyizhe-web/post-init-js2-mode ()
;;   (add-to-list 'tern--key-bindings-modes 'js2-mode))

(defun xuyizhe-web/post-init-typescript-mode ()
  (setq typescript-indent-level indent-level))


(defun xuyizhe-web/post-init-prettier-js ()
  (progn
    (setq prettier-js-show-errors "echo")
    (setq prettier-js-args
          '(;; "--print-width" "80"
            "--trailing-comma" "es5"
            "--single-quote" "true"
            "--arrow-parens" "always"))
    (add-hook 'web-mode-hook 'prettier-js-mode)
    (add-hook 'css-mode-hook 'prettier-js-mode)
    ;; (add-hook 'js2-mode-hook 'prettier-js-mode)
    (add-hook 'json-mode-hook 'prettier-js-mode)
    (add-hook 'typescript-mode-hook 'prettier-js-mode)
    (add-hook 'web-mode-hook 'prettier-js-mode)))

(defun xuyizhe-web/post-init-elm-mode ()
  (setq elm-indent-offset indent-level))

(defun xuyizhe-web/post-init-pug-mode ()
  (setq pug-tab-width indent-level))

;; (defun xuyizhe-web/post-init-nodejs-repl ()
;;   (add-hook 'js2-mode 'nodejs-repl-mode)
;;   (add-hook 'js-mode 'nodejs-repl-mode)
;;   (xuyizhe-web/nodejs-repl-set-key-bindings 'js2-mode)
;;   (xuyizhe-web/nodejs-repl-set-key-bindings 'js-mode))

;; (defun xuyizhe-web/init-indium ()
;;   (use-package indium :defer t))
