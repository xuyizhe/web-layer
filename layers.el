;;; layers.el --- xuyizhe-web layer layers file for Spacemacs.
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
 '((html :variables
         web-fmt-tool 'prettier
         css-enable-lsp t
         less-enable-lsp t
         scss-enable-lsp t
         html-enable-lsp t)
   (javascript :variables
               javascript-import-tool 'import-js
               javascript-backend 'lsp
               javascript-fmt-tool 'prettier
               javascript-repl `nodejs)
   (typescript :variables
               typescript-fmt-on-save t
               typescript-fmt-tool 'prettier
               typescript-linter 'tslint
               typescript-backend 'lsp)
   ;; elm
   react
   (vue :variables
        vue-backend 'lsp
        node-add-modules-path t)
   lsp
   prettier
   ;; (tern :variables tern-disable-port-files nil)
   ;; web-beautify
   ))
