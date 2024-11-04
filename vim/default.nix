{ globalVars, pkgs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [

      # utils & fun
      markdown-preview-nvim
      vim-fugitive
      vim-wakatime

      # theming
      vim-airline
      vim-airline-themes
      rainbow
      vim-gitgutter
      gruvbox

      # completion with coc
      coc-nvim
      coc-java
      # coc-tabnine # ia suggestions
      coc-tsserver # js & ts
      coc-pyright # python
      coc-json
      coc-html
      coc-css
      coc-snippets
      coc-ultisnips

      vim-snippets

      ultisnips
    ];
    extraConfig =
      let
        dm = globalVars.darkmode;
      in
      ''
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1

        let g:airline_theme=${if dm then "'base16_atelier_estuary_light'"
          else "'base16_atelier_estuary'"}

        syntax on

        " set termguicolors
        set background=${if dm then "dark" else "light"}

        colorscheme gruvbox

        " transparent background
        hi Normal guibg=NONE ctermbg=NONE
      '' + (builtins.readFile ./vimrc);
  };

  home.packages = with pkgs; [
    # for coc-nvim
    nodejs

    # font for vim-airline
    powerline-fonts

    ### language servers

    # c
    clang-tools

    # nix
    nil
    nixpkgs-fmt

    # ocaml
    ocamlPackages.ocaml-lsp
    ocamlformat

    # rust
    rust-analyzer
  ];

  home.file = {
    ".vim/coc-settings.json".source = ./coc-settings.json;
    ".clang-format".source = ./clang-format;
  };
}


