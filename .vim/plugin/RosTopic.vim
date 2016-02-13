function! RosTopicList()
  vnew +enew
  return system("rostopic list")
endfunction

function RosTopicInfo(v)
  vnew +enew
  return system("rostopic info" . a:v)
endfunction

command! RosTopicList :call RosTopicList()
command! -nargs=+ RosTopicInfo :call RosTopicInfo(<f-args>) 
