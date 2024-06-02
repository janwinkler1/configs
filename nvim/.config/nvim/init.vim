"" Set up data directory for vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

" Automatically download and install vim-plug if not present
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start defining plugins
call plug#begin('~/.vim/plugged')

" General Purpose Plugins
"Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }

" Git-related Plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog' 

" Programming language formatting and linting
" Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" Plug 'jalvesaq/Nvim-R'
" Plug 'psf/black', {'branch': 'main'}
" Plug 'davidhalter/jedi-vim'
" Plug 'vim-python/python-syntax'

" tpope general vim enhancements
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

" markdown plugins
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

"  nvim lsp specific
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For vim-slime (send code to live REPL)
Plug 'jpalardy/vim-slime'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" python debugger (nvim-dap)
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'


" SQL Autocompletion and Linting
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'tpope/vim-dadbod'  " For database interaction
" Plug 'sqlfluff/sqlfluff', { 'branch': 'main', 'do': ':UpdateRemotePlugins' }  " For SQL linting
" Finish defining plugins
call plug#end()

" General configurations
syntax on
set number
set relativenumber
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
let $PATH = '/home/jwi/anaconda3/bin:' . $PATH
set hlsearch
set ignorecase
set incsearch
set noswapfile 

" fzf configurations
set path+=**
set wildmenu
set wildmode=list:longest

" Prettier configurations
" let g:prettier#autoformat = 1

" Airline configurations
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline#extensions#branch#enabled = 1

" Jedi configurations
" let g:jedi#auto_vim_configuration = 1
" let g:rainbow_active=1
" let g:python_highlight_all = 1

" color theme configuration
colorscheme moonfly

" markdown-preview config
" set to 1, nvim will open the preview window after entering the Markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when changing
" from Markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, Vim will refresh Markdown when saving the buffer or
" when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be used for all files,
" by default it can be use in Markdown files only
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, the preview server is available to others in your network.
" By default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page.
" Useful when you work in remote Vim and preview on local browser.
" For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = '/snap/bin/chromium'

" set to 1, echo preview page URL in command line when opening preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom Vim function name to open preview page
" this function will receive URL as param
" default is empty
let g:mkdp_browserfunc = ''

" options for Markdown rendering
" mkit: markdown-it options for rendering
" katex: KaTeX options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: whether to disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: means the cursor position is always at the middle of the preview page
"   top: means the Vim top viewport always shows up at the top of the preview page
"   relative: means the cursor position is always at relative positon of the preview page
" hide_yaml_meta: whether to hide YAML metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom Markdown style. Must be an absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style. Must be an absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" use a custom location for images
"let g:mkdp_images_path = /home/user/.markdown_images

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is defined according to the preferences of the system
let g:mkdp_theme = 'dark'

" combine preview window
" default: 0
" if enable it will reuse previous opened preview window when you preview markdown file.
" ensure to set let g:mkdp_auto_close = 0 if you have enable this option
let g:mkdp_combine_preview = 0

" auto refetch combine preview contents when change markdown buffer
" only when g:mkdp_combine_preview is 1
let g:mkdp_combine_preview_auto_refresh = 1

" " sqlfluff config
" let g:sqlfluff_dialect = "postgres"
" let g:sqlfluff_config = '~/.config/sqlfluff/.sqlfluff'

let g:slime_target = 'tmux'

" Custom key mappings
" set map leader to ö (swiss key board)
let mapleader = "ö"
" Toggle nerd tree
nnoremap <C-n> :NERDTreeToggle<CR>
" Toggle prettier in async mode
nnoremap <C-p> :PrettierAsync<CR> 

" nmap < [
" nmap > ]
" omap < [
" omap > ]
" xmap < [
" xmap > ]
inoremap jk <ESC> 
" set leader a (like ctrl a) to select all the code
nnoremap <Leader>a ggVG

"set leader+l to send current line 
nnoremap <Leader>l :SlimeSendCurrentLine<CR>

"set leader+s to send region (same as Ctrl+c Ctrl+c
xmap <C-s> <Plug>SlimeRegionSend


" lua << EOF
" require'lspconfig'.pylsp.setup{
"   on_attach = custom_attach,
"   settings = {
"     pylsp = {
"       plugins = {
"         black = { enabled = true },
"         autopep8 = { enabled = false },
"         yapf = { enabled = false },
"         pylint = { enabled = true, executable = "pylint" },
"         pyflakes = { enabled = false },
"         pycodestyle = { enabled = false },
"         pylsp_mypy = { enabled = true },
"         jedi_completion = { fuzzy = true },
"         pyls_isort = { enabled = true },
"       },
"     },
"   },
"   flags = {
"     debounce_text_changes = 200,
"   },
"   capabilities = capabilities,
" }
" EOF

" lua << EOF
" -- Set up DAP for Python
" require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

" -- Optional: Custom test runner configuration
" require('dap-python').test_runner = 'pytest' -- Change 'pytest' to your test runner of choice

" -- Key mappings for DAP
" vim.api.nvim_set_keymap('n', '<leader>dn', ":lua require('dap-python').test_method()<CR>", {silent = true})
" vim.api.nvim_set_keymap('n', '<leader>df', ":lua require('dap-python').test_class()<CR>", {silent = true})
" vim.api.nvim_set_keymap('v', '<leader>ds', "<ESC>:lua require('dap-python').debug_selection()<CR>", {silent = true})

" -- Additional DAP configurations if needed
" -- This is where you can add custom DAP configurations
" require('dap').configurations.python = {
"   {
"     type = 'python',
"     request = 'launch',
"     name = 'Python Docker',
"     program = '${file}',
"     pythonPath = function()
"         return 'usr/local/bin/python'
"     end, 
"     pathMappings = {
"         {
"                 localRoot = "${working/}", 
"                 remoteRoot = "/detec"

"             }


"         },
"     -- Add other configuration settings as needed
"   }
" }
" EOF


lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"lua", "python", "r", "yaml", "markdown", "sql", "javascript", "typescript", "starlark", "rust"}, -- Only install Python parser
  highlight = {
    enable = true,              -- Enable Tree-sitter based highlighting
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true               -- Enable Tree-sitter based indentation
  }
}
EOF


