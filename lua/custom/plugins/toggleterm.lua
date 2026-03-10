return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = nil,
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = false,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell,
    auto_scroll = true,
    float_opts = {
      border = 'rounded',
      width = math.floor(vim.o.columns * 0.8),
      height = math.floor(vim.o.lines * 0.8),
      winblend = 3,
    },
  },
  keys = {
    { '<leader>tt', '<cmd>ToggleTerm direction=float<cr>',      desc = '[T]oggle floating [T]erminal' },
    { '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', desc = '[T]oggle [H]orizontal terminal' },
    { '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>',   desc = '[T]oggle [V]ertical terminal' },
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    -- Use Escape to exit terminal mode and close the terminal
    vim.keymap.set('t', '<Esc>', '<cmd>ToggleTerm<cr>', { desc = 'Close terminal' })
  end,
}
