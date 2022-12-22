;; euslime

;; ;; apt
; (add-to-list 'load-path "/opt/ros/melodic/share/euslime")

;; source
(add-to-list 'load-path "~/ros/guiga_ws/src/euslime")
(setq euslime-compile-path "~/.euslime_source")

(require 'euslime-config)
(setq inferior-euslisp-program "roseus")
(slime-setup '(slime-fancy slime-banner slime-repl-ansi-color))
