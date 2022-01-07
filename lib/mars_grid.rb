class MarsGrid
    LENGTH = 5
    BREADTH = 5

    def self.valid_position? x_coordinate, y_coordinate
        begin
            x_coordinate = Integer( x_coordinate )
            y_coordinate = Integer( y_coordinate )
        rescue
            return false
        end

        begin
            x_coordinate.is_a? Integer and 
            y_coordinate.is_a? Integer and
            x_coordinate.between?( 0, LENGTH ) and 
            y_coordinate.between?( 0, BREADTH )
        rescue => exception
            puts "Exception in valid_position? of MarsGrid -- #{exception.backtrace}"
            return false
        end
    end

    def self.length
        LENGTH
    end

    def self.breadth
        BREADTH
    end
end