local P = {}
function P.findConfigFile(name)
  local configFile = 'custom.configs.' .. name
  return configFile
end

return P
