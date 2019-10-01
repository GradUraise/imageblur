class Image

    def initialize (image)
        @image = image
        @discovered_points = []
    end

    def output_image
        @image.each do |e|
            puts e.join(" ")
        end
    end

    def find_points
        x = 0
        y = 0
        @image.each do |row|
            y = 0
            row.each do |col|
                if col == 1
                    @discovered_points<<[x,y]
                end
                y = y+1
            end
            x = x+1
        end
        puts @discovered_points
    end

    def blur(man_dist)
        self.find_points
        x = 0
        y = 0
        @image.each do |row|
            y = 0
            row.each do |col|
                @discovered_points.each do |point|
                   distance = (point[0]-x+point[1]-y).abs
                   puts "#{point[0]} - #{x}; #{point[1]} - #{y} Dis: #{distance}"
                   if distance <= man_dist
                        @image[x][y]=1
                   end
                end
    
                y = y+1
            end
            x = x+1
        end
    end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
image.blur(1)
image.output_image