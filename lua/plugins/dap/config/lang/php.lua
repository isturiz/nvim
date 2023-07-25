local dap = require("dap")

dap.adapters.php = {
  type = "executable",
  command = "php-debug-adapter",
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Laravel",
    port = 9003,
    pathMappings = {
      ["/var/www/html"] = "${workspaceFolder}",
    },
  },
  {
    type = "php",
    request = "launch",
    name = "Symfony",
    port = 9003,
    pathMappings = {
      ["/app"] = "${workspaceFolder}",
    },
  },
  {
    type = "php",
    request = "launch",
    name = "Laravel Artisan Queue",
    program = "${workspaceFolder}/artisan",
    args = {"queue:work", "--verbose", "--tries=3", "--timeout=90"},
    cwd = "${workspaceFolder}",
  },
}
