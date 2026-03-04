return {
  {
    "mfussenegger/nvim-dap",
    config = function(plugin, opts)
      local dap = require("dap")
      -- Define your configurations here
      dap.configurations.go = {
      {
        type = "delve",
        name = "file",
        request = "launch",
        program = "${file}",
        outputMode = "remote",
      }
    }
    end,
  },
}
