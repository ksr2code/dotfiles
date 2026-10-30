local M = {}

function M.add_boilerplate()
  if vim.bo.filetype ~= "python" then return end

  -- SHEBANG
  local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
  if not first_line or not first_line:match("^#!") then
    vim.api.nvim_buf_set_lines(0, 0, 0, false, {
      "#!/usr/bin/env python3",
      "",
    })
  end

  -- MAIN BLOCK
  -- local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  -- local main_exists = false
  -- for _, line in ipairs(lines) do
  --   if line:match("^def main%(%):") then
  --     main_exists = true
  --     break
  --   end
  -- end
  --
  -- if not main_exists then
  --   local last_line = vim.api.nvim_buf_line_count(0)
  --   vim.api.nvim_buf_set_lines(0, last_line, last_line, false, {
  --     "",
  --     "def main():",
  --     "    pass",
  --     "",
  --     'if __name__ == "__main__":',
  --     "    main()",
  --   })
  -- end

  -- MAKE FILE EXECUTABLE
  vim.fn.system({ "chmod", "+x", vim.fn.expand("%") })
end

return M
