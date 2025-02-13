local Terminal = require("toggleterm.terminal").Terminal

-- Función para encontrar la raíz del proyecto basado en la ubicación del .sln o .csproj
local function find_project_root()
    local path = vim.fn.expand('%:p')  -- Obtiene la ruta absoluta del archivo actual
    local root = vim.fn.fnamemodify(path, ":h") -- Carpeta actual

    -- Busca hacia arriba hasta encontrar un .sln o un .csproj
    while root ~= "/" and root ~= "" do
        if vim.fn.glob(root .. "/*.sln") ~= "" or vim.fn.glob(root .. "/*.csproj") ~= "" then
            print(root)
            return root
        end
        root = vim.fn.fnamemodify(root, ":h") -- Subir un nivel en el árbol de directorios
    end

    return nil  -- Si no se encuentra, devuelve nil
end

-- Crea la terminal con la ruta correcta
function create_dotnet_terminal()
    local root = find_project_root()
    local cmd

    if root then
        cmd = "cd " .. root .. " && dotnet run; echo ''; echo 'Presiona ENTER para cerrar...'; read"
    else
        cmd = "dotnet run; echo ''; echo 'Presiona ENTER para cerrar...'; read"
    end

    return Terminal:new({ cmd = cmd, direction = "float", hidden = true })
end

-- Mapeo para ejecutar/cerrar "dotnet run" desde la raíz del proyecto
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua create_dotnet_terminal():toggle()<CR>", { noremap = true, silent = true })

