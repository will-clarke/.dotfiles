-- ChangeToNextFile takes a num: 1 goes to the next, -1 to previous
function editNextFile(num)
	local current_file = vim.fn.expand("%:p")
	local current_dir = vim.fn.expand("%:p:h")
	local files = vim.fn.readdir(current_dir)

	-- Find the index of the current file in the directory
	local current_index
	for i, file in ipairs(files) do
		if file == vim.fn.fnamemodify(current_file, ":t") then
			current_index = i
			break
		end
	end
	print(current_index)

	if current_index then
		local next_index = (current_index % #files) + num
		local next_file = current_dir .. "/" .. files[next_index]
		vim.cmd("e " .. next_file)
	else
		print("Current file not found in the directory.")
	end
end
