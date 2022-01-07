require_relative '../lib/command_reader'
require_relative '../lib/mars_grid'
require_relative '../lib/mars_rover_controller'

command_reader_obj = CommandReader.new ARGV[ 0 ]
mars_rover_controller_obj = MarsRoverController.new command_reader_obj
puts mars_rover_controller_obj.run