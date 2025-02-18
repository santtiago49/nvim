local Terminal = require("toggleterm.terminal").Terminal

-- Ensure a global terminal instance
_G.global_term = _G.global_term or Terminal:new({ direction = "horizontal", hidden = true })

-- Function to check if a file exists
local function file_exists(filepath)
    local f = io.open(filepath, "r")
    if f then
        f:close()
        return true
    else
        return false
    end
end

-- Function to find the project root directory
local function get_project_root()
    local markers = { ".git", "package.json", "Cargo.toml", "pyproject.toml", "Makefile", "docker-compose.yml" }
    local cwd = vim.fn.getcwd()

    for _, marker in ipairs(markers) do
        local root = vim.fn.finddir(marker, cwd .. ";")
        if root ~= "" then
            return vim.fn.fnamemodify(root, ":h")  -- Get the directory containing the marker
        end
    end

    return cwd  -- Fallback: use current working directory
end

-- Function to get project-specific commands from `.nvim-project.lua`
local function get_custom_project_command()
    local project_root = get_project_root()
    local project_file = project_root .. "/.nvim-project.lua"

    if file_exists(project_file) then
        local ok, project_config = pcall(dofile, project_file)
        if ok and type(project_config) == "table" and project_config.run then
            return project_config.run
        else
            print("Error loading .nvim-project.lua: Invalid structure or execution error")
        end
    else
        print("No .nvim-project.lua found in project root: " .. project_root)
    end

    return nil
end

-- Function to auto-detect project type
local function detect_project()
    local project_root = get_project_root()

    if file_exists(project_root .. "/package.json") then
        return "node"
    elseif file_exists(project_root .. "/Cargo.toml") then
        return "rust"
    elseif file_exists(project_root .. "/pyproject.toml") or file_exists(project_root .. "/requirements.txt") then
        return "python"
    elseif file_exists(project_root .. "/Makefile") then
        return "make"
    elseif file_exists(project_root .. "/docker-compose.yml") then
        return "docker"
    else
        return "unknown"
    end
end

-- Function to start the detected project
local function start_project()
    local term = _G.global_term
    term:toggle()

    local project_type = detect_project()
    local custom_command = get_custom_project_command() -- Get custom command if available

    vim.defer_fn(function()
        if custom_command then
            print("Running custom command from .nvim-project.lua")
            term:send("cd " .. get_project_root() .. " && " .. custom_command, true)
        elseif project_type == "node" then
            term:send("cd " .. get_project_root() .. " && npm run dev || npm start", true)
        elseif project_type == "rust" then
            term:send("cd " .. get_project_root() .. " && cargo run", true)
        elseif project_type == "python" then
            term:send("cd " .. get_project_root() .. " && python main.py || uvicorn main:app --reload", true)
        elseif project_type == "make" then
            term:send("cd " .. get_project_root() .. " && make run", true)
        elseif project_type == "docker" then
            term:send("cd " .. get_project_root() .. " && docker-compose up", true)
        else
            print("No recognized project type detected.")
            term:send("cd " .. get_project_root() .. " && ls && echo 'No start command found.'", true)
        end
    end, 100)
end

-- Create a Neovim command to run the project
vim.api.nvim_create_user_command("RunProject", start_project, {})
