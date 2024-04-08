local M = {}

M.setup = function(config)
  vim.api.nvim_create_user_command("NanoKeys", function(opts)
    local args = opts.args
    local ok, command = pcall(require, "nanokeys.commands." .. args)

    if not ok then
      error(string.format("'$s' command doesn't exists: %s", args, command))
    end

    command.setup()
  end, { nargs = 1 })
end

return M
