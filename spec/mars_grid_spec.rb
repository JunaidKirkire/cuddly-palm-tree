require 'mars_grid'

describe 'Mars grid' do
    context 'when we invoke valid_position? method' do
        it 'should return `false` if non-numeric co-ordinates are passed' do
            expect( MarsGrid.valid_position? 'one', 'two' ).to eq( false ) and
            expect( MarsGrid.valid_position? 1, 'two' ).to eq( false ) and
            expect( MarsGrid.valid_position? 'one', 2 ).to eq( false )
        end

        it 'should return `false` if co-ordinates are outside the grid' do
            expect( MarsGrid.valid_position? MarsGrid.length + 1, MarsGrid.breadth + 1 ).to eq( false ) and
            expect( MarsGrid.valid_position? 0, MarsGrid.breadth + 1 ).to eq( false ) and
            expect( MarsGrid.valid_position? MarsGrid.length + 1, 0 ).to eq( false )
        end
    end
end