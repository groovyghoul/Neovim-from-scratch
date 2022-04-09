local status_ok, lspsignature = pcall(require, "lsp_signature")
if not status_ok then
  return
end

lspsignature.setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
  })
