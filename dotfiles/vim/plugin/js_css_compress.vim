command! JsCssCompress call JsCssCompress()
function! JsCssCompress()
  let fileName = expand('<afile>:t')
  if match(fileName, ".min.") == -1
    let extension = expand('<afile>:e')
    let partialName = expand('<afile>:t:r')
    let minFileName = partialName.".min.".extension
    let path = expand('<afile>:p:h')
    if extension == 'less'
      if executable('lessc')
        cal system( 'lessc '.path.'/'.partialName.'.'.extension.' &')
      endif
    else
      let fullPath = expand('<afile>:p')
      " if filewritable(path.'/'.minFileName)
        if extension == 'js' && executable('closure-compiler')
          cal system( 'closure-compiler --js '.fullPath.' > '.path.'/'.minFileName.' &')
        elseif executable('yuicompressor')
          cal system( 'yuicompressor '.fullPath.' > '.path.'/'.minFileName.' &')
        endif
      " endif
    endif
  endif
endfunction

" autocmd FileWritePost,BufWritePost *.js :call JsCssCompress()
" autocmd FileWritePost,BufWritePost *.css :call JsCssCompress()
" autocmd FileWritePost,BufWritePost *.less :call JsCssCompress()
