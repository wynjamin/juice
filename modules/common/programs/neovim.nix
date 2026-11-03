{
  lib,
  nvf,
  ...
}:

{
  imports = [ nvf ];

  programs.nvf =
    let
      tabWidth = 4;
    in
    {
      enable = true;
      settings = {
        vim = {
          options = {
            number = true;
            relativenumber = true;

            tabstop = tabWidth;
            softtabstop = tabWidth;
            shiftwidth = tabWidth;
            expandtab = true;
            smartindent = false;
            wrap = false;

            swapfile = false;
            backup = false;
            undofile = true;

            signcolumn = "yes:1";
            cursorlineopt = "screenline";
            background = "dark";
            scrolloff = 8;
          };

          keymaps = [
            {
              mode = "i";
              key = "<C-BS>";
              action = "<C-W>";
              desc = "Delete word";
            }
            {
              mode = "n";
              key = "<leader>fr";
              action = "<cmd>Telescope oldfiles<CR>";
              desc = "Recent files [Telescope]";
            }
            {
              mode = "n";
              key = "<leader>o";
              action = "<cmd>Oil<CR>";
              desc = "Open file explorer [Oil]";
            }
            {
              mode = "n";
              key = "gd";
              action = "<cmd>Telescope lsp_definitions<CR>";
              desc = "Show LSP definitions";
            }
            {
              mode = "n";
              key = "gi";
              action = "<cmd>Telescope lsp_implementations<CR>";
              desc = "Show LSP implementations";
            }
            {
              mode = "n";
              key = "gt";
              action = "<cmd>Telescope lsp_type_definitions<CR>";
              desc = "Show LSP type definitions";
            }
            {
              mode = "n";
              key = "rn";
              action = "vim.lsp.buf.rename";
              desc = "Smart rename";
              lua = true;
            }
          ];

          autocmds = [
            {
              event = [ "TextYankPost" ];
              callback = lib.generators.mkLuaInline /* lua */ ''
                function()
                    vim.hl.on_yank()
                end
              '';
            }
          ];

          preventJunkFiles = true;
          undoFile.enable = true;
          enableLuaLoader = true;

          clipboard = {
            enable = true;
            registers = "unnamedplus";
          };

          viAlias = true;
          vimAlias = true;

          lsp = {
            enable = true;
            formatOnSave = true;
            trouble.enable = true;
            lspSignature.enable = true;
          };

          telescope = {
            enable = true;
            setupOpts.defaults = {
              layout_config.horizontal.prompt_position = "bottom";
              pickers = {
                oldfiles.cwd_only = true;
                buffers.cwd_only = true;
              };
              path_display = [ "truncate" ];
              sorting_strategy = "descending";
            };
          };

          utility = {
            undotree.enable = true;
            oil-nvim = {
              enable = true;
              setupOpts = {
                columns = { };
                default_file_explorer = true;
                view_options.show_hidden = true;
                skip_confirm_for_simple_edits = true;
              };
            };
          };

          notes.todo-comments.enable = true;

          formatter.conform-nvim = {
            enable = true;
            setupOpts = {
              formatters = {
                prettier.args = [
                  "--stdin-filepath"
                  "$FILENAME"
                  "--tab-width"
                  (builtins.toString tabWidth)
                  "--use-tabs"
                  "false"
                ];
              };
            };
          };

          diagnostics = {
            enable = true;
            config = {
              virtual_text = true;
              underline = true;
              update_in_insert = true;
              float = {
                focusable = false;
                style = "minimal";
                border = "rounded";
                source = true;
              };
            };
          };

          autopairs.nvim-autopairs = {
            enable = true;
            setupOpts = {
              check_ts = true;
              ts_config = {
                lua = [ "strings" ];
                java = false;
              };
            };
          };

          autocomplete.nvim-cmp.enable = true;

          binds = {
            whichKey.enable = true;
            cheatsheet.enable = true;
          };

          visuals.fidget-nvim.enable = true;

          mini.comment.enable = true;

          presence.neocord.enable = true;

          ui = {
            colorizer.enable = true;
            borders.enable = true;
            ui2 = {
              enable = true;
              setupOpts.msg.msg.timeout = 4500;
            };
          };

          git = {
            enable = true;
            gitsigns = {
              enable = true;
              codeActions.enable = false;
            };
          };

          snippets.luasnip.enable = true;

          theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
          };

          languages = {
            enableTreesitter = true;
            enableFormat = true;
            enableExtraDiagnostics = true;

            typescript = {
              enable = true;
              extensions.ts-error-translator.enable = true;
              extraDiagnostics.types = [ "biomejs" ];
              format.type = [ "biome-check" ];
            };
            html.enable = true;
            css.enable = true;

            rust.enable = true;
            clang.enable = true;

            markdown.enable = true;

            python = {
              lsp.servers = [ "pyright" ];
              enable = true;
            };

            fish.enable = true;
            bash.enable = true;

            nix.enable = true;
            yaml.enable = true;
            json.enable = true;
            lua.enable = true;
            toml.enable = true;

            java = {
              enable = true;
              extensions.gradle-nvim.enable = true;
            };
          };
        };
      };
    };
}
