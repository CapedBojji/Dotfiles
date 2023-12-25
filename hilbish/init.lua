-- Default Hilbish config
local lunacolors = require("lunacolors")
local bait = require("bait")
local ansikit = require("ansikit")
local hilbish = require("hilbish")
--local commander = require("commander")

local function doPrompt(fail)
	hilbish.prompt(lunacolors.format("{blue}%u {cyan}%d " .. (fail and "{red}" or "{green}") .. "∆ "))
end

doPrompt()

bait.catch("command.exit", function(code)
	doPrompt(code ~= 0)
end)

bait.catch("hilbish.vimMode", function(mode)
	if mode ~= "insert" then
		ansikit.cursorStyle(ansikit.blockCursor)
	else
		ansikit.cursorStyle(ansikit.lineCursor)
	end
end)
-- Set Variables
-- hilbish.run("set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket", false)

-- Set Aliases
-- hilbish.aliases.add("firefox-dev", "nohup firefox-developer-edition &")
--hilbish.aliases.add("firefox", "nohup firefox &")
--hilbish.aliases.add("discord", "nohup flatpak run xyz.armcord.ArmCord &")
--
---- stringify
--local function val_to_str(v)
--if "string" == type(v) then
--v = string.gsub(v, "\n", "\\n")
--if string.match(string.gsub(v, "[^'\"]", ""), '^"+$') then
--return "'" .. v .. "'"
--end
--return '"' .. string.gsub(v, '"', '\\"') .. '"'
--else
--return "table" == type(v) and table.stringify(v) or tostring(v)
--end
--end
--
--local function key_to_str(k)
--if "string" == type(k) and string.match(k, "^[_%a][_%a%d]*$") then
--return k
--else
--return "[" .. val_to_str(k) .. "]"
--end
--end
--
--table.stringify = function(tbl)
--local result, done = {}, {}
--for k, v in ipairs(tbl) do
--table.insert(result, val_to_str(v))
--done[k] = true
--end
--for k, v in pairs(tbl) do
--if not done[k] then
--table.insert(result, key_to_str(k) .. "=" .. val_to_str(v))
--end
--end
--return "{" .. table.concat(result, ",") .. "}"
--end

-- Custom Commands
-- commander.register("robloxstudio", function(args, sinks)
--	if #args == 0 then
--		hilbish.run("nohup vinegar --config ~/.config/vinegar/config-studio.toml studio > /dev/null 2>&1 &")
--	else
--		hilbish.run(
--			string.format(
--				"nohup vinegar --config ~/.config/vinegar/config-studio.toml studio -editPlacefile %s > /dev/null 2>&1",
--				args[1]
--			),
--			false
--		)
--	end
-- end)
