function! GoGithubFile()
	" get current file path, minus gopath prefix
	let thisfile = split(expand('%:p'), expand('$GOPATH/src/'))

	let parts = split(thisfile[0], '/')

	let repoparts = parts[:2]
	let fileparts = parts[3:]

	let urlparts = parts[:2] + ['blob', 'master'] + parts[3:]

	let out = "'https://" . join(urlparts, "/") . "\\#L" . line(".") . "'"

	silent execute "!chromium " . out
	silent !i3-msg '[class="chromium"] focus'
endfunction

command! -nargs=0 GoGithub call GoGithubFile()
