return {
	--Quickstart configs for Nvim LSP https://github.com/neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Also you can install manually using :MasonInstall {name}
		-- For example eslint_d and prettier_d
		mason.setup()
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"taplo",
				"gopls",
				"golangci_lint_ls",
				"vtsls",
				"volar",
				"eslint",
				"html",
				"cssls",
				"emmet_ls",
				"tailwindcss",
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(event)
				local keymap = function(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, noremap = true, silent = true })
				end

				local fzf = require("fzf-lua")

				-- keymap("n", "gD", fzf.lsp_declarations, { desc = "Go to LSP Declarations" })
				keymap("n", "<F2>r", fzf.lsp_references, { desc = "Show References" })
				-- keymap("n", "gd", fzf.lsp_definitions)
				keymap("n", "<F2>d", fzf.lsp_definitions, { desc = "Show definitions" })
				-- keymap("n", "gi", fzf.lsp_implementations)
				-- keymap("n", "gt", fzf.lsp_typedefs)

				-- keymap({ "n", "v" }, "<leader>ca", fzf.lsp_code_actions)

				keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
				-- keymap("n", "<leader>r", vim.lsp.buf.rename)
				keymap("n", "<leader>k", vim.lsp.buf.hover)

				-- keymap("n", "<leader>hh", function()
				-- 	local reversed_value = not vim.lsp.inlay_hint.is_enabled({})
				--
				-- 	vim.lsp.inlay_hint.enable(reversed_value)
				-- end)

				keymap("n", "<leader>r", ":LspRestart<CR>", { desc = "Restart LSP" })
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local servers = {

			-- Add cssls here
			-- cssls = {
			-- 	filetypes = { "css", "scss", "less", "vue" }, -- Ensure it runs for .vue files as well
			-- },
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						completion = { callSnippet = "Replace" },
					},
				},
			},
			rust_analyzer = { settings = { check = { command = "clippy" } } },
			docker_compose_language_service = { filetypes = { "yml.docker-compose" } },

			--
			-- Vue take over mode
			vtsls = {
				filetypes = { "typescript", "javascript", "vue" },
				settings = {
					vtsls = { tsserver = { globalPlugins = {} } },
				},
				before_init = function(params, config)
					local result = vim.system(
						{ "npm", "query", "#vue" },
						{ cwd = params.workspaceFolders[1].name, text = true }
					)
						:wait()
					if result.stdout ~= "[]" then
						local vuePluginConfig = {
							name = "@vue/typescript-plugin",
							location = require("mason-registry").get_package("vue-language-server"):get_install_path()
								.. "/node_modules/@vue/language-server",
							languages = { "vue" },
							configNamespace = "typescript",
							enableForWorkspaceTypeScriptVersions = true,
						}
						table.insert(config.settings.vtsls.tsserver.globalPlugins, vuePluginConfig)
					end
				end,
			},
		}

		mason_lspconfig.setup_handlers({
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
		})
	end,
}
