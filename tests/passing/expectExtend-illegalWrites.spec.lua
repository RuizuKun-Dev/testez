local noOptMatcher = function(_received, _expected)
    return{
        message = '',
        pass = true,
    }
end
local ERROR_CANNOT_OVERWRITE = 'Cannot overwrite matcher'

return function()
    describe('attempt to overwrite default', function()
        beforeAll(function()
            local success, message = pcall(function()
                expect.extend({ok = noOptMatcher})
            end)

            assert(success == false, 'should have thrown')
            assert(message:match(ERROR_CANNOT_OVERWRITE), string.format('\nUnexpected error:\n%s', message))
        end)
    end)
    describe('attempt to overwrite never', function()
        beforeAll(function()
            local success, message = pcall(function()
                expect.extend({never = noOptMatcher})
            end)

            assert(success == false, 'should have thrown')
            assert(message:match(ERROR_CANNOT_OVERWRITE), string.format('\nUnexpected error:\n%s', message))
        end)
    end)
    describe('attempt to overwrite self', function()
        beforeAll(function()
            local success, message = pcall(function()
                expect.extend({a = noOptMatcher})
            end)

            assert(success == false, 'should have thrown')
            assert(message:match(ERROR_CANNOT_OVERWRITE), string.format('\nUnexpected error:\n%s', message))
        end)
    end)
end
