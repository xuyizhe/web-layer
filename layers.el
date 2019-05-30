;;; layers.el --- xuyizhe-frontend layer layers file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Yizhe Xu
;;
;; Author: Yizhe Xu <barrenbass@gmail.com>
;; URL: https://github.com/xuyizhe/spacemacs-fontend-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Prerequisites

(configuration-layer/declare-layers
 '(
   ;; (html :variables web-fmt-tool 'prettier)
   html
   (javascript :variables
               javascript-import-tool 'import-js
               javascript-backend 'lsp
               javascript-fmt-tool 'prettier)
   typescript
   ;; elm
   ;; (tern :variables tern-disable-port-files nil)

   react
   ;; (vue :variables vue-backend 'lsp)

   web-beautify
   prettier
   lsp
   ))
