#!/usr/bin/env luvit

exports = {}

exports['test_asserts_ok'] = function(test, asserts)
  asserts.ok(true)
  test.done()
end

exports['test_asserts_equals'] = function(test, asserts)
  asserts.equals(1, 1)
  test.done()
end

exports['test_asserts_dequals'] = function(test, asserts)
  asserts.dequals({1,2,3, foo = 'foo', bar = { 'baz' }}, {bar = { 'baz' }, 1,2,3, foo = 'foo'})
  test.done()
end

exports['test_asserts_nil'] = function(test, asserts)
  asserts.is_nil(nil)
  test.done()
end

return exports
