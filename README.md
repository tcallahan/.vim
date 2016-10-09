# My preferences for vim settings
Really nothing to see here unless you are curious how to turn off search highlight when you are done searching in vim:

If that is the case, add this to your .vimrc:

`nnoremap <CR> :noh<CR><CR>`

When you are 'finished' doing a search, just hit the return key, and all the highlighting will go away until your next search.
