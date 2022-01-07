class Direction

    @@labels = {
        :north => 'NORTH',
        :south => 'SOUTH',
        :east  => 'EAST',
        :west  => 'WEST'
    }

    @@mapping = {
        'NORTH' => {
            'LEFT' => 'WEST',
            'RIGHT' => 'EAST'
        },
        'EAST' => {
            'LEFT' => 'NORTH',
            'RIGHT' => 'SOUTH'
        },
        'WEST' => {
            'LEFT' => 'SOUTH',
            'RIGHT' => 'NORTH'
        },
        'SOUTH' => {
            'LEFT' => 'EAST',
            'RIGHT' => 'WEST'
        }
    }

    def self.mapping
        @@mapping
    end

    def self.labels
        @@labels
    end

    def self.valid_direction? direction
        [ @@labels[ :north ], @@labels[ :east ], @@labels[ :west ], @@labels[ :south ] ].include? direction
    end
end