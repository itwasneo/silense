local cmd = vim.cmd
local fn = vim.fn
local cb = require("colorbuddy.init")
local api = vim.api

-- Options
local defaults = {
    comment_italics = true,
}

local M = {
    Color = cb.Color,
    colors = cb.colors,
    Group = cb.Group,
    groups = cb.groups,
    styles = cb.styles,
}

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

    local Color = M.Color
    local colors = M.colors
    local Group = M.Group
    local groups = M.groups
    local styles = M.styles

    local base03 = "#585858"
    local base02 = "#444444"
    local base01 = "#262626"
    local base00 = "#080808"

    local base3 = "#005f00"
    local base2 = "#626262"
    local base1 = "#9e9e9e"
    local base0 = "#bcbcbc"

    local yellow = "#d7af00"
    local red = "#d70000"
    local green = "#afd75f"
    local blue = "#87afff"

    api.set_hl(0, "Error", { fg = red })
    api.set_hl(0, "Warning", { fg = yellow })
    api.set_hl(0, "Information", { fg = blue })
    api.set_hl(0, "Hint", { fg = green })

    -- Background
    Color.new("base03", "#585858")
    Color.new("base02", "#444444")
    Color.new("base01", "#262626")
    Color.new("base00", "#080808")

    -- Text
    Color.new("base3", "#005f00")
    Color.new("base2", "#626262")
    Color.new("base1", "#9e9e9e")
    Color.new("base0", "#bcbcbc")

    -- Misc
    Color.new("yellow", "#d7af00")
    Color.new("red", "#d70000")
    Color.new("green", "#afd75f")
    Color.new("blue", "#87afff")

    -- Group.new("Error", colors.red)
    -- Group.new("Warning", colors.yellow)
    -- Group.new("Information", colors.blue)
    -- Group.new("Hint", colors.green)

    local bg_color = colors.base00

    Group.new("Normal", colors.base0, bg_color)
    Group.new("NormalFloat", colors.base0, bg_color)
    Group.new("NormalNC", colors.base0:dark(), bg_color)

    Group.new("Comment", colors.base02, colors.none, opts.comment_italics and styles.italic or styles.NONE)
    Group.new("Constant", colors.base1)

    -- Git
    Group.new("DiffAdd", colors.green, colors.base00, styles.bold, colors.green)
    Group.new("DiffChange", colors.yellow, colors.base00, styles.bold, colors.yellow)
    Group.new("DiffDelete", colors.red, colors.base00, styles.bold)
    Group.new("DiffText", colors.blue, colors.base00, styles.bold, colors.blue)
    Group.new("GitGutterAdd", colors.green)
    Group.new("GitGutterChange", colors.yellow)
    Group.new("GitGutterDelete", colors.red)
    Group.new("GitGutterChangeDelete", colors.red)
    Group.new("GitSignsAddLn", colors.green)
    Group.new("GitSignsAddNr", colors.green)
    Group.new("GitSignsChangeLn", colors.yellow)
    Group.new("GitSignsChangeNr", colors.yellow)
    Group.new("GitSignsDeleteLn", colors.red)
    Group.new("GitSignsDeleteNr", colors.red)
    Group.link("GitSignsCurrentLineBlame", groups.Comment)

    Group.new("Directory", colors.base0)
    Group.new("ErrorMsg", colors.red, colors.none, styles.reverse)
    Group.new("FloatBorder", colors.base01)
    Group.new("Folded", colors.base0, colors.base01, styles.bold, colors.base3)
    Group.new("FoldColumn", colors.base0, colors.none, styles.NONE)
    Group.new("Function", colors.base0)
    Group.new("Ignore", colors.none)
    Group.new("Identifier", colors.base0)
    Group.new("IncSearch", colors.yellow, colors.none, styles.standout)
    Group.new("MatchParen", colors.yellow, colors.base02, styles.bold)
    Group.new("MoreMsg", colors.blue, colors.none, styles.NONE)
    Group.new("ModeMsg", colors.blue, colors.none, styles.NONE)
    Group.new("NonText", colors.base0, colors.none, styles.bold)
    Group.new("PreProc", colors.base3)

    -- Pop up Menu
    Group.new("Pmenu", groups.Normal, colors.base00, styles.none)      -- popup menu normal item
    Group.new("PmenuSel", colors.base01, colors.base0, styles.reverse) -- selected item
    Group.new("PmenuSbar", colors.base01, colors.none, styles.reverse)
    Group.new("PmenuThumb", colors.base0, colors.none, styles.reverse)

    Group.new("Question", colors.red, colors.none, styles.bold)
    Group.new("Search", colors.yellow, colors.none, styles.reverse)
    Group.new("Statement", colors.yellow)
    Group.new("Special", colors.base2)
    Group.new("SpecialKey", colors.base00, colors.base01, styles.bold)

    -- Cursor and Line
    Group.new("LineNr", colors.base02, bg_color, styles.NONE)
    Group.new("CursorLine", colors.none, colors.base01, styles.NONE, colors.base1)
    Group.new("CursorLineNr", colors.none, colors.none, styles.bold, colors.base1)
    Group.new("ColorColumn", colors.none, colors.base01, styles.NONE)
    Group.new("Cursor", colors.base03, colors.base0, styles.NONE)
    Group.link("lCursor", groups.Cursor)
    Group.link("TermCursor", groups.Cursor)
    Group.new("TermCursorNC", colors.base03, colors.base01)

    -- Spelling
    Group.new("SpellBad", colors.none, colors.none, styles.undercurl, colors.red)
    Group.new("SpellCap", colors.none, colors.none, styles.undercurl, colors.red)
    Group.new("SpellRare", colors.none, colors.none, styles.undercurl, colors.blue)
    Group.new("SpellLocal", colors.none, colors.none, styles.undercurl, colors.yellow)

    -- Status Line
    Group.new("StatusLine", colors.base00, colors.green, styles.reverse)
    Group.new("StatusLineNC", colors.base00, colors.base2, styles.reverse)

    Group.new("Strikethrough", colors.base0, colors.none, styles.strikethrough)

    -- Tab line
    Group.new("TabLine", colors.base0, colors.base00, styles.italic, colors.base0)
    Group.new("TabLineFill", colors.base0, colors.base00)
    Group.new("TabLineSel", colors.green, bg_color)

    Group.new("Text", colors.base3)
    Group.new("Title", colors.green, colors.none, styles.bold)
    Group.new("Todo", colors.yellow, colors.none, styles.bold)
    Group.new("Type", colors.base0)
    Group.new("Underlined", colors.base0)
    Group.new("VertSplit", colors.base00, colors.none, styles.NONE)
    Group.new("Visual", colors.base00, colors.blue, styles.reverse)
    Group.new("VisualNOS", colors.none, colors.base02, styles.reverse)
    Group.new("WarningMsg", colors.orange, colors.none, styles.bold)
    Group.new("WildMenu", colors.base2, colors.base02, styles.reverse)

    -- Cmp
    Group.new("CmpItemKind", colors.green)
    Group.new("CmpItemMenu", groups.NormalNC)
    Group.new("CmpItemKindText", colors.base3, colors.none, styles.none)
    Group.new("CmpItemKindMethod", colors.green, colors.none, styles.none)
    Group.new("CmpItemKindFunction", colors.blue, colors.none, styles.none)
    Group.new("CmpItemKindConstructor", colors.red, colors.none, styles.none)
    Group.new("CmpItemKindField", colors.yellow, colors.none, styles.none)
    Group.new("CmpItemKindVariable", colors.red, colors.none, styles.none)
    Group.new("CmpitemKindClass", colors.yellow, colors.none, styles.none)
    Group.new("CmpItemKindInterface", colors.yellow, colors.none, styles.none)
    Group.new("CmpItemKindModule", colors.green, colors.none, styles.none)
    Group.new("CmpItemKindProperty", colors.green, colors.none, styles.none)
    Group.new("CmpItemKindUnit", colors.red, colors.none, styles.none)
    Group.new("CmpItemKindValue", colors.blue, colors.none, styles.none)
    Group.new("CmpItemKindEnum", colors.yellow, colors.none, styles.none)
    Group.new("CmpItemKindKeyword", colors.green, colors.none, styles.none)
    Group.new("CmpItemKindSnippet", colors.blue, colors.none, styles.none)
    Group.new("CmpItemKindColor", colors.blue, colors.none, styles.none)
    Group.new("CmpItemKindFile", colors.blue, colors.none, styles.none)
    Group.new("CmpItemKindReference", colors.blue, colors.none, styles.none)
    Group.new("CmpItemKindFolder", colors.blue, colors.none, styles.none)
    Group.new("CmpItemKindEnumMember", colors.blue, colors.none, styles.none)
    Group.new("CmpItemKindConstant", colors.blue, colors.none, styles.none)
    Group.new("CmpItemKindStruct", colors.yellow, colors.none, styles.none)
    Group.new("CmpItemKindEvent", colors.red, colors.none, styles.none)
    Group.new("CmpItemKindOperator", colors.blue, colors.none, styles.none)
    Group.new("CmpItemKindTypeParameter", colors.red, colors.none, styles.none)

    Group.link("Boolean", groups.Constant)
    Group.link("Character", groups.Text)
    Group.link("Conditional", groups.Statement)
    Group.link("Debug", groups.Special)
    Group.link("Define", groups.PreProc)
    Group.link("Include", groups.Preproc)
    Group.link("Delimiter", groups.Special)
    Group.link("Exception", groups.Statement)
    Group.link("Float", groups.Constant)
    Group.link("Keyword", groups.Statement)
    Group.link("Label", groups.Statement)
    Group.link("Macro", groups.Statement)
    Group.link("Number", groups.Constant)
    Group.link("Operator", groups.Special)
    Group.link("Repeat", groups.Statement)
    Group.link("StorageClass", groups.Type)
    Group.link("SpecialChar", groups.Special)
    Group.link("String", groups.Text)
    Group.link("Typedef", groups.Type)

    -- TreeSitter
    Group.link("TSBoolean", groups.Constant)
    Group.link("TSCharacter", groups.Constant)
    Group.link("TSComment", groups.Comment)
    Group.link("TSConditional", groups.Conditional)
    Group.link("TSConstant", groups.Constant)
    Group.link("TSConstBuiltin", groups.Constant)
    Group.link("TSConstMacro", groups.Constant)
    Group.link("TSError", groups.Error)
    Group.link("TSException", groups.Exception)
    Group.link("TSField", groups.Identifier)
    Group.link("TSFloat", groups.Constant)
    Group.link("TSFunction", groups.Function)
    Group.link("TSFuncBuiltin", groups.Function)
    Group.link("TSFuncMacro", groups.Function)
    Group.link("TSInclude", groups.Include)
    Group.link("TSKeyword", groups.Keyword)
    Group.link("TSLabel", groups.Statement)
    Group.link("TSMethod", groups.Function)
    Group.link("TSNamespace", groups.Identifier)
    Group.link("TSNumber", groups.Constant)
    Group.link("TSOperator", groups.Operator)
    Group.link("TSParameterReference", groups.Identifier)
    Group.link("TSProperty", groups.TSField)
    Group.link("TSPunctDelimiter", groups.Delimiter)
    Group.link("TSPunctBracket", groups.Delimiter)
    Group.link("TSPunctSpecial", groups.Special)
    Group.link("TSRepeat", groups.Repeat)
    Group.link("TSString", groups.Constant)
    Group.link("TSStringRegex", groups.Constant)
    Group.link("TSStringEscape", groups.Constant)
    Group.new("TSStrong", colors.base1, colors.none, styles.bold)
    Group.link("TSConstructor", groups.Function)
    Group.link("TSKeywordFunction", groups.Identifier)
    Group.new("TSLiteral", groups.Normal)
    Group.link("TSParameter", groups.Identifier)
    Group.link("TSVariable", groups.Normal)
    Group.link("TSVariableBuiltin", groups.Identifier)
    Group.link("TSTag", groups.Special)
    Group.link("TSTagDelimiter", groups.Delimiter)
    Group.link("TSTitle", groups.Title)
    Group.link("TSType", groups.Type)
    Group.link("TSTypeBuiltin", groups.Type)

    -- Telescope
    Group.new("TelescopeMatching", colors.red, groups.Special, groups.Special, groups.Special)
    Group.new("TelescopeBorder", colors.base01)       -- float border not quite dark enough, maybe that needs to change?
    Group.new("TelescopePromptBorder", colors.base1)  -- active border lighter for clarity
    Group.new("TelescopeTitle", groups.Normal)        -- separate them from the border a little, but not make them pop
    Group.new("TelescopePromptPrefix", groups.Normal) -- default is groups.Identifier
    Group.link("TelescopeSelection", groups.Normal)
    Group.new("TelescopeSelectionCaret", colors.yellow)

    -- Diagnostics
    Group.link("DiagnosticError", groups.Error)
    Group.new("DiagnosticWarn", colors.yellow)
    Group.new("DiagnosticInfo", colors.blue)
    Group.new("DiagnosticHint", colors.green)
    Group.new("DiagnosticUnderlineError", colors.red, colors.none, styles.none)
    Group.new("DiagnosticUnderlineWarn", colors.red, colors.none, styles.none)
    Group.new("DiagnosticUnderlineInfo", colors.red, colors.none, styles.none)
    Group.new("DiagnosticUnderlineHint", colors.red, colors.none, styles.none)
    Group.new("DiagnosticVirtualTextHint", colors.base02, colors.none, styles.none)
    Group.new("DiagnosticUnnecessary", colors.base02, colors.none, styles.none)
    Group.link("DiagnosticTextWarn", groups.WarningMsg)
end

return M
