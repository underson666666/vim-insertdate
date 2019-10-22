" https://qiita.com/Sa2Knight/items/6b26d35af571c239da31
" 引数の受取り方 https://qiita.com/shinshin86/items/6e6cbdb77cb59b87d21f
function! InsertDate(...)
    let formatStr = "+%Y/%m/%d"
    if a:0 >= 1
        let allowStrArray = ["-"]
        for i in allowStrArray
            if a:1 == i
                formatStr = "+%Y" . i . "%m" . i . "%d"
                break
            endif
        endfor
        unlet allowStrArray
    endif
    let dateStr = system('date ' . formatStr)
    execute ":normal a" . dateStr . "\b"
    unlet formatStr
    unlet dateStr
endfunction

command! -nargs=? InsDate call InsertDate(<f-args>)
