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
    css-mode
    js2-mode
    typescript-mode
    elm-mode
    ng2-mode
    pug-mode
    ;; vue-mode
    ))

(defun xuyizhe-frontend/post-init-web-mode ()
  (progn
    (add-to-list 'auto-mode-alist '("\\.tag\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

    (setq web-mode-markup-indent-offset indent-level
          web-mode-css-indent-offset indent-level
          web-mode-code-indent-offset indent-level)
    ))

(defun xuyizhe-frontend/post-init-css-mode ()
  (progn
    (setq css-indent-offset indent-level)
    ))

(defun xuyizhe-frontend/post-init-js2-mode ()
  (progn
    (setq-default js2-basic-offset indent-level)
    (setq-default js-indent-level indent-level)
    ))

(defun xuyizhe-frontend/post-init-typescript-mode ()
  (progn
    (setq typescript-indent-level indent-level)
    ))

(defun xuyizhe-frontend/post-init-elm-mode ()
  (progn
    (setq elm-indent-offset indent-level)
    ))

(defun xuyizhe-frontend/init-ng2-mode ()
  (use-package ng2-mode))

(defun xuyizhe-frontend/init-pug-mode ()
  (use-package pug-mode
    :init
    (setq-default pug-tab-width indent-level)))

;; (defun xuyizhe-frontend/init-vue-mode ()
;;   (use-package vue-mode))
