" DeleteUselessWhitespacesAndBlankLines{{{
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction"}}}

" Get fold level for diff mode {{{
" Works with normal, context, unified, rcs, ed, subversion and git diffs. 
" For rcs diffs, folds only files (rcs has no hunks in the common sense) 
" fdl=1 ==> file 
" fld=2 ==> hunk 
" context diffs need special treatment, as hunks are defined 
" via context (after '***************'); checking for '*** ' 
" or ('--- ') only does not work, as the file lines have the 
" same marker. 
" Inspired by Tim Chase. 
function! DiffFoldLevel() 
  let l:line=getline(v:lnum) 

  if l:line =~# '^\(diff\|Index\)'	 " file 
    return '>1' 
  elseif l:line =~# '^\(@@\|\d\)'	 " hunk 
    return '>2' 
  elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$'	" context: file1 
    return '>2' 
  elseif l:line =~# '^--- \d\+,\d\+ ----$'	 " context: file2 
    return '>2' 
  else 
    return '=' 
  endif 
endfunction "}}}

" Fold Baloon{{{
function! FoldSpellBalloon()
  let foldStart = foldclosed(v:beval_lnum )
  let foldEnd = foldclosedend(v:beval_lnum)
  let lines = []
  " Detect if we are in a fold
  if foldStart < 0
    " Detect if we are on a misspelled word
    let lines = spellsuggest( spellbadword(v:beval_text)[ 0 ], 5, 0 )
  else
    " we are in a fold
    let numLines = foldEnd - foldStart + 1
    " if we have too many lines in fold, show only the first 14
    " and the last 14 lines
    if ( numLines > 31 )
      let lines = getline( foldStart, foldStart + 14 )
      let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
      let lines += getline( foldEnd - 14, foldEnd )
    else
      "less than 30 lines, lets show all of them
      let lines = getline( foldStart, foldEnd )
    endif
  endif
  " return result
  return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
endfunction"}}}

" Custom Folding{{{
function! MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  let number = v:foldend - v:foldstart + 1
  return sub . ' ... (' . number . ' lines)'
endfunction"}}}
