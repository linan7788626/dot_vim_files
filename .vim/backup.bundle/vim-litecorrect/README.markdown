# vim-litecorrect

> Lightweight auto-correction for Vim

We type `teh` when we meant to type `the`. This plugin is to help us catch
the most common of these typos and correct each upon hitting the space bar
(or non-keyword character.)

Features of this plugin:

* Focused on the most common of typos
* Pure Vimscript using the efficient `iabbrev`
* Included auto-correct entries limited to 300 for fast loading
* Buffer-scoped behavior (won’t touch global settings)

Note that this plugin is not intended to be a replacement for teh spell
checker in Vim. It’s best used with spell-check enabled.

## Requirements

May require a recent version of Vim.

## Installation

Install using Pathogen, Vundle, Neobundle, or your favorite Vim package
manager.

## Configuration

Because you may not want auto-corrections in all file types you edit, you can
configure this plugin per file type. For example, to enable litecorrect support
in `markdown` and `textile` files, place in your `.vimrc`:

  ```vim
  set nocompatible
  filetype plugin on       " may already be in your .vimrc

  augroup litecorrect
    autocmd!
    autocmd FileType markdown,mkd call litecorrect#init()
    autocmd FileType textile call litecorrect#init()
  augroup END
  ```

Alternatively, you can build on the defaults by providing your own
corrections. Note that the corrections are stored as key-value entries
where the value is a list of the common misspellings for the key.

  ```
  let user_dict = {
    \ 'maybe': ['mabye'],
    \ 'medieval': ['medival', 'mediaeval', 'medevil'],
    \ 'then': ['hten'],
    \ }
  augroup litecorrect
    autocmd!
    autocmd FileType markdown call litecorrect#init(user_dict)
    autocmd FileType textile call litecorrect#init(user_dict)
  augroup END
  ```

The corrections you provide will be in addition to the defaults. Where
there’s a conflict, your correction will prevail.

### Correct previous misspelling

To augment _litecorrect_ you may find the following key mapping useful.
It forces the top-ranked correction on the first misspelled word 
before the cursor. 

Add to your `.vimrc` with a key mapping of your choice:

```vim
nnoremap <C-s> [s1z=<c-o>
inoremap <C-s> <c-g>u<Esc>[s1z=`]A<c-g>u
```

It generates a fresh undo point prior to the correction so 
that you can conveniently undo if necessary.

Note that _litecorrect_ does not map any keys.

### Typographic characters

By default, straight quotes will be used in corrections. For example:

```
Im -> I'm
shouldnt -> shouldn't
thats -> that's
```

If you prefer typographic (“curly”) quotes, install an educating quote plugin
like [vim-textobj-quote][qu] that will automatically transform straight quotes
to curly ones in your typing, including your corrections. For example:

```
I'm -> I’m
shouldn't -> shouldn’t
that's -> that’s
```

## Criteria to modify default entries

Note that the number of default entries will be limited to 300 for fast
loading.

Suggestions for improving the defaults are welcome, but good evidence is
needed that a suggested auto-correct entry is more common than the one it
will replace.

## Related projects

For a more comprehensive approach with _many_ more entries, check out:

* [wordlist.vim](https://github.com/vim-scripts/wordlist.vim) - nearly 800 entries
* [vim-autocorrect](https://github.com/panozzaj/vim-autocorrect) - over 12K entries!

A warning that larger entry counts make for slower loading.

Another approach that builds on [tpope/vim-abolish]:

* [vim-correction](https://github.com/jdelkins/vim-correction)

## See also

If you find this plugin useful, you may want to check out these others by
[@reedes][re]:

* [vim-colors-pencil][cp] - color scheme for Vim inspired by IA Writer
* [vim-lexical][lx] - building on Vim’s spell-check and thesaurus/dictionary completion
* [vim-one][vo] - make use of Vim’s _+clientserver_ capabilities
* [vim-pencil][pn] - rethinking Vim as a tool for writers
* [vim-textobj-quote][qu] - extends Vim to support typographic (‘curly’) quotes
* [vim-textobj-sentence][ts] - improving on Vim's native sentence motion command
* [vim-thematic][th] - modify Vim’s appearance to suit your task and environment
* [vim-wheel][wh] - screen-anchored cursor movement for Vim
* [vim-wordy][wo] - uncovering usage problems in writing

[re]: http://github.com/reedes
[cp]: http://github.com/reedes/vim-colors-pencil
[lx]: http://github.com/reedes/vim-lexical
[vo]: http://github.com/reedes/vim-one
[pn]: http://github.com/reedes/vim-pencil
[ts]: http://github.com/reedes/vim-textobj-sentence
[qu]: http://github.com/reedes/vim-textobj-quote
[th]: http://github.com/reedes/vim-thematic
[wh]: http://github.com/reedes/vim-wheel
[wo]: http://github.com/reedes/vim-wordy

## Future development

If you’ve spotted a problem or have an idea on improving this plugin,
please post it to the github project issue page.

