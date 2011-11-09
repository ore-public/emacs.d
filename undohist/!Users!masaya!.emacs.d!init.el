
((digest . "c1e89d2c026532407b538645bdeace97") (undo-list nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 1617) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 1617) (t 19778 . 19679) nil (1588 . 1590) (t 19778 . 19673) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 1588) nil (#(";" 0 1 (fontified t face font-lock-comment-delimiter-face)) . 1588) nil (#("d t)
  (add-to-list 'dmoccur-exclusion-mask \"\\\\.DS_Store\")
  (add-to-list 'dmoccur-exclusion-mask \"^#.+#$\")
  (require 'moccur-edit nil t)
  (when (and (executable-find \"cmigemo\")
			 (require 'migemo nil t))
	(setq moccur-use-migemo t)))

;;(install-elisp \"http://www.emacswiki.org/emacs/download/grep-edit.el\")
(require 'grep-edit)

;;(install-elisp \"http://cx4a.org/pub/undohist.el\")
(when (require 'undohist nil t)
  (undohist-initialize))

;;(install-elisp \"http://www.dr-qubit.org/undo-tree/undo-tree.el\")
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;;(install-elisp \"http://www.emacswiki.org/cgi-bin/wiki/download/point-undo.el\")
(when (require 'point-undo nil t)
  (define-key global-map [f5] 'point-undo)
  (define-key global-map [f6] 'point-redo))

(require 'wdired)
(define-key dired-mode-map \"r\"
" 0 44 (fontified t) 44 57 (fontified t face font-lock-string-face) 57 98 (fontified t) 98 106 (fontified t face font-lock-string-face) 106 111 (fontified t) 111 118 (fontified t face font-lock-keyword-face) 118 120 (fontified t) 120 131 (fontified t face font-lock-constant-face) 131 142 (fontified t) 142 146 (fontified t face font-lock-keyword-face) 146 169 (fontified t) 169 178 (fontified t face font-lock-string-face) 178 185 (fontified t) 185 192 (fontified t face font-lock-keyword-face) 192 194 (fontified t) 194 200 (fontified t face font-lock-constant-face) 200 240 (fontified t) 240 242 (fontified t face font-lock-comment-delimiter-face) 242 313 (fontified t face font-lock-comment-face) 313 314 (fontified t) 314 321 (fontified t face font-lock-keyword-face) 321 323 (fontified t) 323 332 (fontified t face font-lock-constant-face) 332 335 (fontified t) 335 337 (fontified t face font-lock-comment-delimiter-face) 337 387 (fontified t face font-lock-comment-face) 387 388 (fontified t) 388 392 (fontified t face font-lock-keyword-face) 392 394 (fontified t) 394 401 (fontified t face font-lock-keyword-face) 401 403 (fontified t) 403 411 (fontified t face font-lock-constant-face) 411 445 (fontified t) 445 447 (fontified t face font-lock-comment-delimiter-face) 447 512 (fontified t face font-lock-comment-face) 512 513 (fontified t) 513 517 (fontified t face font-lock-keyword-face) 517 519 (fontified t) 519 526 (fontified t face font-lock-keyword-face) 526 528 (fontified t) 528 537 (fontified t face font-lock-constant-face) 537 573 (fontified t) 573 575 (fontified t face font-lock-comment-delimiter-face) 575 654 (fontified t face font-lock-comment-face) 654 655 (fontified t) 655 659 (fontified t face font-lock-keyword-face) 659 661 (fontified t) 661 668 (fontified t face font-lock-keyword-face) 668 670 (fontified t) 670 680 (fontified t face font-lock-constant-face) 680 777 (fontified t) 777 784 (fontified t face font-lock-keyword-face) 784 786 (fontified t) 786 792 (fontified t face font-lock-constant-face) 792 821 (fontified t) 821 824 (fontified t face font-lock-string-face) 824 825 (fontified t)) . 2653) (t 19777 . 16223)))
