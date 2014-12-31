(define (load-wara-search-star)
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

  (define (editor-search-selected)
    (editor-search-string
      (sand-with-boundary (editor-get-selected-string))))

  (define (editor-search-current-word)
    (let ((word (current-word)))
      (if (not (string=? word ""))
        (editor-search-string (sand-with-boundary word)))))

  (define (editor-star-search)
    (if (editor-get-selected-area)
      (editor-search-selected)
      (editor-search-current-word)))

  (define default-search-star-key "Ctrl+:")

  (define search-star-key
    (if (symbol-bound? 'search-star-key)
      search-star-key
      default-search-star-key))

  (app-set-key
    search-star-key
    editor-star-search))

(load-wara-search-star)
