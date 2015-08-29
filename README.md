search-star-OTBEdit
===================

search-star-OTBEdit is a macro for [OTBEdit](http://www.hi-ho.ne.jp/a_ogawa/otbedit/).
This macro provides a search method.

Usage
-----

1. current buffer is next

```
 [[plugins]]
|repository = 'ctrlpvim/ctrlp.vim'

 [[plugins]]
 repository = 'Shougo/neocomplete.vim'
```

(Cursor is in |)

2. hit `Ctrl+Space`

3. cursor will jump to next `repository`

```
 [[plugins]]
 repository = 'ctrlpvim/ctrlp.vim'

 [[plugins]]
|repository = 'Shougo/neocomplete.vim'
```

(Cursor is in |)

Installation
------------

1. download `search-star-otbedit.zip` from the [releases page](https://github.com/kusabashira/search-star-otbedit/releases)

2. Unpack the zip file, and put all in your `OTBEdit directory`.

3. Write in `otbedit.scm` in `scmlib directory`.

```scm
(use search-star)
```

(Please create if `otbedit.scm` doesn't exist in `scmlib directory`)

Customize
---------

###Change search star key

Write in `otbedit.scm` in `scmlib directory`.

```scm
(define search-star-key <key>)
```

(`<key>` is the key you desire, like "F6", "Alt+f")

License
-------

MIT License

Author
------

kusabashira <kusabashira227@gmail.com>
