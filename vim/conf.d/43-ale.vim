let g:ale_sign_column_always = 1
let g:ale_javascript_eslint_executable = '/home/paul/.npm-global/bin/eslint_d'
let g:ale_javascript_flow_use_global = 1
let g:ale_javascript_flow_executable = '/home/paul/.npm-global/bin/flow'
let g:ale_statusline_format = ['%d errors', '%d warnings', 'no errors']
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'tex': [],
\   'python': ['pylint'],
\}
let g:ale_lint_delay=100

let g:ale_fixers = {
\   'javascript': [
\       'eslint',
\   ],
\}

nnoremap <leader>j :ALENextWrap<CR>
nnoremap <leader>k :ALEPreviousWrap<CR>
nnoremap <leader>l :ALELint<CR>
nnoremap <leader>L :lwindow<CR>
nnoremap <leader>/ :ALEDetail<CR>
