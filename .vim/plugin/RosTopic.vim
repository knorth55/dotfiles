function! RosTopicList()
  vnew
  r! rostopic list
endfunction

function RosTopicInfo(topic)
  vnew
  let str = "r!\ rostopic\ info\ " . a:topic
  execute str
endfunction

function RosTopicType(topic)
  vnew
  let str = "r!\ rostopic\ type\ " . a:topic
  execute str
endfunction

command! RosTopicList :call RosTopicList()
command! -nargs=+ RosTopicInfo :call RosTopicInfo(<f-args>) 
command! -nargs=+ RosTopicType :call RosTopicType(<f-args>) 
