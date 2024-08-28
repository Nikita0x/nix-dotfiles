-- Functions
-- gui=underline 
vim.cmd [[
  highlight Function gui=underline guifg=#d97706
]]


vim.cmd [[
  highlight @function.builtin gui=underline guifg=#d97706
]]


-- Numbers
vim.cmd [[
  highlight Number guifg=#408080
]]

-- Keywords
vim.cmd [[
  highlight Keyword gui=italic guifg=#9872A2
]]
vim.cmd [[
  highlight Conditional gui=italic guifg=#9872A2
]]
vim.cmd [[
  highlight Statement gui=italic guifg=#9872A2
]]
vim.cmd [[
  highlight Exception gui=italic guifg=#9872A2
]]
-- Strings
vim.cmd [[
  highlight String gui=none guifg=#9AA83A
]]

-- Comments
vim.cmd [[
  highlight Comment guifg=#525252
]]

-- Types
vim.cmd [[
  highlight Type guifg=#931600
]]

-- Delimiters (e.g., brackets, braces, parentheses)
vim.cmd [[
  highlight Delimiter guifg=#931600
]]

-- 
vim.cmd [[
  highlight Delimiter guifg=#931600
]]

vim.cmd [[
  highlight Boolean guifg=#408080
]]

vim.cmd [[
  highlight Label guifg=#9CDCFE
]]

vim.cmd [[
  highlight Special guifg=#9CDCFE
]]
vim.cmd [[
  highlight StorageClass guifg=#676867
]]
-- vim.cmd [[
--   highlight Constant guifg=#C7444A
-- ]]
vim.cmd [[
  highlight Include guifg=#9872A2
]]

-- Set a custom background color
vim.api.nvim_set_hl(0, 'Normal', { bg = '#1e1e1e', fg = '#ffffff' })

--custom highlight group
-- Define a custom color for braces
vim.api.nvim_set_hl(0, 'Other', { fg = '#676867' })  -- Replace with your desired color
vim.api.nvim_set_hl(0, 'Field', { fg = '#9CDCFE' })  -- Replace with your desired color
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#9CDCFE' })  -- Replace with your desired color
vim.api.nvim_set_hl(0, 'Argument', { fg = '#078448', italic = true })  -- Replace with your desired color
vim.api.nvim_set_hl(0, 'Interface', { fg = '#53b20b' })  -- Replace with your desired color
vim.api.nvim_set_hl(0, 'HtmlAttribute', { fg = '#D0B344' })  -- Replace with your desired color
vim.api.nvim_set_hl(0, 'HtmlTag', { fg = '#569CD6' })  -- Replace with your desired color
vim.api.nvim_set_hl(0, 'ScssString', { fg = '#C7444A' })  -- Replace with your desired color
vim.api.nvim_set_hl(0, 'BuiltIn', { fg = '#EE8BA8' })  -- Replace with your desired color

vim.api.nvim_set_hl(0, 'Type', { fg = '#4EC9B0' })  -- Replace with your desired color
vim.api.nvim_set_hl(0, 'Enum', { fg = '#FFC85A' })  -- Replace with your desired color

