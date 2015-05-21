" The path to phpunit is configurable
if !exists("g:phpunit_bin")
    let g:phpunit_bin = 'bin/phpunit'
endif


" The default options for phpunit is configurable
if !exists("g:phpunit_opts")
    let g:phpunit_opts = '-c app'
endif


" Get the current function the cursor is focussed on and run it through phpunit.
function! PhpunitTestFunction()
    " let lnum = line(".")
    " let col = col(".")

    " TODO: duplicate regex, this can be done better
    let l:phpFuncDef = getline(search('^\s*public\s\+function\s\+\(test[^(]\+\)\s*.*$', 'nbW'))
    let l:phpFunc = system("sed -n '".'s#^\s*public\s\+function\s\+\([^(]\+\).*$#\1#p'."' <<<'".l:phpFuncDef."'")

    if empty(l:phpFunc)
        echomsg "Could not find a test function under the cursor"
        return
    endif

    silent !clear
    execute '!'.g:phpunit_bin.' '.g:phpunit_opts.' --filter '.l:phpFunc
endfunction


" Get the current filename and run it through phpunit.
function! PhpunitTestClass()
    let l:filename=@%

    silent !clear
    execute '!'.g:phpunit_bin.' '.g:phpunit_opts.' '.l:filename
endfunction


" Define commands for easy access
command! PhpunitTestFunction call PhpunitTestFunction()
command! PhpunitTestClass call PhpunitTestClass()


" Define keyboard mapping for even easier easy access
map <Leader>t :call PhpunitTestFunction()<CR>
map <Leader>T :call PhpunitTestClass()<CR>
