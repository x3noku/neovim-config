vim.api.nvim_create_user_command('OpenSSL', function()
  local _, col = unpack(vim.api.nvim_win_get_cursor(0))
  local result = vim.api.nvim_exec2('!openssl rand -base64 32', { output = true })
  local output = result.output:gsub('[\n\r]', ''):gsub('%:%!openssl%srand%s%-base64%s32', '')

  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, col + 1) .. output .. line:sub(col + 2)

  vim.api.nvim_set_current_line(nline)
end, {})
