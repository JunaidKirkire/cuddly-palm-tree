require_relative 'direction'
require_relative 'mars_rover'
require_relative 'mars_grid'

class MarsRoverController
    attr_accessor :command_reader_obj
    attr_accessor :mars_rover_obj

    def initialize command_reader_obj
        @command_reader_obj = command_reader_obj
    end

    def run
        place_cmd_encountered = false
        output = ""
        @command_reader_obj.commands.each_line do |command_line|
            begin
                command_line = command_line.strip
                command = command_line.split " "
                
                place_cmd_encountered = true if command[ 0 ].eql? "PLACE"

                if place_cmd_encountered
                    case command[ 0 ]
                        when 'PLACE'
                            params = command[ 1 ].split ","
                            x_coordinate = params[ 0 ]
                            y_coordinate = params[ 1 ]
                            direction    = params[ 2 ]
                            
                            if MarsGrid.valid_position? x_coordinate, y_coordinate and Direction.valid_direction? direction
                                @mars_rover_obj = MarsRover.new x_coordinate.to_i, y_coordinate.to_i, direction # Initialize mars rover
                            else
                                place_cmd_encountered = false # `PLACE` command didn't set a valid position.
                            end
                        when 'LEFT', 'RIGHT'
                            @mars_rover_obj.change_direction command[ 0 ]
                        when 'MOVE'
                            @mars_rover_obj.move
                        when 'REPORT'
                            output += @mars_rover_obj.report
                        else
                            # ignore
                    end
                end
            rescue => exception
                puts "Exception in run command of MarsRoverController -- #{exception.backtrace}"
            end            
        end
        output
    end
end