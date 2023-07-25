--[[ require("dap-vscode-js").setup {
  debugger_cmd = { "js-debug-adapter" },
  adapters = { "pwa-node", "pwa-chrome", "node-terminal" },
}

for _, language in ipairs { "typescript", "javascript" } do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }
end

for _, language in ipairs { "typescriptreact", "javascriptreact" } do
  require("dap").configurations[language] = {
    {
      type = "pwa-chrome",
      name = "Attach - Remote Debugging",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      name = "Launch Chrome",
      request = "launch",
      url = "http://localhost:3000",
    },
  }
end ]]


require("dap").adapters.node2 = {
  type = "executable",
  command = "node",
  args = {
    require("mason-registry").get_package("node-debug2-adapter"):get_install_path() .. "/out/src/nodeDebug.js",
  },
}

require("dap").adapters.firefox = {
  type = "executable",
  command = "node",
  args = {
    require("mason-registry").get_package("firefox-debug-adapter"):get_install_path() .. "/dist/adapter.bundle.js",
  },
}

for _, language in pairs({ "javascript", "javascriptreact", "typescript", "typescriptreact" }) do
  require("dap").configurations[language] = {
    {
      name = "Launch Node on current file",
      type = "node2",
      request = "launch",
      program = "${file}",
      cwd = vim.loop.cwd(),
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
    },
    {
      name = "Launch Firefox on localhost",
      request = "launch",
      type = "firefox",
      reAttach = true,
      url = "http://localhost:8080",
      webRoot = "${workspaceFolder}",
      console = "integratedTerminal",
    },
  }
end
