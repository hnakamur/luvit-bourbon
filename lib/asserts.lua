local asserts = {}

asserts.assert = assert

asserts.equal = function(a, b)
  bourbon_assert(a == b)
end

asserts.ok = function(a)
  asserts.assert(a)
end

asserts.equals = function(a, b)
  asserts.assert(a == b)
end

asserts.dequals = function(a, b)
  if type(a) == 'table' and type(b) == 'table' then
    asserts.array_equals(a, b)
    for k, v in pairs(a) do
      asserts.dequals(v, b[k])
    end
    for k, v in pairs(b) do
      asserts.dequals(v, a[k])
    end
  else
    asserts.equals(a, b)
  end
end

asserts.array_equals = function(a, b)
  asserts.assert(#a == #b)
  for k=1, #a do
    asserts.assert(a[k] == b[k])
  end
end

asserts.not_nil = function(a)
  asserts.assert(a ~= nil)
end

asserts.is_nil = function(a)
  asserts.assert(a == nil)
end

asserts.is_number = function(a)
  asserts.assert(type(a) == 'number')
end

asserts.is_boolean = function(a)
  asserts.assert(type(a) == 'boolean')
end

asserts.is_string = function(a)
  asserts.assert(type(a) == 'string')
end

asserts.is_table = function(a)
  asserts.assert(type(a) == 'table')
end

asserts.is_array = function(a)
  asserts.assert(type(a) == 'table')
  for k, v in pairs(a) do
    asserts.assert(false)
  end
end

asserts.is_hash = function(a)
  asserts.assert(type(a) == 'table')
  for k, v in ipairs(a) do
    asserts.assert(false)
  end
end

asserts.throws = function(...)
  local s, e = pcall(...)
  p('NOT?', s, e)
  asserts.assert(not s)
  asserts.assert(e)
end


return asserts
