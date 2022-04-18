return function()
    describe('When a failure occurs in an it block', function()
        it('Should fail', function()
            fail('Failure in it block')
        end)
        afterEach(function()
            error('afterEach threw an error as expected')
        end)
    end)
end
