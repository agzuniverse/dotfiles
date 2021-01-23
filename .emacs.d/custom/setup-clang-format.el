(use-package clang-format
  :init
  (setq clang-format-style-option "llvm")
  (setq clang-format-fallback-style "llvm")) ;; Use llvm as default style when no .clang-format file is found
(provide 'setup-clang-format)
