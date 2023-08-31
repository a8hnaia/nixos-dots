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
			#neovim
			kitty
			polkit-kde-agent
			waylock
		];
	};

	programs.home-manager.enable = true;

	programs.firefox.enable = true;

	programs.zsh.enable = true;

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
	};

	#programs.neovim-flake = {
		#enable = true;
		#settings.vim.lsp.enable = true;
	#};
}
