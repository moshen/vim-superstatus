if exists('g:loaded_syntastic_plugin') && g:loaded_syntastic_plugin == 1
	call b:SuperstatusRegister('syntastic', '[Location List]', '[#FileName]%< Location List [#FileNameS][>>]%* %=')
endif
