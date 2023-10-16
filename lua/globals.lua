P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(name)
    package.loaded[name] = nil
    return require(name)
end

vim.cmd("let g:python3_host_prog='/home/drew/.local/share/rtx/installs/python/3.11.6/bin/python'")
