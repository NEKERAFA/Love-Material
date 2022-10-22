-- execute: lua5.4

local fd = assert(io.open(arg[1], 'r'))
local code = assert(io.open(arg[2], 'w'))

code:write('{\n')
for line in fd:lines("l") do
    local symbol, codepoint = line:match('^([%w_]+)%s([0-9a-f]+)$')
    codepoint = tonumber(codepoint, 16)
    code:write('\t[\'' .. symbol .. '\'] = \'' .. utf8.char(codepoint) .. '\',\n')
end
fd:close()
code:write('}\n')
code:flush()
code:close()
