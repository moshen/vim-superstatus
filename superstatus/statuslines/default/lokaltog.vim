let s:stl  = ""

" Show mode
let s:stl .= "[CUR][#Mode] %{&paste ? 'PASTE [>] ' : ''}%{substitute(mode(), '', '^V', 'g')} [#ModeS][>>][/CUR]"

if g:loaded_fugitive == 1
	" Show git branch
	" Requires: Fugitive
	let s:stl .= "[#Branch] %(%{substitute(fugitive#statusline(), 'GIT(\\([a-z0-9\\-_\\./:]\\+\\))', 'Đ \\1', 'gi')}[#BranchS] [>] %)"
endif

" RO flag
let s:stl .= "[#ModFlag]%{&readonly ? 'Ĥ ' : ''}"

" File name
let s:stl .= "[#FileName]%t "

if g:loaded_syntastic_plugin == 1
	" Syntax error flag
	" Requires: Syntastic
	let s:stl .= "[CUR][#Error]%(%{substitute(SyntasticStatuslineFlag(), '\\[Syntax: line:\\(\\d\\+\\) \\((\\(\\d\\+\\))\\)\\?\\]', '[>][>][>] SYNTAX đ \\1 \\2 [>][>][>]', 'i')} %)[/CUR]"
endif

" Modified flag
let s:stl .= "[#ModFlag]%(%M %)"

" HLP,PRV flags
let s:stl .= "[#BufFlag]%(%H%W %)"

" Separator
let s:stl .= "[#FileNameS][>>]"

" Padding, HL group
let s:stl .= "[#FunctionName] "

" Truncate right
let s:stl .= "%<"

if exists('*cfi#format')
	" Function name
	" Requires: current-func-info
	let s:stl .= "[CUR]%(%{cfi#format('%s', '')} %)[/CUR]"
endif

" Right align
let s:stl .= "%= "

" File format
let s:stl .= "[CUR][#FileFormat]%{&fileformat} [/CUR]"

" File encoding
let s:stl .= "[CUR][#FileEncoding]%{(&fenc == '' ? &enc : &fenc)} [/CUR]"

" File type
let s:stl .= "[CUR][#Separator][<] Ġġ [#FileType]%{strlen(&ft) ? &ft : 'n/a'} [/CUR]"

" Line/column/virtual column, Line percentage
let s:stl .= "[#LinePercentS][<<][#LinePercent] %p%% "

" Line/column/virtual column, Line percentage
let s:stl .= "[#LineNumberS][<<][#LineNumber] đ %l[#LineColumn]:%c%V "

" Current syntax group
" Set g:superstatus_synid to enable
let s:stl .= "%{exists('g:superstatus_synid') && g:superstatus_synid ? '[<] '.synIDattr(synID(line('.'), col('.'), 1), 'name').' ' : ''}"

call b:SuperstatusRegister('DEFAULT', 'DEFAULT', s:stl)
