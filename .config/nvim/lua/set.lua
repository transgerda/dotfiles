vim.g.have_nerd_font = true
-- vim.g.user_emmet_leader_key = '<C-Z>'

local opt = vim.opt

vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

opt.mouse = "a"
vim.opt.showmode = false

vim.opt.breakindent = true

opt.cmdheight = 1

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undofile = true

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 4
opt.isfname:append("@-@")

-- vim.g.netrw_banner = 0;

opt.updatetime = 100


-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = "split"

vim.opt.cursorline = true

if vim.loop.os_uname().sysname == "Windows_NT" then
  opt.undodir = "C:/Users/Andy/temp/.vim/undodir"
  vim.cmd([[
		let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
		let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
		let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
		let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]])
else
  opt.undodir = "/tmp/undo"
end

vim.opt.conceallevel = 1

-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
	vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#777777', bold=true })
  vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
  vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#777777', bold=true })
end
