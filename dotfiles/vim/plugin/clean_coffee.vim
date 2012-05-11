noremap <Leader>/ :call CleanCoffee()<cr>

function! CleanCoffee()
  " Save current position
  let cursor_position = getpos(".")

  " start at the last char in the file and wrap for the
  " first search to find match at start of file
  normal G$
  let pattern = " *var [^=]*;"
  let flags = "w"
  while search(pattern, flags) > 0
    let line = substitute(getline('.'), '\(var\|;\)', '', 'g')
    silent! normal dd
    let vars = split(line, '[ ,]', 1)
    " echo vars
    for var in vars
      if search('^ *' . var . ' =') > 0
        silent! normal ^ivar
        silent! normal G$
      endif
    endfor
  endwhile

  silent! %s/\vreturn +(.*[(=])/\1/

  " Restore caret position
  call setpos(".", cursor_position)
endfunction
