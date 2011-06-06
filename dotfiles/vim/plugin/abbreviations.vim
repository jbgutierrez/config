function! s:AbbrAsk(abbr,expansion)
  let answer = confirm("Use the abbreviation '" . a:abbr . "'?", "&Yes\n&No", 1)
  return answer == 1 ? a:expansion : a:abbr
endfunction
ia <expr> addr <SID>AbbrAsk('addr', "your full address here")
ia <expr> lorem <SID>AbbrAsk('lorem', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
