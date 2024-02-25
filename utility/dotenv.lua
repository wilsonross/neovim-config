local M = {}

function M.parse_dotenv(dotenv_path)
    local variables = {}
    local dotenv_file = io.open(dotenv_path, "r")

    if dotenv_file then
        for line in dotenv_file:lines() do
            local key, value = string.match(line, '([^#%s]+)=([^#%s]+)')
            if key and value then
                variables[key] = value
            end
        end
        dotenv_file:close()
    else
        print("Unable to open " .. dotenv_path)
    end

    return variables
end

local env_file = vim.fn.stdpath("config") .. "/.env"

M.env_vars = M.parse_dotenv(env_file)

return M
