# This is my Neovim setup

The idea here is to structure all the plugins in an easily maintainable way

To add a new plugin, simply create a folder in `nvim/lua/plugins/` directory
and add an `init.lua` file that houses your setup for said plugin and it will
be loaded automatically.

plugin structure example `nvim/lua/genzade/plugins/my_plugin/init.lua`;

```lua
local config = function()
  -- cofig goes here
end

return { "author/my_plugin.nvim", config = config }
```

```bash
nvim
├── init.lua                   # this is the entry point
└── lua
    └── genzade                # my username namespace (you should use your own)
        ├── core
        │   ├── autocmds
        │   │   └── init.lua       # place your autocommands here
        │   ├── globals
        │   │   └── init.lua       # place config global variables here
        │   ├── keymaps
        │   │   └── init.lua       # place your general keymappings here
        │   ├── settings
        │   │   └── init.lua       # place your settings here
        │   └── init.lua           # this is where all core modules are loaded
        ├── packer
        │   └── init.lua           # this is where all plugins are loaded
        └── plugins
            └── nvim_tree          # define plugins like this
                └── init.lua       # all plugins configs in an init.lua file
```
