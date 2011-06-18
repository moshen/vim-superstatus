"        +--------------------------------------------------------------------+
"        | Vim mode                                                           |
"        +-----+---------------------+----+----+-------+---+----+----+--------|
"              | Highlight group     | FG | BG |  Attr |   | FG | BG |  Attr  |
"              +---------------------+----+----+-------+---+----+----+--------+
call b:SuperstatusColors({
	\   'NONE': {
		\   'NONE'           : [[  231, 236, 'bold'], [  244, 232, 'NONE']]
	\ }
	\ , 'Normal': {
		\   'Mode'           : [[  235, 214, 'bold'], [                  ]]
		\ , 'ModeS'          : [[  240, 214, 'bold'], [                  ]]
		\ , 'Branch'         : [[  250, 240, 'NONE'], [  239, 234, 'NONE']]
		\ , 'BranchS'        : [[  246, 240, 'NONE'], [  239, 234, 'NONE']]
		\ , 'FileName'       : [[  231, 240, 'bold'], [  244, 234, 'NONE']]
		\ , 'FileNameS'      : [[  236, 240, 'bold'], [  232, 234, 'NONE']]
		\ , 'Error'          : [[  202, 240, 'bold'], [  239, 234, 'NONE']]
		\ , 'ModFlag'        : [[  196, 240, 'bold'], [  239, 234, 'NONE']]
		\ , 'BufFlag'        : [[  250, 240, 'NONE'], [  239, 234, 'NONE']]
		\ , 'FunctionName'   : [[  247, 236, 'NONE'], [  239, 232, 'NONE']]
		\ , 'FileFormat'     : [[  244, 236, 'NONE'], [  239, 232, 'NONE']]
		\ , 'FileEncoding'   : [[  244, 236, 'NONE'], [  239, 232, 'NONE']]
		\ , 'Separator'      : [[  242, 236, 'NONE'], [  239, 232, 'NONE']]
		\ , 'FileType'       : [[  248, 236, 'NONE'], [  239, 232, 'NONE']]
		\ , 'LinePercentS'   : [[  236, 240, 'NONE'], [  232, 234, 'NONE']]
		\ , 'LinePercent'    : [[  250, 240, 'NONE'], [  239, 234, 'NONE']]
		\ , 'LineNumberS'    : [[  240, 252, 'bold'], [  234, 234, 'NONE']]
		\ , 'LineNumber'     : [[  236, 252, 'bold'], [  244, 234, 'NONE']]
		\ , 'LineColumn'     : [[  240, 252, 'NONE'], [  239, 234, 'NONE']]
	\ }
	\ , 'Insert': {
		\   'Mode'           : [[   23, 153, 'bold'], [                  ]]
		\ , 'ModeS'          : [[   31, 153, 'bold'], [                  ]]
		\ , 'Branch'         : [[  117,  31, 'NONE'], [                  ]]
		\ , 'BranchS'        : [[  117,  31, 'NONE'], [                  ]]
		\ , 'FileName'       : [[  231,  31, 'bold'], [                  ]]
		\ , 'FileNameS'      : [[   24,  31, 'bold'], [                  ]]
		\ , 'Error'          : [[  202,  31, 'bold'], [                  ]]
		\ , 'ModFlag'        : [[  196,  31, 'bold'], [                  ]]
		\ , 'BufFlag'        : [[   75,  31, 'NONE'], [                  ]]
		\ , 'FunctionName'   : [[  117,  24, 'NONE'], [                  ]]
		\ , 'FileFormat'     : [[   75,  24, 'NONE'], [                  ]]
		\ , 'FileEncoding'   : [[   75,  24, 'NONE'], [                  ]]
		\ , 'Separator'      : [[   37,  24, 'NONE'], [                  ]]
		\ , 'FileType'       : [[   81,  24, 'NONE'], [                  ]]
		\ , 'LinePercentS'   : [[   24,  31, 'NONE'], [                  ]]
		\ , 'LinePercent'    : [[  117,  31, 'NONE'], [                  ]]
		\ , 'LineNumberS'    : [[   31, 117, 'bold'], [                  ]]
		\ , 'LineNumber'     : [[   23, 117, 'bold'], [                  ]]
		\ , 'LineColumn'     : [[   31, 117, 'NONE'], [                  ]]
	\ }
	\ , 'Visual': {
		\   'Mode'           : [[   23, 153, 'bold'], [                  ]]
		\ , 'ModeS'          : [[   31, 153, 'bold'], [                  ]]
		\ , 'Branch'         : [[  117,  31, 'NONE'], [                  ]]
		\ , 'BranchS'        : [[  117,  31, 'NONE'], [                  ]]
		\ , 'FileName'       : [[  231,  31, 'bold'], [                  ]]
		\ , 'FileNameS'      : [[   24,  31, 'bold'], [                  ]]
		\ , 'Error'          : [[  202,  31, 'bold'], [                  ]]
		\ , 'ModFlag'        : [[  196,  31, 'bold'], [                  ]]
		\ , 'BufFlag'        : [[   75,  31, 'NONE'], [                  ]]
		\ , 'FunctionName'   : [[  117,  24, 'NONE'], [                  ]]
		\ , 'FileFormat'     : [[   75,  24, 'NONE'], [                  ]]
		\ , 'FileEncoding'   : [[   75,  24, 'NONE'], [                  ]]
		\ , 'Separator'      : [[   37,  24, 'NONE'], [                  ]]
		\ , 'FileType'       : [[   81,  24, 'NONE'], [                  ]]
		\ , 'LinePercentS'   : [[   24,  31, 'NONE'], [                  ]]
		\ , 'LinePercent'    : [[  117,  31, 'NONE'], [                  ]]
		\ , 'LineNumberS'    : [[   31, 117, 'bold'], [                  ]]
		\ , 'LineNumber'     : [[   23, 117, 'bold'], [                  ]]
		\ , 'LineColumn'     : [[   31, 117, 'NONE'], [                  ]]
	\ }
\ })
