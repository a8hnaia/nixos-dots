{ inputs, config, libs, pkgs, ... }:
{
	imports = [
		inputs.neovim-flake.homeManagerModules.default
	];

	home = {
		username = "ath";
		homeDirectory = "/home/ath";

		stateVersion = "23.05";

		packages = with pkgs; [
			gcc
			kitty
			lua
			polkit-kde-agent
			swaybg
			waylock
			wl-clipboard
		];
	};

	programs.home-manager.enable = true;

	programs.firefox.enable = true;

	programs.zsh = {
		enable = true;
	};

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
	};

	programs.neovim-flake = {
		enable = true;
		settings.vim = {
			configRC = {
				listchars = ''
					set listchars=tab:──╴,trail:~,space:·,extends:»,precedes:«,nbsp:•
					set list
				'';
				tab = ''
					set tabstop=2
					set softtabstop=2
					set shiftwidth=2
					set noexpandtab
				'';
				#sudowrite = "command -nargs=? -complete=file W execute 'write /etc/nixos/homes/ath/superwrite.sh \"<args>\" \"%\" <bar> edit!'";
			};
			luaConfigRC = {
				lualine = "require('lualine').hide{place = {'winbar'}}";
			};
			lsp.enable = true;
			treesitter = {
				enable = true;
				context.enable = true;
				context.mode = "topline";
			};
			languages = {
				clang = {
					enable = true;
					treesitter.enable = true;
				};
			};
			statusline.lualine = {
				enable = true;
			};
			comments.comment-nvim = {
				enable = true;
			};
			extraPlugins = with pkgs.vimPlugins; {
				gruvbox = {
					package = gruvbox-nvim;
					setup = ''
						require('gruvbox').setup()
						vim.o.background = 'dark'
						vim.cmd('colorscheme gruvbox')
					'';
				};
			};
			#visuals.indentBlankline = {
				#enable = true;
				#eolChar = "¬";
			#};
		};
	};
}
