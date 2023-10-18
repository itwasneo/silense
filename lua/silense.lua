local cmd = vim.cmd
local fn = vim.fn
local set_hl = vim.api.nvim_set_hl

-- Options
local defaults = {
    comment_italics = true,
}

local M = {}

function M.setup(opts)
    if not opts then
        opts = {}
    end

    for k, v in pairs(defaults) do
        if opts[k] == nil then
            opts[k] = v
        end
    end

    if vim.g.colors_name then
        cmd("hi clear")
    end

    if fn.exists("syntax_on") then
        cmd("syntax reset")
    end

    vim.g.colors_name = "silense"

    -- Background
    local base03 = "#585858"
    local base02 = "#444444"
    local base01 = "#262626"
    local base00 = "#080808"

    -- Text
    local base3 = "#005f00"
    local base2 = "#626262"
    local base1 = "#9e9e9e"
    local base0 = "#bcbcbc"

    -- Misc
    local yellow = "#d7af00"
    local red = "#d70000"
    local green = "#afd75f"
    local blue = "#87afff"

    set_hl(0, "Error", { fg = red })
    set_hl(0, "Warning", { fg = yellow })
    set_hl(0, "Information", { fg = blue })
    set_hl(0, "Hint", { fg = green })

    local bg_color = base00

    set_hl(0, "Normal", { fg = base0, bg = bg_color })
    set_hl(0, "NormalFloat", { fg = base0, bg = bg_color })
    set_hl(0, "NormalNC", { fg = base0, bg = bg_color })
    -- Group.new("NormalNC", colors.base0:dark(), bg_color)

    set_hl(0, "Comment", { fg = base02, italic = opts.comment_italics or false })
    set_hl(0, "Constant", { fg = base0 })

    -- Git
    set_hl(0, "DiffAdd", { fg = green, bg = base00, bold = true, sp = green })
    set_hl(0, "DiffChange", { fg = yellow, bg = base00, bold = true, sp = yellow })
    set_hl(0, "DiffDelete", { fg = red, bg = base00, bold = true })
    set_hl(0, "DiffText", { fg = blue, bg = base00, bold = true, sp = blue })
    set_hl(0, "GitGutterAdd", { fg = green })
    set_hl(0, "GitGutterChange", { fg = yellow })
    set_hl(0, "GitGutterDelete", { fg = red })
    set_hl(0, "GitGutterChangeDelete", { fg = red })
    set_hl(0, "GitSignsAddLn", { fg = green })
    set_hl(0, "GitSignsAddNr", { fg = green })
    set_hl(0, "GitSignsChangeLn", { fg = yellow })
    set_hl(0, "GitSignsChangeNr", { fg = yellow })
    set_hl(0, "GitSignsDeleteLn", { fg = red })
    set_hl(0, "GitSignsDeleteNr", { fg = red })
    set_hl(0, "GitSignsCurrentLineBlame", { link = "Comment" })

    set_hl(0, "Directory", { fg = base0 })
    set_hl(0, "ErrorMsg", { fg = red, reverse = true })
    set_hl(0, "FloatBorder", { fg = base0 })
    set_hl(0, "Folded", { fg = base0, bold = true, sp = base3 })
    set_hl(0, "FoldColumn", { fg = base0 })
    set_hl(0, "Function", { fg = base0 })
    set_hl(0, "Ignore", {})
    set_hl(0, "Identifier", { fg = base0 })
    set_hl(0, "IncSearch", { fg = yellow, standout = true })
    set_hl(0, "MatchParen", { fg = base02, bg = yellow, bold = true })
    set_hl(0, "MoreMsg", { fg = blue })
    set_hl(0, "ModeMsg", { fg = blue })
    set_hl(0, "NonText", { fg = base0, bold = true })
    set_hl(0, "PreProc", { fg = red })

    -- Pop up Menu
    set_hl(0, "Pmenu", { link = "Normal", bg = base00 })               -- popup menu normal item
    set_hl(0, "PmenuSel", { fg = base01, bg = base0, reverse = true }) -- selected item
    set_hl(0, "PmenuSbar", { fg = base01, reverse = true })
    set_hl(0, "PmenuThumb", { fg = base0, reverse = true })

    set_hl(0, "Question", { fg = red, bold = true })
    set_hl(0, "Search", { fg = yellow, reverse = true })
    set_hl(0, "Statement", { fg = yellow })
    set_hl(0, "Special", { fg = base2 })
    set_hl(0, "SpecialKey", { fg = base00, bg = base01, bold = true })

    -- Cursor and Line
    set_hl(0, "LineNr", { fg = base02, bg = bg_color })
    set_hl(0, "CursorLine", { bg = base01, sp = base1 })
    set_hl(0, "CursorLineNr", { fg = base1, bold = true })
    set_hl(0, "ColorColumn", { bg = base01 })
    set_hl(0, "Cursor", { fg = base03, bg = base0 })
    set_hl(0, "lCursor", { link = "Cursor" })
    set_hl(0, "TermCursor", { link = "Cursor" })
    set_hl(0, "TermCursorNC", { fg = base03, bg = base01 })

    -- Spelling
    set_hl(0, "SpellBad", { undercurl = true, sp = red })
    set_hl(0, "SpellCap", { undercurl = true, sp = red })
    set_hl(0, "SpellRare", { undercurl = true, sp = blue })
    set_hl(0, "SpellLocal", { undercurl = true, sp = yellow })

    -- Status Line
    set_hl(0, "StatusLine", { bg = bg_color, fg = green, reverse = true })
    set_hl(0, "StatusLineNC", { bg = bg_color, fg = base2, reverse = true })

    set_hl(0, "Strikethrough", { fg = base0, strikethrough = true })

    -- Tab line
    set_hl(0, "TabLine", { fg = base0, bg = bg_color, italic = true, sp = base0 })
    set_hl(0, "TabLineFill", { fg = base0, bg = bg_color })
    set_hl(0, "TabLineSel", { fg = green, bg = bg_color })

    set_hl(0, "Text", { fg = base3 })
    set_hl(0, "Title", { fg = green, bold = true })
    set_hl(0, "Todo", { fg = yellow, bold = true })
    set_hl(0, "Type", { fg = base0 })
    set_hl(0, "Underlined", { fg = base0 })
    set_hl(0, "VertSplit", { bg = bg_color })
    set_hl(0, "Visual", { bg = bg_color, fg = blue, reverse = true })
    set_hl(0, "VisualNOS", { fg = base02, reverse = true })
    set_hl(0, "WarningMsg", { fg = yellow, bold = true })
    set_hl(0, "WildMenu", { fg = base2, bg = base02, reverse = true })

    -- Cmp
    set_hl(0, "CmpItemKind", { fg = green })
    set_hl(0, "CmpItemMenu", { link = "NormalNC" })
    set_hl(0, "CmpItemKindText", { fg = base3 })
    set_hl(0, "CmpItemKindMethod", { fg = green })
    set_hl(0, "CmpItemKindFunction", { fg = blue })
    set_hl(0, "CmpItemKindConstructor", { fg = red })
    set_hl(0, "CmpItemKindField", { fg = yellow })
    set_hl(0, "CmpItemKindVariable", { fg = red })
    set_hl(0, "CmpitemKindClass", { fg = yellow })
    set_hl(0, "CmpItemKindInterface", { fg = yellow })
    set_hl(0, "CmpItemKindModule", { fg = green })
    set_hl(0, "CmpItemKindProperty", { fg = green })
    set_hl(0, "CmpItemKindUnit", { fg = red })
    set_hl(0, "CmpItemKindValue", { fg = blue })
    set_hl(0, "CmpItemKindEnum", { fg = yellow })
    set_hl(0, "CmpItemKindKeyword", { fg = green })
    set_hl(0, "CmpItemKindSnippet", { fg = blue })
    set_hl(0, "CmpItemKindColor", { fg = blue })
    set_hl(0, "CmpItemKindFile", { fg = blue })
    set_hl(0, "CmpItemKindReference", { fg = blue })
    set_hl(0, "CmpItemKindFolder", { fg = blue })
    set_hl(0, "CmpItemKindEnumMember", { fg = blue })
    set_hl(0, "CmpItemKindConstant", { fg = blue })
    set_hl(0, "CmpItemKindStruct", { fg = yellow })
    set_hl(0, "CmpItemKindEvent", { fg = red })
    set_hl(0, "CmpItemKindOperator", { fg = blue })
    set_hl(0, "CmpItemKindTypeParameter", { fg = red })

    set_hl(0, "Boolean", { link = "Constant" })
    set_hl(0, "Character", { link = "Text" })
    set_hl(0, "Conditional", { link = "Statement" })
    set_hl(0, "Debug", { link = "Special" })
    set_hl(0, "Define", { link = "PreProc" })
    set_hl(0, "Include", { link = "Preproc" })
    set_hl(0, "Delimiter", { link = "Special" })
    set_hl(0, "Exception", { link = "Statement" })
    set_hl(0, "Float", { link = "Constant" })
    set_hl(0, "Keyword", { link = "Statement" })
    set_hl(0, "Label", { link = "Statement" })
    set_hl(0, "Macro", { link = "Statement" })
    set_hl(0, "Number", { link = "Constant" })
    set_hl(0, "Operator", { link = "Special" })
    set_hl(0, "Repeat", { link = "Statement" })
    set_hl(0, "StorageClass", { link = "Type" })
    set_hl(0, "SpecialChar", { link = "Special" })
    set_hl(0, "String", { link = "Text" })
    set_hl(0, "Typedef", { link = "Type" })

    -- TreeSitter
    set_hl(0, "TSBoolean", { link = "Constant" })
    set_hl(0, "TSCharacter", { link = "Constant" })
    set_hl(0, "TSComment", { link = "Comment" })
    set_hl(0, "TSConditional", { link = "Conditional" })
    set_hl(0, "TSConstant", { link = "Constant" })
    set_hl(0, "TSConstBuiltin", { link = "Constant" })
    set_hl(0, "TSConstMacro", { link = "Constant" })
    set_hl(0, "TSError", { link = "Error" })
    set_hl(0, "TSException", { link = "Exception" })
    set_hl(0, "TSField", { link = "Identifier" })
    set_hl(0, "TSFloat", { link = "Constant" })
    set_hl(0, "TSFunction", { link = "Function" })
    set_hl(0, "TSFuncBuiltin", { link = "Function" })
    set_hl(0, "TSFuncMacro", { link = "Function" })
    set_hl(0, "TSInclude", { link = "Include" })
    set_hl(0, "TSKeyword", { link = "Keyword" })
    set_hl(0, "TSLabel", { link = "Statement" })
    set_hl(0, "TSMethod", { link = "Function" })
    set_hl(0, "TSNamespace", { link = "Identifier" })
    set_hl(0, "TSNumber", { link = "Constant" })
    set_hl(0, "TSOperator", { link = "Operator" })
    set_hl(0, "TSParameterReference", { link = "Identifier" })
    set_hl(0, "TSProperty", { link = "TSField" })
    set_hl(0, "TSPunctDelimiter", { link = "Delimiter" })
    set_hl(0, "TSPunctBracket", { link = "Delimiter" })
    set_hl(0, "TSPunctSpecial", { link = "Special" })
    set_hl(0, "TSRepeat", { link = "Repeat" })
    set_hl(0, "TSString", { link = "Constant" })
    set_hl(0, "TSStringRegex", { link = "Constant" })
    set_hl(0, "TSStringEscape", { link = "Constant" })
    set_hl(0, "TSStrong", { fg = base1, bold = true })
    set_hl(0, "TSConstructor", { link = "Function" })
    set_hl(0, "TSKeywordFunction", { link = "Identifier" })
    set_hl(0, "TSLiteral", { link = "Normal" })
    set_hl(0, "TSParameter", { link = "Identifier" })
    set_hl(0, "TSVariable", { link = "Normal" })
    set_hl(0, "TSVariableBuiltin", { link = "Identifier" })
    set_hl(0, "TSTag", { link = "Special" })
    set_hl(0, "TSTagDelimiter", { link = "Delimiter" })
    set_hl(0, "TSTitle", { link = "Title" })
    set_hl(0, "TSType", { link = "Type" })
    set_hl(0, "TSTypeBuiltin", { link = "Type" })

    -- Telescope
    set_hl(0, "TelescopeMatching", { fg = red })
    set_hl(0, "TelescopeBorder", { fg = base0 })            -- float border not quite dark enough, maybe that needs to change?
    set_hl(0, "TelescopePromptBorder", { fg = base0 })      -- active border lighter for clarity
    set_hl(0, "TelescopeTitle", { link = "Normal" })        -- separate them from the border a little, but not make them pop
    set_hl(0, "TelescopePromptPrefix", { link = "Normal" }) -- default is groups.Identifier
    set_hl(0, "TelescopeSelection", { link = "Normal" })
    set_hl(0, "TelescopeSelectionCaret", { fg = yellow })

    -- Diagnostics
    set_hl(0, "DiagnosticError", { link = "Error" })
    set_hl(0, "DiagnosticWarn", { fg = yellow })
    set_hl(0, "DiagnosticInfo", { fg = blue })
    set_hl(0, "DiagnosticHint", { fg = green })
    set_hl(0, "DiagnosticUnderlineError", { fg = red })
    set_hl(0, "DiagnosticUnderlineWarn", { fg = red })
    set_hl(0, "DiagnosticUnderlineInfo", { fg = red })
    set_hl(0, "DiagnosticUnderlineHint", { fg = red })
    set_hl(0, "DiagnosticVirtualTextHint", { fg = base02 })
    set_hl(0, "DiagnosticUnnecessary", { fg = base02 })
    set_hl(0, "DiagnosticTextWarn", { link = "WarningMsg" })
end

return M
