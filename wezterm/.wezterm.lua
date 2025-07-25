local wezterm = require("wezterm")

return {
	-- Global settings
	font = wezterm.font("CaskaydiaCove Nerd Font Mono"),
	font_size = 14.0,
	color_scheme = "Catppuccin Mocha",
	window_background_opacity = 0.9,
	default_prog = { "wsl.exe", "--distribution", "Ubuntu", "--cd", "~" }, -- optional default

	-- Custom launch menu (Windows only)
	launch_menu = {
		-- WSL Distros
		{
			label = "WSL: Ubuntu",
			args = { "wsl.exe", "--distribution", "Ubuntu", "--cd", "~" },
		},
		{
			label = "WSL: Debian",
			args = { "wsl.exe", "--distribution", "Debian", "--cd", "~" },
		},

		-- Git Bash
		{
			label = "Git Bash",
			args = { "C:\\Users\\Rodrigo\\scoop\\shims\\bash.exe", "--login", "-i" },
		},

		-- PowerShell
		{
			label = "PowerShell",
			args = { "powershell.exe" },
		},

		-- CMD
		{
			label = "CMD",
			args = { "cmd.exe" },
		},
	},

	-- Optional: Show launch menu on right-click or Ctrl+Shift+L
	use_fancy_tab_bar = false,
	enable_tab_bar = true,
}
