---@diagnostic disable: undefined-global

local save = ya.sync(function(st, cwd, output)
  if cx.active.current.cwd == Url(cwd) then
    st.output = output
    ya.render()
  end
end)

local get_config_file = ya.sync(function(st)
  return st.config_file
end)

return {
  setup = function(st, args)
    Header:children_remove(1, Header.LEFT)
    Header:children_add(function()
      return ui.Line.parse(st.output or "")
    end, 1000, Header.LEFT)

    -- Check for custom starship config file
    if args ~= nil and args.config_file ~= nil then
      local url = Url(args.config_file)
      if url.is_regular then
        local config_file = args.config_file
        local home = os.getenv("HOME")

        if home then
          home = tostring(home)
          config_file = config_file:gsub("^~", home):gsub("^$HOME", home)
        end

        st.config_file = config_file
      end
    end

    ps.sub("cd", function()
      local cwd = cx.active.current.cwd
      if st.cwd ~= cwd then
        st.cwd = cwd
        ya.manager_emit("plugin", {
          st._id,
          args = ya.quote(tostring(cwd), true),
        })
      end
    end)
  end,

  entry = function(_, args)
    local command = Command("starship"):arg("prompt"):cwd(args[1]):env("STARSHIP_SHELL", "")
    local config_file = get_config_file()

    if config_file then
      command = command:env("STARSHIP_CONFIG", config_file)
    end

    local output = command:output()
    if output then
      save(args[1], output.stdout:gsub("^%s+", ""))
    end
  end,
}
