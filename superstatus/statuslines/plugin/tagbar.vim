if exists('g:loaded_tagbar') && g:loaded_tagbar == 1
	call b:SuperstatusRegister('tagbar', '__Tagbar__', '[#FileName]%< Tagbar [#FileNameS][>>]%* %=')
endif
