(setq debug-on-error t)

(setq
 user-emacs-directory (expand-file-name (concat (getenv "GOPATH") ".emacs.d"))
 tmp-file-directory (format "%s/%s" user-emacs-directory ".tmp/")
 package-user-dir tmp-file-directory)

(add-to-list 'load-path user-emacs-directory)

(require 'package)
(package-initialize)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-refresh-contents)
(when (not (package-installed-p 'req-package))
  (progn
    (package-install 'req-package)))

(require 'ob-tangle)
(org-babel-load-file
 (expand-file-name "init-core.org" user-emacs-directory))
(org-babel-load-file
 (expand-file-name "init-go.org" user-emacs-directory))
(req-package-finish)

