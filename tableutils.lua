local log = require 'vendor.log.log'

local M = {}

function M.shuffle(t)
	math.randomseed(os.time())
	assert(t, "table.shuffle() expected a table, got nil")
	local iterations = #t
	local j
	for i = iterations, 2, -1 do
		j = math.random(i)
		t[i], t[j] = t[j], t[i]
	end
	return t
end

function M.extend(dest, source)
	local destination = {}
	if source then
		for k,v in pairs(source) do
			destination[k] = v
		end
		for k,v in pairs(dest) do
			destination[k] = v
		end
	end
	return destination
end

function M.infect()
	for _, fn in {'shuffle', 'extend'} do
		table[fn] = M[fn]
	end
end

return M
