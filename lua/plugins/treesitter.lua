return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- 1. Carrega a lista de parsers ANTES do setup
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    -- 2. Define a regra para a linguagem desejada (ex: 'cpp')
    -- Isso garante que, quando o auto_install rodar, ele use 'master'
    parser_config.cpp = {
      install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-cpp", 
        files = { "src/parser.c", "src/scanner.cc" }, -- C++ usa scanner.cc
        branch = "master", 
      },
    }

    -- 3. Agora o setup com o auto_install ligado
    local configs = require("nvim-treesitter.config")
    configs.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
