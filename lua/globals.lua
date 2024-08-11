P = function(v)
	print(vim.inspect(v))
	return v
end

vim.g.mapleader = " "

RELOAD = function(name)
    package.loaded[name] = nil
    return require(name)
end
-- local python_path = "nothing"
-- vim.cmd("let g:python3_host_prog="..python_path)
