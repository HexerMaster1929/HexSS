# Loadstring 

```
local owner = "HexerMaster1929"
local branch = "stable"
local Repo = "HexSS"

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/%s/%s/%s.lua"):format(owner, Repo, branch, file)), file .. '.lua')()
end

webImport("modules/moduleloader")
webImport("init")
webImport("ui/init")
```
