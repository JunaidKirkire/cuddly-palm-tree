require 'mars_rover'

describe 'Mars Rover' do
    let( :mars_rover_obj ) { MarsRover.new 3, 3, 'EAST' }
    context 'we initialize the MarsRover' do
        it 'should create the object correctly' do
            expect( mars_rover_obj.x_coordinate ).to eql( 3 ) and
            expect( mars_rover_obj.y_coordinate ).to eql( 3 ) and
            expect( mars_rover_obj.direction ).to eql( 'EAST' )
        end
    end

    context 'when we invoke `change_direction` with correct direction' do
        it 'should change direction' do
            mars_rover_obj.change_direction 'LEFT'
            expect( mars_rover_obj.direction ).to eq( 'NORTH' )
        end
    end

    context 'when we invoke `change_direction` with incorrect direction' do
        it 'should not change direction' do
            mars_rover_obj.change_direction 'LEFTY'
            expect( mars_rover_obj.direction ).to eq( 'EAST' )
        end
    end

    context 'when we invoke `move`' do
        it 'should move one step in the current direction' do
            mars_rover_obj.move
            expect( mars_rover_obj.x_coordinate ).to eq( 4 )
        end
    end
end