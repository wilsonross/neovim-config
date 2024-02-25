-- Import
local dap = require("dap")
local dap_ui = require("dapui")

local nvim_config_dir = vim.fn.stdpath("config")
local dotenv = dofile(nvim_config_dir .. "/utility/dotenv.lua")

-- Setup
dap_ui.setup({})

-- Icons
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

-- Mappings
vim.keymap.set("n", "<Leader>dc", function() require("dap").continue() end)
vim.keymap.set("n", "<Leader>da", function() require("dap").step_over() end)
vim.keymap.set("n", "<Leader>di", function() require("dap").step_into() end)
vim.keymap.set("n", "<Leader>so", function() require("dap").step_out() end)
vim.keymap.set("n", "<Leader>b", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<Leader>B", function() require("dap").set_breakpoint() end)
vim.keymap.set("n", "<Leader>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end)
vim.keymap.set("n", "<Leader>dl", function() require("dap").run_last() end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
    require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
    require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end)

dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        args = {dotenv.env_vars["JS_DEBUG_PATH"], "${port}"},
    }
}

dap.configurations.typescript = {
    {
        type = 'pwa-node',
        request = 'attach',
        name = 'Attach to Process',
        port = tonumber(dotenv.env_vars["NODE_DEBUG_PORT"]),
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        skipFiles = {'<node_internals>/**'}
    }
}
