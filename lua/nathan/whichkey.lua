local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {}

local mappings = {}

local opts = {
    prefix = "<leder>",
}

which_key.setup(setup)
which_key.register(mappings, opts)
