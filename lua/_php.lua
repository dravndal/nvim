local ls =  require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)
vim.keymap.set({ "i", "s" }, "<C-h>", function()
  if ls.choice_active() then
 ls.change_choice(-1)
 end
end)

-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.conditions")
-- local conds_expand = require("luasnip.extras.conditions.expand")
-- --
-- -- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- -- placeholder 2,...
-- local function copy(args)
-- 	return args[1]
-- end
--
-- local function phpGetter()
--     local nameBlock = vim.fn.expand("<cword>"),
-- end
--
-- ls.add_snippets("php", {
-- 	s("getter", {
--         t({"/**", "* "}),
--         i(1, "Comment"),
--         t({"", "*", "* @return "}),
--         i(2, "returntype"),
--         t({"","*/", ""}),
-- 		i(3),
--         c(3, {
--             t("protected "),
--             t("public "),
--             t("private ")
--         }),
--         t("function "),
-- 		-- Placeholder/Insert.
-- 		i(4),
-- 		t("(): "),
--         f(copy, 2),
--         t({" {", "\t"}),
-- 		-- Last Placeholder, exit Point of the snippet.
-- 		i(0),
-- 		t({ "", "}" }),
-- 	}),
-- })
