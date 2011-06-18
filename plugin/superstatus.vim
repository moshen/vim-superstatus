" Superstatus - The ultimate vim statusline!
"
" Author: Kim Silkebækken <kim.silkebaekken+vim@gmail.com>
" Source repository: https://github.com/Lokaltog/vim-superstatus

" Script initialization {{{
	if exists('g:superstatus_loaded') || &compatible || version < 702
		finish
	endif

	if &t_Co != 256 || has('gui_running')
		echoe 'Superstatus requires a GUI or 256-color terminal.'

		finish
	endif

	let g:superstatus_loaded = 1
" }}}
" Default configuration {{{
	function! s:InitOptions(options) " {{{
		for [key, value] in items(a:options)
			if ! exists('g:superstatus_' . key)
				exec 'let g:superstatus_' . key . ' = ' . string(value)
			endif
		endfor
	endfunction " }}}

	call s:InitOptions({
	\   'arrows': 'sharp'
	\ , 'colors': 'lokaltog'
	\ })

	let s:arrows = {
	\   'grunge': ['ǀ', 'ǁ', 'ǂ', 'ǃ', 'Ǆ', 'ǅ']
	\ , 'fade'  : ['ǐ', 'Ǒ', 'ǒ', 'Ǔ', 'ǔ', 'Ǖ']
	\ , 'sharp' : ['Ǡ', 'ǡ', 'Ǣ', 'ǣ', 'Ǥ', 'ǥ']
	\ , 'round' : ['ǰ', 'Ǳ', 'ǲ', 'ǳ', 'Ǵ', 'ǵ']
	\ }
" }}}
" Load statuslines {{{
	let s:superstatus = {}
	function! b:SuperstatusRegister(plugin, bufname, statusline) " {{{
		let s:superstatus[a:plugin] = {
		\   'bufname': a:bufname
		\ , 'statusline': a:statusline
		\ }
	endfunction " }}}

	for file in split(globpath(&rtp, 'superstatus/statuslines/*/*'), "\n")
		" TODO handle exceptions
		exec 'source ' . file
	endfor
" }}}
" Load colors {{{
	function! b:SuperstatusColors(colors) " {{{
		for mode in keys(a:colors)
			for name in keys(a:colors[mode])
				let colors = {'C': a:colors[mode][name][0], 'NC': a:colors[mode][name][1]}
				let mode = (mode == 'NONE' ? '' : mode)
				let name = (name == 'NONE' ? '' : name)

				for current in ['C', 'NC']
					if exists("colors['" . current . "'][0]")
						exec printf('hi StatusLine%s%s%s ctermfg=%s ctermbg=%s cterm=%s'
							\ , mode
							\ , name
							\ , (current == 'C' ? '' : current)
							\ , colors[current][0]
							\ , colors[current][1]
							\ , colors[current][2]
							\ )
					endif
				endfor
			endfor
		endfor
	endfunction " }}}
	function! s:SourceColors() " {{{
		" TODO handle exceptions
		exec 'source ' . globpath(&rtp, 'superstatus/colors/' . g:superstatus_colors . '.vim')
	endfunction " }}}

	call s:SourceColors()
" }}}
" Core functions {{{
	function! s:DetectStatusline() "{{{
		" TODO Detect existing statusline, use buffer-specific statusline
	endfunction " }}}
	function! s:Superstatus(mode, current) " {{{
		let current = (a:current ? '' : 'NC')
		let mode = a:mode
		let new_stl = s:superstatus.DEFAULT.statusline

		" Prepare current buffer specific text
		" Syntax: <CUR> ... </CUR>
		let new_stl = substitute(new_stl, '<CUR>\(.\{-,}\)</CUR>', (a:current ? '\1' : ''), 'g')

		" Prepare statusline colors
		" Syntax: #[ ... ]
		let new_stl = substitute(new_stl, '#\[\(\w\+\)\]', '%#StatusLine'.mode.'\1'.current.'#', 'g')

		" Prepare statusline arrows
		" Syntax: [>] [>>] [<] [<<]
		let new_stl = substitute(new_stl, '\[>\]',  s:arrows[g:superstatus_arrows][3], 'g')
		let new_stl = substitute(new_stl, '\[>>\]', s:arrows[g:superstatus_arrows][5], 'g')
		let new_stl = substitute(new_stl, '\[<\]',  s:arrows[g:superstatus_arrows][2], 'g')
		let new_stl = substitute(new_stl, '\[<<\]', s:arrows[g:superstatus_arrows][4], 'g')

		if &l:statusline ==# new_stl
			" Statusline already set, nothing to do
			return
		endif

		if empty(&l:statusline)
			" No statusline is set, use my_stl
			let &l:statusline = new_stl
		else
			" Check if a custom statusline is set
			let plain_stl = substitute(&l:statusline, '%#StatusLine\w\+#', '', 'g')

			if &l:statusline ==# plain_stl
				" A custom statusline is set, don't modify
				return
			endif

			" No custom statusline is set, use my_stl
			let &l:statusline = new_stl
		endif
	endfunction " }}}
" }}}
" Autocommands {{{
	augroup Superstatus
		autocmd!

		au ColorScheme *
			\ call s:SourceColors()

		au BufEnter,BufWinEnter,WinEnter,CmdwinEnter,CursorHold,BufWritePost,InsertLeave *
			\ call s:Superstatus('Normal', 1)

		au BufLeave,BufWinLeave,WinLeave,CmdwinLeave *
			\ call s:Superstatus('Normal', 0)

		au InsertEnter,CursorHoldI *
			\ call s:Superstatus('Insert', 1)
	augroup END
" }}}

" vim: fdm=marker:noet:ts=4:sw=4:sts=4
