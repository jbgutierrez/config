command! JsCssCompress call JsCssCompress()
function! JsCssCompress()
  let fileName = expand('<afile>:t')

  if fileName =~ '.min.' || fileName !~ '\d\.\d\.\d'
    return
  end

  let fullPath = expand('<afile>:p')
  let extension = expand('<afile>:e')

  if extension == 'coffee'
    let expr = 'coffee -c '.expand('<afile>')
    cal system(expr)
    let extension = 'js'
  endif

  let partialName = expand('<afile>:t:r')
  let minFileName = partialName.".min.".extension
  let path = expand('<afile>:p:h')

  if extension == 'less'
    if executable('lessc')
      cal system( 'lessc '.path.'/'.partialName.'.'.extension.' &')
    endif
  else
    if extension == 'scss'
      let expr = 'scss '.shellescape(fullPath).' --compass --style=expanded '.path.'/'.partialName.'.css -C'
      cal system(expr)
      let extension = 'css'
    endif

    " if filewritable(path.'/'.minFileName)
    "   if extension == 'js' && executable('closure-compiler')
    "     cal system( 'closure-compiler --js '.fullPath.' > '.path.'/'.minFileName.' &')
    "   elseif executable('yuicompressor')
    "     cal system( 'yuicompressor '.fullPath.' > '.path.'/'.minFileName.' &')
    "   endif
    " endif

    let minFileName = partialName.".min.".extension
    let expr = 'java -jar ~/bin/vendor/yuicompressor-2.4.7/build/yuicompressor-2.4.7.jar '.path.'/'.partialName.'.'.extension.' > '.shellescape(path.'/'.minFileName).' &'
    cal system(expr)
    " let data = system(expr)
    " let lines = [data]
    " call writefile(lines, path.'/'.minFileName)
  endif
endfunction

autocmd FileWritePost,BufWritePost *.coffee :call JsCssCompress()
autocmd FileWritePost,BufWritePost *.js :call JsCssCompress()
autocmd FileWritePost,BufWritePost *.css :call JsCssCompress()
autocmd FileWritePost,BufWritePost *.scss :call JsCssCompress()
" autocmd FileWritePost,BufWritePost *.less :call JsCssCompress()
