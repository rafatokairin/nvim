return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Pega as configs existentes
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    -- Altera apenas a branch do parser C++
    parser_config.cpp.install_info.branch = "master"

    -- Setup normal
    require("nvim-treesitter.config").setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}