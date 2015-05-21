" TODO: make path to phpunit configurable
" TODO: make options to phpunit configurable

" Get the current function the cursor is focussed on and run it through phpunit.
function! PhpunitTestFunction()
    " let lnum = line(".")
    " let col = col(".")

    " TODO: duplicate regex, this can be done better
    let l:phpFuncDef = getline(search('^\s*public\s\+function\s\+\(test[^(]\+\)\s*.*$', 'nbW'))
    let l:phpFunc = system("sed -n '".'s#^\s*public\s\+function\s\+\([^(]\+\).*$#\1#p'."' <<<'".l:phpFuncDef."'")

    silent !clear
    execute '!bin/phpunit -c app --filter '.l:phpFunc
endfunction


" Get the current filename and run it through phpunit.
function! PhpunitTestClass()
    let l:filename=@%

    silent !clear
    execute '!bin/phpunit -c app '.l:filename
endfunction


" Define commands for easy access
command! PhpunitTestFunction call PhpunitTestFunction()
command! PhpunitTestClass call PhpunitTestClass()


" Define keyboard mapping for even easier easy access
map <Leader>t :call PhpunitTestFunction()<CR>
map <Leader>T :call PhpunitTestClass()<CR>
