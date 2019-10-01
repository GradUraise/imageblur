class Image

    def initialize (image)
        @image = image
        @onecoords = []
    end

    def output_image
        @image.each do |row|
            puts row.join(" ")
        end
    end

    def onecoords
        @image.each_with_index do |row, row_index|
            row.each_with_index do |col, col_index|
                if col == 1
                    @onecoords << [row_index, col_index]
                end
            end
        end

        @onecoords.each do |xy|
            @image[xy[0]][xy[1] + 1] = 1 if xy[1] + 1 <= @image[xy[0]].length - 1
            @image[xy[0]][xy[1]-1] = 1 if xy[1] - 1 >= 0
            @image[xy[0] + 1][xy[1]] = 1 if xy[0] + 1 <= @image.length - 1
            @image[xy[0] - 1][xy[1]] = 1 if xy[0] - 1 >= 0
        end
    end

    def blur(man_dist)
        man_dist.times do
            onecoords
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
puts "blurs to"
image.blur(1)
image.output_image