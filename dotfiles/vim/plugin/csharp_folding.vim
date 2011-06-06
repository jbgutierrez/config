function! CSharpLevel(lnum)
  let current_lnum = a:lnum
  let line = getline(current_lnum)
  let previous_line = getline(a:lnum - 1)

  " Blocks
  if line =~ '\*\/' || line =~ '#endregion'
    let g:comented_block = g:comented_block - 1
    return 's1'
  elseif line =~ '\/\*' || line =~ '#region'
    let g:comented_block = 1 + g:comented_block
    return 'a1'
  elseif g:commented_block > 1
    return '='
  endif

  " Comments
  if line =~ '^\s\+\/\/' || line =~ '^\s\+\['
    if previous_line =~ '^\s\+\/\/' || previous_line  =~ '^\s\+\['
      return '='
    else
      return 'a1'
    endif
  endif

  " Commented line
  let next_line = getline(current_lnum + 1)
  if previous_line =~ '^\s\+\/\/' || previous_line  =~ '^\s\+\['
    if next_line =~ '{ *$'
      return '='
    else
      return 's1'
    endif
  endif

  " Opening bracket
  if next_line =~ '\s\+{ *$' " || line =~ '{ *$'
    return 'a1'
  endif

  " Closing bracket"
  if line =~ '^\s\+} *$'
    return 's1'
  endif

  return '='
endfunction

function! CSharpText()
  " Look through all of the folded text for the function signature.
  let signature = '(comments)'
  let i = v:foldstart
  while signature == '(comments)' && i <= v:foldend
    let line = getline(i)
    if line !~ '^\s\+\/\/' && line  !~ '^\s\+\[' && line !~'^\s*$'
    " if line =~ '\s\+\(protected\|public\|internal\|class\)|\w\+(.*)$'
      let signature = line
    endif
    let i = i + 1
  endwhile

  " Return what the fold should show when folded.
  " return '+-- ' . (v:foldend - v:foldstart) . ' Lines: ' . signature . ' '
  let number = v:foldend - v:foldstart + 1
  return signature . ' ... (' . number . ' lines)'
endfunction

function! CSharp()
  setlocal foldenable
  setlocal foldlevel=1
  setlocal foldmethod=expr
  setlocal foldexpr=CSharpLevel(v:lnum)
  setlocal foldtext=CSharpText()
  setlocal foldnestmax=1
endfunction
