;;; packages.el --- xuyizhe-frontend layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Yizhe Xu
;;
;; Author: Yizhe Xu
;; URL: https://github.com/xuyizhe/spacemacs-fontend-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst xuyizhe-frontend-packages
  '(ng2-mode
    pug-mode
    (typescript :location built-in)
    ))

(defun xuyizhe-frontend/init-ng2-mode ()
  (use-package ng2-mode))

(defun xuyizhe-frontend/init-pug-mode ()
  (use-package pug-mode))

(defun xuyizhe-frontend/post-init-typescript-mode ()
  (setq typescript-indent-level 2))

