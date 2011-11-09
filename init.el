;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
	  (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; elispとconfディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "elisp" "conf")

(setq-default tab-width 4)
(setq make-backup-files nil)

;; (install-elisp "http://www.emacswiki.org/emacs/download/auto-install.el")
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  ;; 必要ならプロキシの設定をする
  ;; (setq url-proxy-services '(("http" . "localhost:808")))
  (auto-install-compatibility-setup))

;; (install-elisp "http://www.emacswiki.org/emacs/download/redo+.el")
(when (require 'redo+ nil t)
  ;; global-map
  (global-set-key (kbd "C-'") 'redo))

(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "M-k") 'kill-this-buffer)
(define-key global-map (kbd "C-t") 'other-window)

(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-x ?") 'help-command)

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

(setq inhibit-startup-screen t)
(tool-bar-mode 0)
(scroll-bar-mode 0)
;; (menu-bar-mode 0)

(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))
(global-linum-mode)

(when (require 'color-theme nil t)
  (color-theme-initialize)
  (color-theme-dark-laptop))

(set-face-attribute 'default nil
	    :family "VL ゴシック"
	    :height 110)

(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Vl ゴシック"))


(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
(when (require 'evernote-mode nil t)
  (global-set-key "\C-cec" 'evernote-create-note)
  (global-set-key "\C-ceo" 'evernote-open-note)
  (global-set-key "\C-ces" 'evernote-search-notes)
  (global-set-key "\C-ceS" 'evernote-do-saved-search)
  (global-set-key "\C-cew" 'evernote-write-note)
  (global-set-key "\C-cep" 'evernote-post-region)
  (global-set-key "\C-ceb" 'evernote-browser))

;;install http://sourceforge.net/projects/php-mode/
(require 'php-mode)
(add-hook 'php-mode-user-hook
	  '(lambda ()
		 (setq tab-width 4)
		 (setq indent-tabs-mode t))
	  )

;;(install-elisp "http://www.emacswiki.org/emacs/download/color-moccur.el")
;;(install-elisp "http://www.emacswiki.org/emacs/download/moccur-edit.el")
(when (require 'color-moccur nil t)
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  (setq moccur-split-wor  'wdired-change-to-wdired-mode))

(require 'auto-complete-config nil t)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(global-set-key "\M-/" 'ac-start)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;;(install-elisp "http://github.com/imakado/emacs-smartchr/raw/master/smartchr.el")
(when (require 'smartchr nil t)
  (define-key global-map
	(kbd "=") (smartchr '("=" " = " " == " " === "))
;;	(kbd ">") (smartchr '("\>"  " => "))
	))

;;ElScreen
(when (require 'elscreen nil t)
  (if window-system
	  (define-key elscreen-map (kbd "C-z")
		'iconify-or-deiconify-frame)
	(define-key elscreen-map (kbd "C-z")
	  'suspend-emacs)))

;; anything
(when (require 'anything nil t)
  (setq
   anything-idel-delay 0.3
   anything-input-idle-delay 0.2
   anything-candidate-number-limit 100
   anything-quick-update t
   anything-enable-shortcuts 'alphabet)

  (when (require 'anything-config nil t)
	(setq anything-su-or-sudo "sudo"))

  (require 'anything-match-plugin nil t)
  (and (equal current-language-environment "Japanese")
	   (executable-find "cmigemo")
	   (require 'anything-migemo nil t))
  (when (require 'anything-complete nil t)
	;;M-xによる保管をAnythingで行う
	;;(anything-read-string-mode 1)
	(anything-lisp-complete-symbol-set-timer 150))
  (require 'anything-show-completion nil t)

  (when (require 'auto-install nil t)
	(require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
	(descbinds-anything-install))
  
  (require 'anything-grep nil t))

;; Interactively Do Things (highly recommended, but not strictly required)
;; (require 'ido)
;; (ido-mode t)

;; ruby-mode
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)

;; Rsense
(setq rsense-home (expand-file-name "~/.emacs.d/rsense"))
(require 'rsense)
(add-hook 'ruby-mode-hook
		  (lambda ()
			(add-to-list 'ac-sources 'ac-source-rsense-method)
			(add-to-list 'ac-sources 'ac-source-rsense-constant)))

;; Rinari
(require 'rinari)

;; rhtml-mode
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))

;;yasnippet
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elisp/yasnippet/snippets")
(yas/load-directory "~/.emacs.d/elisp/yasnippets-rails/rails-snippets")

;; ;;flymake for ruby
;; (require 'flymake)
;; (defun flymake-ruby-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 					 'flymake-create-temp-inplace))
;; 		 (local-file (file-relative-name
;; 					  temp-file
;; 					  (file-name-directory buffer-file-name))))
;; 	(list "ruby" (list "-c" local-file))))
;; (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
;; (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
;; (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)
;; (add-hook
;;  'ruby-mode-hook
;;  '(lambda ()
;; 	(if (not (null buffer-file-name)) (flymake-mode))
;; 	(define-key ruby-mod-map "\C-cd" 'credmp/flymake-display-err-minibuf)))

;; (defun credmp/flymake-display-err-minibuf ()
;;   (interactive)
;;   (let* ((line-no (flymake-current-line-no))
;; 		 (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-into line-no)))
;; 		 (count (length line-err-info-list))
;; 		 )
;; 	(while (> count 0)
;; 	  (when line-err-info-list
;; 		(let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
;; 			   (full-file (flymake-ler-full-file (nth (1- count) line-err-info-list)))
;; 			   (text (flymake-ler-text (nth (1- count) line-err-info-list)))
;; 			   (line (flymake-ler-line (nth (1- count) line-err-info-list))))
;; 		  (message "[%s]%s" line text)
;; 		  )
;; 		)
;; 	  (setq count (1- count)))))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
	(load
	 (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; Clozure CL is default Common Lisp proc
(setq inferior-lisp-program "/usr/local/bin/ccl")
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))
(setq slime-net-coding-system 'utf-8-unix)

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(when (require 'cl-indent-patches nil t)
  ;; emacs-lispのインデントと混同しないように
  (setq lisp-indent-function
        (lambda (&rest args)
          (apply (if (memq major-mode '(emacs-lisp-mode lisp-interaction-mode))
                     'lisp-indent-function
				   'common-lisp-indent-function)
                 args))))

;; Twitter
(require 'twittering-mode)
(setq twittering-status-format
	  "%C{%Y/%m/%d %H:%M:%S} %s > %T // from %f%L%r%R")
(setq twittering-username "ore_public")

;; emacs-w3m
(require 'w3m-load)