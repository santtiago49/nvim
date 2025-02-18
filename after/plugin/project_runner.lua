local Terminal = require("toggleterm.terminal").Terminal

-- Function to check if inside tmux
local function is_tmux()
    return os.getenv("TMUX") ~= nil
end

-- Function to get current tmux session name
local function get_tmux_session()
    local handle = io.popen("tmux display-message -p '#S'")
    local session = handle and handle:read("*a") or ""
    if handle then handle:close() end
    return session:gsub("\n", "") -- Remove newline
end

-- Function to get tmux window name (alternative to pane title)
local function get_tmux_pane_name()
    local handle = io.popen("tmux display-message -p '#W' 2>/dev/null")
    local pane_name = handle and handle:read("*a") or ""
    if handle then handle:close() end
    return pane_name:gsub("\n", "") -- Remove newline
end

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

-- Function to auto-detect project type
local function detect_project()
    if file_exists("package.json") then
        return "node"
    elseif file_exists("Cargo.toml") then
        return "rust"
    elseif file_exists("pyproject.toml") or file_exists("requirements.txt") then
        return "python"
    elseif file_exists("Makefile") then
        return "make"
    elseif file_exists("docker-compose.yml") then
        return "docker"
    elseif file_exists(".nvim-project.lua") then
        return "custom"
    else
        return "unknown"
    end
end

-- Function to get project-specific commands from .nvim-project.lua
local function get_custom_project_command()
    local ok, project_config = pcall(dofile, ".nvim-project.lua")
    if ok and type(project_config) == "table" and project_config.run then
        return project_config.run
    else
        return nil
    end
end

-- Function to start the detected project
local function start_project()
    local term = _G.global_term
    term:toggle()

    local project_type = detect_project()  -- Reuse your project detection logic

    vim.defer_fn(function()
        if project_type == "node" then
            term:send("npm run dev || npm start", true)
        elseif project_type == "rust" then
            term:send("cargo run", true)
        elseif project_type == "python" then
            term:send("python main.py || uvicorn main:app --reload", true)
        elseif project_type == "make" then
            term:send("make run", true)
        elseif project_type == "docker" then
            term:send("docker-compose up", true)
        else
            print("No recognized project type detected.")
            term:send("ls && echo 'No start command found.'", true)
        end
    end, 100)
end

vim.api.nvim_create_user_command("RunProject", start_project, {})
