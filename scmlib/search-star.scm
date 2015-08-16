(define (load-kusabashira-search-star)
  (define (current-line)
    (editor-get-row-string (editor-get-cur-row)))

  (define (current-line-until-current-col)
    (substring (current-line) 0 (editor-get-cur-col)))

  (define (current-line-from-current-col)
    (let ((line (current-line)))
      (substring line (editor-get-cur-col) (string-length line))))

  (define (last-word str)
    (or (rxmatch-substring (rxmatch #/\w+$/ str)) ""))

  (define (fisrt-word str)
    (or (rxmatch-substring (rxmatch #/^\w+/ str)) ""))

  (define (current-word)
    (string-append
      (last-word (current-line-until-current-col))
      (fisrt-word (current-line-from-current-col))))

  (define (sand-with-boundary str)
    (string-append "\\b" str "\\b"))

  (define (search-selected)
    (editor-search-string
      (sand-with-boundary (editor-get-selected-string))))

  (define (search-current-word)
    (let ((word (current-word)))
      (if (not (string=? word ""))
        (editor-search-string (sand-with-boundary word)))))

  (define (search-star)
    (if (editor-get-selected-area)
      (search-selected)
      (search-current-word)))

  (define search-star-key
    (if (symbol-bound? 'search-star-key)
      search-star-key
      "Ctrl+:"))

  (app-set-key
    search-star-key
    search-star))

(load-kusabashira-search-star)
