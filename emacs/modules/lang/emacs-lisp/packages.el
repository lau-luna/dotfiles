;; -*- no-byte-compile: t; -*-
;;; lang/emacs-lisp/packages.el

(package! elisp-mode :built-in t)

;; Fontification plugins
(package! highlight-quoted :pin "24103478158cd19fbcfb4339a3f1fa1f054f1469")

;; Tools
(package! helpful :pin "4ba24cac9fb14d5fdc32582cd947572040e82b2c")
(package! macrostep :pin "44faf4f7bf71df0c52592d4ca0f1dee0847b50af")
(package! overseer :pin "7fdcf1a6fba6b1569a09c1666b4e51bcde266ed9")
(package! elisp-def :pin "1ad4baccbf3d0d13e7607d332ae6bc60a5dd7360")
(package! elisp-demos :pin "1a108d1c5011f9ced58be2ca98bea1fbd4130a2f")
(when (modulep! :checkers syntax -flymake)
  (package! flycheck-package :pin "a52e4e95f3151898b36739dfdb4a98b368626fc0")
  (package! flycheck-cask :pin "0eeec5197e9d31bfcfc39380b262d65259a87d91"))

;; Libraries
(package! buttercup :pin "bf01a33f8bc2d3664121d3b20f7496e67ce55e6a")
