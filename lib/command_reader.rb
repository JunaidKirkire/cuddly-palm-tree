class CommandReader
    attr_accessor :commands

    def initialize file_name
        @commands = File.open( file_name, 'r' )
    end

end