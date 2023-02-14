local luasnip = require("luasnip")

local s = luasnip.snippet
local f = luasnip.function_node
local fmt = require("luasnip.extras.fmt").fmt

local function filename(snip)
	return snip.env.TM_FILENAME_BASE:gsub("^%l", string.upper)
end

return {
	s(
		{
			trig = "rtc",
			name = "React Component",
			dscr = "React TypeScript Component with style imported",
		},
		fmt(
			[[
    import Style from "@/styles/[file].module.scss";

    interface [file]Props { }

    const [file] = ({ }: [file]Props): JSX.Element => {
      return <div></div>;
    };

    export default [file];
  ]],
			{
				file = f(function(_, snip)
					return filename(snip)
				end),
			},
			{
				delimiters = "[]",
			}
		)
	),
	s(
		{
			trig = "ntp",
			name = "Next Page",
			dscr = "Next TypeScript Page with style imported",
		},
		fmt(
			[[
    import type { NextPage } from "next";

    import Style from "@/styles/[file].module.scss";

    interface [file]Props { }

    const [file]: NextPage<[file]Props> = (): JSX.Element => {
      return <div></div>;
    };

    export default [file];
  ]],
			{
				file = f(function(_, snip)
					return filename(snip)
				end),
			},
			{
				delimiters = "[]",
			}
		)
	),
}
