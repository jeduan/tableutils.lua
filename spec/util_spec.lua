local t = require('tableutils')

describe('tableutils', function()
	it('extends', function()
		local orig = {foo = '1', bar = 2}
		local result = t.extend({}, orig)
		assert.equals(result.foo, '1')
		assert.equals(result.bar, 2)
	end)

	it('combines and replaces attributes', function()
		local orig = {foo = 'baz', bar = 2}
		local dest = {foo = 1}
		local result = t.extend(dest, orig)
		assert.equals(result.foo, 1)
		assert.equals(result.bar, 2)
		assert.equals(orig.foo, 'baz')
	end)

	it('shuffles attributes', function()
		local ordered = {1, 2, 3, 4, 5}
		t.shuffle(ordered)
		assert(ordered[3] ~= 3)
	end)
end)
