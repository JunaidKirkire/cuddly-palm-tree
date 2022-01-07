require 'mars_rover_controller'
require 'command_reader'
require 'mars_grid'

describe 'Mars rover controller' do
    context 'when we initialize the controller' do
        let( :command_reader_obj ) { CommandReader.new 'lib/commands.txt' }
        let( :mars_rover_controller_obj ) { MarsRoverController.new command_reader_obj }
        
        it 'creates an object of Mars rover controller' do
            expect( mars_rover_controller_obj ).to be_kind_of( MarsRoverController )
        end

        it 'has a valid object of CommandReader' do
            expect( command_reader_obj ).to be_kind_of( CommandReader )
        end

        it 'does not have a null object of CommandReader' do
            expect( mars_rover_controller_obj.command_reader_obj ).to be_truthy
        end

    end

    context 'when we invoke run method with valid `PLACE` command' do
        let( :command_reader_obj ) { CommandReader.new 'lib/commands.txt' }
        let( :mars_rover_controller_obj ) { MarsRoverController.new command_reader_obj }
        it 'should read all commands' do
            expect( mars_rover_controller_obj.command_reader_obj.commands ).to be_truthy
        end

        it 'should return the correct final position' do
            expect( mars_rover_controller_obj.run ).to eq( "3,2,EAST\n3,3,NORTH\n" )
        end

        it 'should not return empty' do
            expect( mars_rover_controller_obj.run ).not_to eq( "" )
        end
    end

    context 'when we invoke run method with no `PLACE` command' do
        let( :command_reader_obj ) { CommandReader.new 'lib/commands_no_place.txt' }
        let( :mars_rover_controller_obj ) { MarsRoverController.new command_reader_obj }
        it 'should not return any output' do
            expect( mars_rover_controller_obj.run ).to eq( '' )
        end
    end

    context 'when we invoke run method with an invalid `PLACE` command' do
        let( :command_reader_obj ) { CommandReader.new 'lib/commands_invalid_place.txt' }
        let( :mars_rover_controller_obj ) { MarsRoverController.new command_reader_obj }
        it 'should not return any output' do
            expect( mars_rover_controller_obj.run ).to eq( '' )
        end
    end

    context 'when we invoke run method with an invalid `PLACE` command followed by a valid `PLACE`' do
        let( :command_reader_obj ) { CommandReader.new 'lib/commands_valid_and_invalid_place.txt' }
        let( :mars_rover_controller_obj ) { MarsRoverController.new command_reader_obj }
        it 'should not return correct output' do
            expect( mars_rover_controller_obj.run ).to eq( "3,2,EAST\n3,3,NORTH\n" )
        end
    end
end