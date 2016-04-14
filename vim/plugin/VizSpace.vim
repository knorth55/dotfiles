function! VizSpace()
    set list
    set listchars=trail:_
    highlight SpecialKey ctermbg=9
endfunction

command! VizSpace :call VizSpace()
