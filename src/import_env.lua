local file = assert(io.open(arg[1], "r"))

for line in file:lines() do
    if line ~= "" and line:sub(1, 1) ~= '#' then
        local index = line:find("=")
        local name = line:sub(1, index - 1)
        local value = line:sub(index + 1)

        print(
            string.format("fastcgi_param %s %s;", name, value)
        )
    end
end

file:close()
