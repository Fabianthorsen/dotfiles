return {
  'nvim-lualine/lualine.nvim', -- plugin to install
  event = { 'BufReadPre', 'BufNewFile', 'InsertEnter' }, -- lazy-loading (more on this later)
  config = function () -- the configuration code
    local status_ok, lualine = pcall(require, 'lualine')
    if not status_ok then
      return
    end
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
      },
      sections = {
        lualine_a = {
          {
            'filename',
            path = 1,
          },
        },
      },
    })
  end
}
