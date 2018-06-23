" Text indentation functions to be assigned to keyboard shortcuts.
"
" Usage:
" You can assign shortcuts in your `_vimrc` like so:
"   noremap <tab> :call IndentNormal()<cr>
"   noremap <s-tab> :call UnindentNormal()<cr>
"   vnoremap <tab> :<bs><bs><bs><bs><bs>call IndentVisual()<cr>
"   vnoremap <s-tab> :<bs><bs><bs><bs><bs>call UnindentVisual()<cr>

function! s:reselect_last()
    normal gv
endfunction


function! IndentNormal(...)
    try
        let l:indent_depth = a:0 == 0 ? &shiftwidth : a:1
        let l:cursor_pos = getpos('.')
        execute 'substitute/\(^.*$\)/' . repeat(' ', l:indent_depth) . '\1/'
        let l:cursor_pos[2] = l:cursor_pos[2] + l:indent_depth
        call setpos('.', l:cursor_pos)
    catch
        echoerr v:exception
    endtry
endfunction

function! UnindentNormal(...)
    try
        let l:indent_depth = a:0 == 0 ? &shiftwidth : a:1
        let l:cursor_pos = getpos('.')
        execute 'substitute/^ \{0,' . l:indent_depth .  '\}\(.*\)/\1/'
        let l:cursor_pos[2] = l:cursor_pos[2] - l:indent_depth
        call setpos('.', l:cursor_pos)
    catch
        echoerr v:exception
    endtry
endfunction

function! IndentVisual(...)
    try
        let l:indent_depth = a:0 == 0 ? &shiftwidth : a:1
        execute "'<,'>" . 'substitute/\(^.\+$\)/' . repeat(' ', l:indent_depth) . '\1/'
        call s:reselect_last()
        call feedkeys(l:indent_depth . 'l', 'n')
    catch /E486/
        " All selected lines are empty. Seems like the user wants to have them
        " all indented. In this case we do it.
        execute "'<,'>" . 'substitute/\(^$\)/' . repeat(' ', l:indent_depth) . '\1/'
        call s:reselect_last()
        call feedkeys(l:indent_depth . 'l', 'n')
    catch
        echoerr v:exception
    endtry
endfunction


function! UnindentVisual(...)
    try
        let l:indent_depth = a:0 == 0 ? &shiftwidth : a:1
        execute "'<,'>" . 'substitute/^ \{1,' . l:indent_depth .  '\}\(.*\)/\1/'
        call s:reselect_last()
        call feedkeys(l:indent_depth . 'h', 'n')
    catch /E486/
        call s:reselect_last()
    catch
        echoerr v:exception
    endtry
endfunction
