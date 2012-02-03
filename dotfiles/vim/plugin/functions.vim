" Export Fremind mindmap to text{{{
command! FremindToText call FremindToTextFunction()
function! FreemindToTextFunction()
  silent! normal djGddgg
  silent! set ft=xml
  silent! set tw=80
  silent! set ft=
  silent! %s/^\(\s*\).*TEXT="\([^"]*\)".*$/\1- \2/
  silent! v/^\s*-/d
  silent! call Entities()
  silent! normal gggqG
  silent! g/^-/s/- //
  silent! g/^\w/t.|s/./=/g
  silent! %s/^\s{4}//
  silent! %s/^-/o/
  silent! g/^\s*-/normal 0
  silent! g/^\s\{8}\zs-/#/
  silent! normal gg
endfunction

command! Entities :call Entities()
function! Entities()
  silent %s/$$/$/eg
  silent %s/&#160;/ /eg
  silent %s/&#38;/&/eg
  silent %s/&#39;/'/eg
  silent %s/&#60;/</eg
  silent %s/&#62;/>/eg
  silent %s/&#xAB;/'/eg
  silent %s/&#xBA;/º/eg
  silent %s/&#xBB;/'/eg
  silent %s/&#xBF;/¿/eg
  silent %s/&#xE1;/á/eg
  silent %s/&#xE7;/ç/eg
  silent %s/&#xE9;/é/eg
  silent %s/&#xED;/í/eg
  silent %s/&#xF1;/ñ/eg
  silent %s/&#xF3;/ó/eg
  silent %s/&#xFA;/ú/eg
  silent %s/&quot;/"/eg
  silent %s/\&AElig;/Æ/eg
  silent %s/\&Aacute;/Á/eg
  silent %s/\&Acirc;/Â/eg
  silent %s/\&Agrave;/À/eg
  silent %s/\&Aring;/Å/eg
  silent %s/\&Atilde;/Ã/eg
  silent %s/\&Auml;/Ä/eg
  silent %s/\&Ccedil;/Ç/eg
  silent %s/\&ETH;/Ð/eg
  silent %s/\&Eacute;/É/eg
  silent %s/\&Ecirc;/Ê/eg
  silent %s/\&Egrave;/È/eg
  silent %s/\&Euml;/Ë/eg
  silent %s/\&Iacute;/Í/eg
  silent %s/\&Icirc;/Î/eg
  silent %s/\&Igrave;/Ì/eg
  silent %s/\&Iuml;/Ï/eg
  silent %s/\&Ntilde;/Ñ/eg
  silent %s/\&Oacute;/Ó/eg
  silent %s/\&Ocirc;/Ô/eg
  silent %s/\&Ograve;/Ò/eg
  silent %s/\&Oslash;/Ø/eg
  silent %s/\&Otilde;/Õ/eg
  silent %s/\&Ouml;/Ö/eg
  silent %s/\&THORN;/Þ/eg
  silent %s/\&Uacute;/Ú/eg
  silent %s/\&Ucirc;/Û/eg
  silent %s/\&Ugrave;/Ù/eg
  silent %s/\&Uuml;/Ü/eg
  silent %s/\&Yacute;/Ý/eg
  silent %s/\&aacute;/á/eg
  silent %s/\&acirc;/â/eg
  silent %s/\&aelig;/æ/eg
  silent %s/\&agrave;/à/eg
  silent %s/\&aring;/å/eg
  silent %s/\&atilde;/ã/eg
  silent %s/\&auml;/ä/eg
  silent %s/\&ccedil;/ç/eg
  silent %s/\&eacute;/é/eg
  silent %s/\&ecirc;/ê/eg
  silent %s/\&egrave;/è/eg
  silent %s/\&eth;/ð/eg
  silent %s/\&euml;/ë/eg
  silent %s/\&iacute;/í/eg
  silent %s/\&icirc;/î/eg
  silent %s/\&igrave;/ì/eg
  silent %s/\&iuml;/ï/eg
  silent %s/\&ntilde;/ñ/eg
  silent %s/\&oacute;/ó/eg
  silent %s/\&ocirc;/ô/eg
  silent %s/\&ograve;/ò/eg
  silent %s/\&oslash;/ø/eg
  silent %s/\&otilde;/õ/eg
  silent %s/\&ouml;/ö/eg
  silent %s/\&szlig;/ß/eg
  silent %s/\&thorn;/þ/eg
  silent %s/\&uacute;/ú/eg
  silent %s/\&ucirc;/û/eg
  silent %s/\&ugrave;/ù/eg
  silent %s/\&uuml;/ü/eg
  silent %s/\&yacute;/ý/eg
  silent %s/\&yuml;/ÿ/eg
endfunction"}}}

" CleanFile{{{
function! CleanFile()
  let _s=@/
  let l = line(".")
  let c = col(".")
  silent! gg
  silent! %s/\v\s+$//e
  silent! :g/\v^\n{2,}/d
  let @/=_s
  call cursor(l, c)
endfunction"}}}

" Preserve{{{
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

" Remap the tab key to do autocompletion or indentation depending on the"{{{
" context (from http://vim.wikia.com/wiki/Smart_mapping_for_tab_completion)
inoremap <tab> <c-r>=Smart_TabComplete()<CR>
function! Smart_TabComplete()
  let line = getline('.')                         " curline
  let substr = strpart(line, -1, col('.')+1)      " from start to cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction"}}}

" Autoformat cucumber tables (from https://gist.github.com/287147) {{{
inoremap <silent>  <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction"}}}

" Custom Folding{{{
function! MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', ' ', 'g')
	let number = v:foldend - v:foldstart + 1

	let ind = indent(v:foldstart)
	let spaces = ''
	let i = 0
	" while i < ind
	" 	let i = i+2
	" 	let spaces = spaces . ' '
	" endwhile

  return spaces . sub . ' ... (' . number . ' lines)'
endfunction"}}}

function! Buflist()
    redir => bufnames
    silent ls
    redir END
    let list = []
    for i in split(bufnames, "\n")
        let buf = split(i, '"' )
        call add(list, buf[-2])
|   endfor
    return list
endfunction

function! Bdeleteonly()
    let list = filter(Buflist(), 'v:val != bufname("%")')
    for buffer in list
        exec "bdelete ".buffer
    endfor
endfunction

command! BdelOnly :silent call Bdeleteonly()

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

		silent! %s/return \([^\(]*;\)\@!/\1/

  " Restore caret position
  call setpos(".", cursor_position)
endfunction
