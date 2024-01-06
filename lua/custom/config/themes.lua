---@diagnostic disable: assign-type-mismatch

local M = {}
local themes = {}
local thememap = { name = '[T]heme' }

local function write_theme(id)
  local file = io.open(os.getenv 'HOME' .. '/.config/nvim/.theme', 'w')
  if file ~= nil then
    file:write(id)
    file:close()
  end
end

local function random_theme(subthemes)
  math.randomseed(os.time())
  local random = math.random(#subthemes)

  local i = 1
  for _, theme in pairs(subthemes) do
    if i > #subthemes then
      return
    end

    if i == random then
      return theme
    else
      i = i + 1
    end
  end
end

function M.read()
  local file = io.open(os.getenv 'HOME' .. '/.config/nvim/.theme', 'r')
  if file then
    local id = file:read()
    file:close()

    for _, theme in pairs(themes) do
      if theme.id == id then
        return theme
      end
    end
  end

  return themes[#themes]
end

function M.set(theme)
  vim.opt.background = theme.mode or 'dark'
  vim.opt.termguicolors = theme.termguicolors or false
  theme.command()

  write_theme(theme.id)
  vim.notify('Theme set to ' .. theme.name)
end

-- light themes
themes[#themes + 1] = {
  name = 'OneNord',
  id = 'onenord-light',
  mode = 'light',
  termguicolors = true,
  command = function()
    require('onenord').setup()
  end,
}

-- dark themes
themes[#themes + 1] = {
  name = 'Sonokai Andromeda',
  id = 'sonokai_andromeda',
  mode = 'dark',
  termguicolors = true,
  command = function()
    vim.g.sonokai_style = 'andromeda' -- default, atlantis, andromeda, shusia, maia, espresso
    vim.g.sonokai_better_performance = 1
    vim.cmd.colorscheme 'sonokai'
  end,
}

themes[#themes + 1] = {
  name = 'Sonokai Shusia',
  id = 'sonokai_shusia',
  mode = 'dark',
  termguicolors = true,
  command = function()
    vim.g.sonokai_style = 'shusia' -- default, atlantis, andromeda, shusia, maia, espresso
    vim.g.sonokai_better_performance = 1
    vim.cmd.colorscheme 'sonokai'
  end,
}

themes[#themes + 1] = {
  name = 'Kanagawa Wave',
  id = 'kangawa_wave',
  mode = 'dark',
  termguicolors = true,
  command = function()
    vim.cmd.colorscheme 'kanagawa-wave'
  end,
}

themes[#themes + 1] = {
  name = 'Kanagawa Dragon',
  id = 'kangawa_dragon',
  mode = 'dark',
  termguicolors = true,
  command = function()
    vim.cmd.colorscheme 'kanagawa-dragon'
  end,
}

themes[#themes + 1] = {
  name = 'Oh My Monokai',
  id = 'oh-my-monokai',
  mode = 'dark',
  termguicolors = true,
  command = function()
    vim.cmd.colorscheme 'oh-my-monokai'
  end,
}

themes[#themes + 1] = {
  name = 'Melange',
  id = 'melange',
  mode = 'dark',
  termguicolors = true,
  command = function()
    vim.cmd.colorscheme 'melange'
  end,
}

themes[#themes + 1] = {
  name = 'OneDark Darker',
  id = 'onedark-darker',
  mode = 'dark',
  termguicolors = true,
  command = function()
    require('onedark').setup {
      style = 'darker',
    }
    require('onedark').load()
  end,
}

themes[#themes + 1] = {
  name = 'OneDark Warmer',
  id = 'onedark-warmer',
  mode = 'dark',
  termguicolors = true,
  command = function()
    require('onedark').setup {
      style = 'warmer',
    }
    require('onedark').load()
  end,
}

themes[#themes + 1] = {
  name = 'Citruszest',
  id = 'citruszest',
  mode = 'dark',
  termguicolors = true,
  command = function()
    vim.cmd.colorscheme 'citruszest'
  end,
}

themes[#themes + 1] = {
  name = 'Sweetie',
  id = 'sweetie',
  mode = 'dark',
  termguicolors = true,
  command = function()
    vim.cmd.colorscheme 'sweetie'
  end,
}

themes[#themes + 1] = {
  name = 'Oxocarbon',
  id = 'oxocarbon-light',
  mode = 'dark',
  termguicolors = true,
  command = function()
    vim.cmd.colorscheme 'oxocarbon'
    -- require('onedark').load()
  end,
}

local binds = '123456789abcdefghijklmnopqrstuvwxyz'
local i = 1
local light_themes = {}
local dark_themes = {}

thememap[binds:sub(i, i)] = {
  function()
    M.set(random_theme(light_themes))
  end,
  'LIGHT THEMES',
}
i = i + 1

for _, theme in pairs(themes) do
  if theme.mode == 'light' then
    thememap[binds:sub(i, i)] = {
      function()
        M.set(theme)
      end,
      theme.name,
    }
    light_themes[#light_themes + 1] = theme

    i = i + 1
  end
end

while i % 4 ~= 1 do
  thememap[binds:sub(i, i)] = { function() end, '' }
  i = i + 1
end

thememap[binds:sub(i, i)] = {
  function()
    M.set(random_theme(dark_themes))
  end,
  'DARK THEMES',
}
i = i + 1

for _, theme in pairs(themes) do
  if theme.mode == 'dark' then
    thememap[binds:sub(i, i)] = {
      function()
        M.set(theme)
      end,
      theme.name,
    }
    dark_themes[#dark_themes + 1] = theme

    i = i + 1
  end
end

require('which-key').register(thememap, { prefix = '<leader>t' })

return M
