require_relative 'direction'
require_relative 'mars_grid'

class MarsRover
    attr_accessor :x_coordinate
    attr_accessor :y_coordinate
    attr_accessor :direction
    attr_accessor :mars_grid_obj

    def initialize x_coordinate, y_coordinate, direction
        @x_coordinate = x_coordinate
        @y_coordinate = y_coordinate
        @direction = direction
    end

    def change_direction turn
        begin
            unless Direction.mapping[ @direction ][ turn ].nil?
                @direction = Direction.mapping[ @direction ][ turn ] 
            end
        rescue => exception
            puts "Exception in change_direction of MarsRover -- #{exception.backtrace}" 
        end
    end

    def move
        begin
            current_direction = @direction
            x_coordinate = @x_coordinate
            y_coordinate = @y_coordinate
    
            y_coordinate += 1 if current_direction.eql? Direction.labels[ :north ] # move up
            x_coordinate += 1 if current_direction.eql? Direction.labels[ :east ] # move right
            x_coordinate -= 1 if current_direction.eql? Direction.labels[ :west ] # move left
            y_coordinate -= 1 if current_direction.eql? Direction.labels[ :south ] # move down
            
            if MarsGrid.valid_position? x_coordinate, y_coordinate
                @x_coordinate = x_coordinate
                @y_coordinate = y_coordinate
            end
        rescue => exception
            puts "Exception in move of MarsRover -- #{exception.backtrace}" 
        end
    end

    def report
        begin
            "#{@x_coordinate},#{@y_coordinate},#{@direction}\n" 
        rescue => exception
            puts "Exception in report of MarsRover -- #{exception.backtrace}" 
            ""
        end
    end
end