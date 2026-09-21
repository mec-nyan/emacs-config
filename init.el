;; emacs configuration ;;

(load-theme 'doom-dracula t)

(desktop-save-mode 1)


;; EVIL!
;; I'll try to share the keybindings between Vim, Neovim, Helix and Emacs whenever makes sense.

(with-eval-after-load 'evil
  ;; Options:
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)
  (setq evil-shift-width 4)
  (setq evil-shift-round t)
  (setq evil-want-C-i-jump t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-C-w-delete t)

  ;; Not sure about these two.  C-u is heavily used in Emacs.
  ;;(setq evil-want-C-u-delete t)
  ;;(setq evil-want-C-u-scroll t)

  (evil-set-leader 'normal "\\" nil)

  (defun back-to-normal-and-write()
    "Exit (evil) insert mode and write to file."
    (interactive)
    (evil-normal-state)
    (save-buffer))

  (defun vim-comment-line()
    "[Un]Comment current line ala 'Vim'."
    (interactive)
    (save-excursion
      (comment-line 1)))

  (defun vim-highlight-on-yank(func beg end type &rest args)
    "Highlight on yank ala 'neovim'."
    (apply func beg end type args)
    (pulse-momentary-highlight-region beg end))

  ;; Keys

  ;; Windows
  (define-key evil-normal-state-map (kbd "M-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "M-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "M-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "M-l") 'evil-window-right)

  (define-key evil-normal-state-map (kbd "M-o") 'delete-other-windows)

  ;; Navigation
  (define-key evil-normal-state-map (kbd "SPC") 'evil-scroll-page-down)
  (define-key evil-normal-state-map (kbd "DEL") 'evil-scroll-page-up)

  (define-key evil-normal-state-map (kbd "g e") 'evil-goto-line)

  ;; Exit/suspend
  (define-key evil-normal-state-map (kbd "M-q") 'evil-quit)
  (define-key evil-normal-state-map (kbd "M-z") 'suspend-emacs)

  ;; Save
  (define-key evil-insert-state-map (kbd "M-w") 'back-to-normal-and-write)
  (define-key evil-normal-state-map (kbd "M-w") 'evil-write)

  ;; Comments
  (define-key evil-normal-state-map (kbd "g c c") 'vim-comment-line)
  (define-key evil-visual-state-map (kbd "g c") 'comment-or-uncomment-region)
  (define-key evil-normal-state-map (kbd "<leader>c") 'vim-comment-line)
)
(evil-mode)


;; Quality-of-life stuff ;;

;; Completion

(require 'company)
(global-company-mode t)
(company-tng-mode)

;; Smart mode line
(sml/setup)

;; Delimiters
(rainbow-delimiters-mode-enable)


;; Personal preference
;;
(menu-bar-mode -1)  ;; Hide the menu bar.
(global-display-line-numbers-mode t)  ;; Always show line numbers.
(setq-default tab-width 4)  ;; Actually, I prefer tabs over spaces, and 8 spaces is the ideal tab with. Anyway ...
