local function get_parent_path(path)
  local pattern1 = "^(.+)//"
  local pattern2 = "^(.+)\\"

  if string.match(path, pattern1) == nil then
    return string.match(path, pattern2)
  else
    return string.match(path, pattern1)
  end
end

return {
  get_parent_path = get_parent_path,
}
