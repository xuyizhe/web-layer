;;; funcs.el --- xuyizhe-web layer functions file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Yizhe Xu
;;
;; Author: Yizhe Xu <barrenbass@gmail.com>
;; URL: https://github.com/xuyizhe/spacemacs-fontend-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun xuyizhe-web/nodejs-repl-set-key-bindings (mode)
  (spacemacs/set-leader-keys-for-major-mode mode
    "xe" 'nodejs-repl-send-last-expression
    "cj" 'nodejs-repl-send-line
    "cr" 'nodejs-repl-send-region
    "cl" 'nodejs-repl-load-file
    "cz" 'nodejs-repl-switch-to-repl))
