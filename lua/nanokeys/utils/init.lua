local M = {}

M.get_selected_text = function()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})
  text = string.gsub(text, '\n', '')

  if #text <= 0 then
    return ''
  end

  return text
end

return M
