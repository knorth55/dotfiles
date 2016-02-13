function! RosTopicList()
  vnew +enew
  r! rostopic list
endfunction

command! RosTopicList :call RosTopicList()
