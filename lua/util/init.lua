local M = {}

local check_mapping = function(maps, lhs)
	for _, v in pairs(maps) do
		if v.lhs == lhs then
			return v
		end
	end
end

function M.mapkeys(map)
	local existing_maps = {}	
	for i, v in ipairs(map) do
		-- Unpack map
		mode, lhs, rhs, opts = unpack(v)
		-- Pull in current keymap for comparison
		if type(mode) == "table" then 
			mode = mode[1]
		end

		local maps = vim.api.nvim_get_keymap(mode)
		local match = check_mapping(maps, lhs)
		if match then
			local overlap = {
				new_map = v,
				old_map = match,
			}
			table.insert(existing_maps, overlap)
		else 
			vim.keymap.set(unpack(v))
		end

	end

	if existing_maps[1] then
		print("Found some overlapping mappings")
		for _, v in pairs(existing_maps) do
			print("Attempted to set:")
			P(v.new_map)
			print("Over:")
			print(v.old_map.desc, "\n", v.old_map.lhs, "\n", v.old_map.rhs)
		end
	end
end

function M.on_load(name, fn)
    local Config = require("lazy.core.config")
    if Config.plugins[name] and Config.plugins[name]._.loaded then
        fn(name)
    else
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyLoad",
            callback = function(event)
                if event.data == name then
                    fn(name)
                    return true
                end
            end,
        })
    end
end

function M.path_to_module(file_path)
    if type(file_path) == "table" then
        file_path = file_path.filename
    end
    for k, _ in  file_path:gmatch("lua[%w_\\/]*[\\/]*[%w_]*%.lua$", "") do
        local namespace = k:sub(5, -5)
        return namespace:gsub("[\\/]", ".")
    end
end

function M.collect(nspace)
    -- print("files found in ", nspace, ":")
    local scan = require("plenary.scandir")
    local path = vim.fn.stdpath("config") .. "/lua/" .. nspace
    -- print("searching ", path, " recursively...")
    local files = scan.scan_dir(path)
    -- print("found: ")
    -- P(files)

    local collected = {}
    for _, file in pairs(files) do
        if string.sub(file, -8) ~= "init.lua" then
            -- print("inserting from file: ", file)
            local module = require(M.path_to_module(file))
            for _, entry in pairs(module) do
                table.insert(collected, entry)
            end
        end
    end
    return collected
end

return M
