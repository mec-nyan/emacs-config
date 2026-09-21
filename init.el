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

  ;; Navigation
  (define-key evil-normal-state-map (kbd "M-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "M-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "M-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "M-l") 'evil-window-right)
  )

(evil-mode)
