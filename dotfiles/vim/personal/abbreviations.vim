function! s:AbbrAsk(abbr,expansion)
  let answer = confirm("Use the abbreviation '" . a:abbr . "'?", "&Yes\n&No", 1)
  return answer == 1 ? a:expansion : a:abbr
endfunction
iabbrev <expr> addr <SID>AbbrAsk('addr', "your full address here")
