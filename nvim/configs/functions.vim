" Optionally reset the cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[6 q"
augroup END

" Use templates https://vimtricks.com/p/automated-file-templates/
autocmd BufNewFile *.tsx             0r ~/dev/dotfiles/skeletons/typescript-react.tsx
autocmd BufNewFile *content/blog*.md 0r ~/dev/dotfiles/skeletons/blog-post.md
autocmd BufNewFile *.sh              0r ~/dev/dotfiles/skeletons/script.sh
autocmd BufNewFile *.html            0r ~/dev/dotfiles/skeletons/page.htmlt

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" REQUIRED FOR LAZYGIT
" Creates a floating window with a most recent buffer to be used
function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    autocmd BufWipeout <buffer> exe 'bwipeout '.s:buf
endfunction

function! ToggleTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow()
        call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
    else
        bwipeout!
    endif
endfunction

function! ToggleLazyDocker()
    call ToggleTerm('lazydocker')
endfunction

function! ExecuteRubocop(path)
    let name = "rubocop -A " . a:path
    call system(name)
endfunction






