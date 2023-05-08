-- Import
local dap = require("dap")
local dap_ui = require("dapui")
local vscode_dap = require("dap-vscode-js")

-- Setup
dap_ui.setup({})
vscode_dap.setup({
    debugger_path = os.getenv("HOME") .. "/Tools/vscode-js-debug/",
    adapters = { "pwa-node" },
})

-- Icons
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

-- Mappings
vim.keymap.set("n", "<F5>", function() require("dap").continue() end)
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)
vim.keymap.set("n", "<Leader>b", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<Leader>B", function() require("dap").set_breakpoint() end)
vim.keymap.set("n", "<Leader>lp",
    function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
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

-- Adapters
dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/Tools/vscode-php-debug/out/phpDebug.js" }
}

-- Configurations
dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9003
    }
}

dap.configurations.javascript = {
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
        skipFiles = { "<node_internals>/**", "node_modules/**" }
    },
    {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require "dap.utils".pick_process,
        cwd = "${workspaceFolder}",
    },
    {
        type = "pwa-node",
        request = "launch",
        name = "Mocha",
        runtimeExecutable = "node",
        runtimeArgs = {
            "./node_modules/mocha/bin/mocha.js",
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
    }
}

dap.configurations.typescript = {
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
        skipFiles = { "<node_internals>/**", "node_modules/**" },
        runtimeExecutable = "ts-node"
    },
    {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require "dap.utils".pick_process,
        cwd = "${workspaceFolder}",
    },
    {
        type = "pwa-node",
        request = "launch",
        name = "Mocha",
        runtimeExecutable = "ts-node",
        runtimeArgs = {
            "./node_modules/mocha/bin/mocha.js",
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
    }
}