vim.api.nvim_set_hl(0, 'typescriptBraces', { link = 'Other' })
vim.api.nvim_set_hl(0, 'javaScriptBraces', { link = 'Other' })
vim.api.nvim_set_hl(0, 'javaScriptParens', { link = 'Other' })
vim.api.nvim_set_hl(0, 'javaScriptEmbed', { link = 'HtmlTag' })
vim.api.nvim_set_hl(0, 'typescriptAssign', { link = 'Other' })
vim.api.nvim_set_hl(0, 'typescriptObjectLiteral', { link = 'Other' })
vim.api.nvim_set_hl(0, 'typescriptObjectColon', { link = 'Other' })
vim.api.nvim_set_hl(0, 'typescriptBlock', { link = 'Other' })
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly.vue', { link = 'Field'})
vim.api.nvim_set_hl(0, '@lsp.type.parameter.vue', { link = 'Argument'})
vim.api.nvim_set_hl(0, 'htmlTagName', { link = 'HtmlTag'})
vim.api.nvim_set_hl(0, 'htmlH3', { link = 'Other'})
vim.api.nvim_set_hl(0, 'htmlTagN', { link = 'Other'})
-- vim.api.nvim_set_hl(0, 'HtmlTag', { link = 'Other'})
vim.api.nvim_set_hl(0, 'htmlEndTag', { link = 'Other'})
vim.api.nvim_set_hl(0, 'htmlArg', { link = 'HtmlAttribute'})
vim.api.nvim_set_hl(0, 'cssClassName', { link = 'HtmlAttribute'})
vim.api.nvim_set_hl(0, 'cssClassNameDot', { link = 'HtmlAttribute'})
vim.api.nvim_set_hl(0, 'cssBraces', { link = 'HtmlAttribute'})
vim.api.nvim_set_hl(0, 'cssNoise', { link = 'Number'})
vim.api.nvim_set_hl(0, '@lsp.type.interface', { link = 'Interface'})
vim.api.nvim_set_hl(0, '@tag.attribute.vue', { link = 'HtmlAttribute'})
vim.api.nvim_set_hl(0, '@punctuation.delimiter.typescript', { link = 'Other'})
vim.api.nvim_set_hl(0, '@punctuation.delimiter.javascript', { link = 'Other'})
vim.api.nvim_set_hl(0, '@tag.vue', { link = 'HtmlTag'})
vim.api.nvim_set_hl(0, '@keyword.return.typescript', { link = 'Keyword'})
vim.api.nvim_set_hl(0, '@keyword.operator.typescript', { link = 'Keyword'})
vim.api.nvim_set_hl(0, '@keyword.operator.javascript', { link = 'Other'})
vim.api.nvim_set_hl(0, '@punctuation.special.vue', { link = 'Other'})
vim.api.nvim_set_hl(0, '@punctuation.delimiter.scss', { link = 'Other'})

vim.api.nvim_set_hl(0, '@punctuation.delimiter.css', { link = 'Other'})
vim.api.nvim_set_hl(0, '@property.class.scss', { link = 'HtmlAttribute'})
vim.api.nvim_set_hl(0, '@property.class.css', { link = 'HtmlAttribute'})
vim.api.nvim_set_hl(0, '@property.scss', { link = 'Other'})
vim.api.nvim_set_hl(0, '@string.scss', { link = 'ScssString'})
vim.api.nvim_set_hl(0, '@string.css', { link = 'ScssString'})
vim.api.nvim_set_hl(0, '@property.css', { link = 'Other'})
vim.api.nvim_set_hl(0, '@string.plain.css', { link = 'ScssString'})

vim.api.nvim_set_hl(0, '@type.tag.scss', { link = 'HtmlAttribute'})
vim.api.nvim_set_hl(0, '@punctuation.bracket.scss', { link = 'Other'})
vim.api.nvim_set_hl(0, '@punctuation.bracket.css', { link = 'Other'})
vim.api.nvim_set_hl(0, '@number.css', { link = 'Number'})
vim.api.nvim_set_hl(0, '@punctuation.bracket.typescript', { link = 'Other'})
vim.api.nvim_set_hl(0, '@punctuation.bracket.javascript', { link = 'Other'})
vim.api.nvim_set_hl(0, '@operator.typescript', { link = 'Other'})
vim.api.nvim_set_hl(0, '@operator.javascript', { link = 'Other'})
vim.api.nvim_set_hl(0, '@operator.vue', { link = 'HtmlAttribute'})
vim.api.nvim_set_hl(0, '@tag.delimiter.vue', { link = 'Other'})
vim.api.nvim_set_hl(0, '@variable.scss', { link = 'Identifier'})
vim.api.nvim_set_hl(0, '@variable.javascript', { link = 'Identifier'})
vim.api.nvim_set_hl(0, '@string.special.url.vue', { link = 'String'})
vim.api.nvim_set_hl(0, '@constant.builtin.typescript', { link = 'Boolean'})
vim.api.nvim_set_hl(0, '@type.builtin.typescript', { link = 'Type'})
vim.api.nvim_set_hl(0, '@lsp.typemod.class.defaultLibrary.vue', { link = 'BuiltIn'})

vim.api.nvim_set_hl(0, '@lsp.type.enum.vue', { link = 'Enum'})
vim.api.nvim_set_hl(0, '@lsp.type.enumMember.vue', { link = 'Identifier'})
