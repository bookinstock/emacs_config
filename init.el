
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default)))
 '(package-selected-packages
   (quote
    (exunit dap-mode lsp-mode eglot counsel ivy flx-ido projectile elixir-mode dracula-theme magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; clean views
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; (setq default-frame-alist '((left . 50) (width . 150) (fullscreen . fullheight)))

;; maximize and minimize text with text-scale-adjust
(set-face-attribute 'default nil :height 150) ;; init font size
;; `list-faces-display` list all faces, using the same text in each.
(set-face-foreground 'font-lock-comment-face "gray")
(set-face-foreground 'font-lock-doc-face "gray")

;; disable auto-save and auto-backup
(setq make-save-default nil)
(setq make-backup-files nil)

;; eval buffer and load file
;;(global-set-key (kbd "C-c b") 'eval-buffer)
;;(global-set-key (kbd "C-c f") 'load-file)

;; line number
;; default 'goto-line command -> kbd "s l"
;;(global-set-key (kbd "C-c l") 'display-line-numbers-mode)

;; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;(setq projectile-enable-caching t)
;;(setq projectile-project-search-path '("~/Workspace/"))

;; flx-ido
;;(require 'flx-ido)
;;(ido-mode 1)
;;(ido-everywhere 1)
;;(setq ido-enable-flex-matching t)

;; ruby-mode
;;(setq ruby-insert-encoding-magic-comment nil)

;; elixir;;
;;(require 'eglot)
;;(add-to-list
;; 'eglot-server-programs
;; '(elixir-mode "~/xxxx.emacs.d/elixir-ls/release/language_server.sh"))

;;(add-hook 'elixir-mode-hook 'eglot-ensure)

(add-hook 'org-mode-hook 'toggle-truncate-lines) 
