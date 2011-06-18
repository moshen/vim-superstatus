if g:loaded_gundo == 1
	call b:SuperstatusRegister('gundo', '__Gundo__', '#[Branch] GUNDO#[BranchS] [>] #[FileName]%<Undo tree #[FileNameS][>>]%* %=')
	call b:SuperstatusRegister('gundo', '__Gundo_Preview__', '#[Branch] GUNDO#[BranchS] [>] #[FileName]%<Diff preview #[FileNameS][>>]%* %=')
endif
