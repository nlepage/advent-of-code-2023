def symmetry(arr)
  (1...arr.length).find { |y| arr[[2*y-arr.length,0].max...y] == arr[y...(2*y)].reverse! }
end

def symmetryWFudge(arr)
  (1...arr.length).find { |y|
    a = arr[[2*y-arr.length,0].max...y]
    b = arr[y...(2*y)].reverse!
    diffs = a.zip(b).filter { |a, b| a != b }
    if diffs.length == 1
      a, b = diffs[0]
      x = a ^ b
      x & (x - 1) == 0
    else
      false
    end
  }
end

def solve(input)
  matrices = input
    .split("\n\n")
    .map { |s| s.split("\n")
    .map { |line| line.each_char.map { |c| c == '#' ? 1 : 0 } } }
    .map { |matrix| [matrix.map { |l| l.join.to_i(2) }, matrix.transpose.map { |l| l.join.to_i(2) }] }

  p matrices.map { |lines, columns|
    y = symmetry lines
    if y.nil?
      symmetry columns
    else
      y*100
    end
  }.sum

  p matrices.map { |lines, columns|
    y = symmetryWFudge lines
    if y.nil?
      symmetryWFudge columns
    else
      y*100
    end
  }.sum
end

TEST = <<~EOF
#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.

#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#
EOF

solve TEST

INPUT = <<~EOF
.......#.####
#..#.##.#####
.#...#..#....
#..#.###.....
.##.#..##.##.
#####.#..####
....######..#

.#.#..#
....##.
#..#..#
###....
..#####
.##.##.
.#..##.
.#..##.
.##.##.
..#####
###....
#..#..#
....##.
.#.#..#
####..#
#.#.#..
....##.

.##..##.#.#.#.#..
...##........####
#.####.#.##.##...
........#.#######
###..###...####..
#..##..#.##......
........##.#..#..
#.#..#.####....##
#..##..#.##.#...#
#......#.#.###.##
...##...#.##..###
##.##.##..#......
..####..##.#.##..
..#..#....###.###
..####....###..##
###..###.###.....
........#####.#..

#.##.###..##...
######..##..###
.#..#.##.##..#.
.####...#.#..#.
######.########
..##.....#...#.
.####..##.#.##.
.####..##.#.##.
..##.....#...#.
######.#######.
.####...#.#..#.
.#..#.##.##..#.
######..##..###
#.##.###..##...
#.##.#..#.#..##
##..#####...#..
#######.###.#..

..###......###..#
....###..###....#
##...######...###
##.#.##..##.#.###
##.#.##..##.#.###
##...######...###
....###..###....#
..###......###..#
..#..........#..#
.#..###..###.##..
#.####.##.####.#.

#.####.#...
#.##.#.#...
###.#.####.
.##..#####.
.#.#.#.#..#
..#......#.
..#......#.

.#.#..#..#...
.#.##.#..#...
####.........
##.#.####..##
.##.####.#.##
.#####.#.#...
#..##..#...##
#..###..#....
##..#...#.###
####......#..
..####..#####
.####........
.#.#.#...#.##

#......##
##.#.....
##.#.....
#......##
..#......
..##...##
.#.###.##
.##.##..#
###.#####
###.#####
.##.##..#
.#.#.#.##
..##...##

..#.#.#
#..##.#
##.##..
...##..
.##.#..
#.#.###
.#.##..
##...#.
...#.#.
###..##
##...##
..#.###
.##...#
.##...#
..#.###
##...##
###..##

#...#...##...#..#
#..##...##...#..#
#....#.##.#.##...
#....#.##.#.##...
#..##...##...#..#
#...#...##...#..#
###...###..#...#.
.#.##.#...#....#.
..#..#...##.#.#.#

.##.##.##....##
#.##..##.####.#
####...########
#.#....#.####.#
##.#..#.##..##.
#.#.##.#.#..#.#
#.##..##.####.#
#.##..##.#..#.#
##########..###
.#.#..#.#.##.#.
#.#.##.#.#..#.#

......###
..##.....
..##.....
..##..###
.#..#.#..
######..#
#.##.#.#.
######.#.
.#..#..#.
.#..#...#
##..###.#
..##.....
..##..#..

##..#.####.#..#
###.########.##
##..##....##..#
###..######..#.
######.##.#####
#######..######
.....##..##....
..############.
..##.#....#.##.
###..........##
######.##.#####
..#...#..#...#.
...##..##..##..
..#.##.##.##.#.
......#..#.....

#..##..##..##
####.#....#.#
.....##...#..
#.##..####..#
.#.##.####.##
#.#####..####
#.##.######.#
.......##....
##.#...##...#
.####..##..##
.####..##..##
##.#...##...#
.......##....
#.##.######.#
#.#####..####
.#.##.####.##
#.##..####..#

###...#..###..#
..#.#.##....##.
###...#.##..#..
....##.#.##..#.
..###..###.####
########......#
###...#..###...
..........#.#.#
####.#..##.#.##
...###.#.##.#.#
...#.#.#.####..
##.###.....#.#.
..#...########.
..#...########.
##.###.....#.#.
...#.#.#.####..
...##..#.##.#.#

###.###...#
.....##...#
#.##...####
#.##...####
.....##...#
###.#.#...#
##...####..
##..#..##..
...#.#.#.##
...##......
...##......
...#.#.#.##
##..#..##..
##...####..
###.#.#...#

###.#...#
..#.####.
.#....#..
#.##..##.
#.##..##.
.#....#..
..#.####.
###.#..##
###.#..##

##.#.##..##.##.#.
.#.###.#...####..
##.#.########.#.#
####.###.#.#.####
#.....###.#.####.
##..#..#.##.#.#.#
.##..####.....#.#
.##..####.....#.#
##..#.##.##.#.#.#
#.##.....####..##
##..###...#..###.
##..###...#..###.
#.##.....####..##
##..#.##.##.#.#.#
.##..####.....#.#
.##..####.....#.#
##..#..#.##.#.#.#

.#.###.####
#.#.###....
..##..#....
......#####
.#...##....
#..########
.#.##.#....
.###.##....
##.##.#####
...##.#.##.
.#####.####
..#.#######
....##.####
..####.....
#..####....

.########....
..........###
.#......#.##.
#.#....#.####
...####...###
#.#....#.##..
##.#..#.##...
.########...#
.########.#.#

#.#..#.##..
#.####.#...
..####.....
...##....##
#..##..####
..####..###
.######.###
.##..##.#..
#.#..#.#.##
..#..#....#
.######.###
.######.#..
.#.##.#.#..
#......#...
.........##

.##..#.#####...
.##.##.#....#..
.##...#...#####
.##...#..###.#.
#..##.##..#####
.##...##....###
#..#.#..#.###..
.##......##....
.##....#..#....
.##.#####.#....
.##..#.##.###..
.....#....#####
.##.#.#.#.##.##
....###...#.#..
.##.#.##..#....

####..###
#..####..
.##.##.##
..#.##.#.
###....##
....##...
.##.##.##

...#...
####.##
####..#
...#...
##..#.#
.####.#
.####.#
##..#.#
...#...

###...##..##....#
.###....#...#####
.#...#..##....###
.#...#..##.####..
......##.#.#..##.
.#..#..#.####....
.#..#..#..###....
......##.#.#..##.
.#...#..##.####..
.#...#..##....###
.###....#...#####
###...##..##....#
###...##..##....#

###.###..####
.#.##.##.....
#.#.#..##....
##..#.#.#####
##..###.#####
#.###.#######
#..##..#.....
#...#...##..#
##.#...#.####

######..#.###.#..
######...#####...
..##......##.#.##
..##..####.#.#...
########...####..
......##.#.####..
##..####.#.##..##
######..##.#.##.#
..##....##.#....#
#######..###...#.
.####.#.#...###.#
..##..#..##...#.#
..........##.##..
..##..#.#.#..##..
..##..#####.##.#.
#######...#..#...
#######.#.##...##

##......#.#
..##...##.#
##..#.#####
##.#..##.##
##.#..##.##
##..#.#####
..##....#.#
##......#.#
##.#.#.#..#
...#..#.##.
...###.#.##

..####..#
#.#..###.
..#..#..#
..#..#..#
#.#..###.
..####..#
..##.##.#
.#.#.#.#.
##..##.#.
.####.#..
#.##.#.#.
###...##.
###...##.
#.##.#.#.
.#.##.#..
##..##.#.
.#.#.#.#.

#......##
..####..#
...##...#
..####...
#..##..#.
#..##..#.
....#...#
#.####.##
.##..##.#
.##..##..
.##..##..

...#.##..#.#.#.##
#.###.##.#.#.##.#
..#.........#.##.
##..###...##.#.##
##..###...##.#.##
..#.........#.##.
#.###.##.#.#.##.#
...#.##..#.#.#.##
###......####.#.#
##.##..#...#.##..
..###...##.###.#.
#.##.##..#.##....
...#.#.##..#..###
...#.#.##..#..###
#.##.##.##.##....

.##.##..#
#..#.####
####..##.
##.######
.#.#...#.
####.####
...#.....
..##.####
###..####
###..####
..##.####
...#.....
####.####

.#.##..##..##..
##..#...####...
#....#...##...#
#...##..#..#..#
#...##..#..#..#
#....#...##...#
##..#...####...
...##..##..##..
###...##.##.##.
#.##.#.#.##.#.#
#.#####......##

###....
.##.###
##...##
##...##
.##.###
##.....
##.##.#
.#.....
.####.#
#.#....
#.#....

#...##.#...##.###
#..#.###...#..##.
....#.##..##.#..#
.##.###..#.#.####
....#.##.##..####
#..####.####.##..
.##.#.#.#..####..
.##.#.#.#..####..
#..####.####.##..

.##.#..##
..#.####.
....##.##
.....#..#
.....#..#
....##.##
..#.####.
.##.#..##
#.##.#.#.
..#.#....
..#.#...#

...##..##..
..#......##
..###..###.
..#..##..#.
..##.##.##.
####.##.###
.....##....
####.##.###
....#..#...
###..##..##
##.######.#

#..#......#.#####
#.........#.#####
#.#.#.#.##.##....
.##..###.##...#..
######.##..#.....
.#....###.#.##.#.
.##....###.##.#.#
.#.#..###.###.#.#
.#.#..###.###.#.#

.##..####
#..#.#..#
####..##.
####.####
#..######
#..######
.##..####
.##.##..#
#####.##.
.#....##.
#..#..##.

#..#####..##.
..#..#..##..#
##..##.#.####
...##.##..##.
###.#.#..####
####..###....
..#..#.......

.####..#.
#....####
..##..##.
.#..#.##.
.#..#....
##..##..#
......##.

#.###.##.###.##
##...####..####
.#####..#####..
####.#..#.#####
##.########.###
.....####......
#....####....##

..######.......
#.#.#..###.##.#
.###....##....#
.##.#..#.##..##
..##.#####....#
#..#..#.#.####.
#..#..#.#.####.
#.##.#####....#
.##.#..#.##..##
.###....##....#
#.#.#..###.##.#

#####..#.#..###
##.##..#.#..###
##..##.####.#.#
..#####..##.#.#
##..#####..#...
...###.##..##.#
##..#.#...#.#..
####...........
..###..#......#
..#.######.##..
#####...#.##..#
##..##.#.##.#..
..###..##.#.#..
##.###..#.#.#..
##..#.#..##.#..

...##.####.##..
##.##.#..#.##.#
##.###....###.#
###.#.#..#.#.##
##.....##.....#
###.#.####...##
.....######....

.##......
.##......
#.#..#.#.
..#.#....
.##...#..
....##..#
#.#.###..
#.##.#..#
..##.....
#..##..##
.#..###.#
.#..###.#
#..##..##
..#......
#.##.#..#

.###.##..
....#....
.##.#.###
####..#..
....##.##
#..##..##
.##....##
.....#.##
####.##..

..##.##.#
...#.##.#
#..##..##
.###....#
#..##..##
.###....#
.##......
##.......
...##..##
.....##..
..#......
.#..####.
.#...##..

#....#.#..#
######.....
#.##.##.##.
#....#.#..#
.......#..#
#.##.#.....
.#..#...##.
.####..####
#######.##.
......#.##.
##..##.....
##..##.#..#
.####.#####
.#..##..##.
..##...####

#..##..##..#.
..########...
.##.####.##.#
##.#....#.##.
##.#....#.##.
.##.####.##.#
..########...
#..##..##..#.
.###....###.#
...#.##.#...#
#..##..###.#.
##........##.
.##########.#
.##.#..#.##..
#.#.####.#.#.

#.##..##.###..##.
.#.###..#.#.#.##.
##.####.##.#.#..#
.#.####.#.....##.
##..##..#####.##.
.#..##..#.#######
#..#..#..##......
...#..#......#..#
...#..#.....#####

..#.#......#.#.
.....#.##.#....
###.#.####.#.##
##.##.#..#.##.#
......#..#.....
.....#.##.#....
..####....####.
..#.###..###.#.
..#..#....#..##
##..#.####.#..#
##.#.##..##.#.#

.####.#..#....#
.####.#..#....#
##.##.....#....
.#...#...#####.
..#....###...#.
.....#.#.#.##.#
.#.##.#####.#..
#....###..#.#.#
.####.#.####..#
#.#.....#...#.#
.......#.##.#..
.......#.##.#..
#.#.....#...#.#
.####.#.####..#
#....##...#.#.#

.####.###..#.#.##
......##.##.##...
#.##.##########.#
########.##.#####
######...##...###
.####..##..##..##
##..###.#..#.###.
.####...#..#...##
.####.#..##..#.##
..##..#.#..#.#..#
........#..#.....
#.##.##.#..#.##.#
#.##.#.######.#.#
.####....##....##
..##............#
#.##.##.####.##.#
.#..#..#.##.#..#.

####.##..##
##..##.#..#
..#.##.####
..###..####
###.##.#.#.
#####..##.#
..##.##...#
...##.#..##
#########.#
..###..####
.##..#..###
###..#.##..
###..#.##..

.##...#
###..##
#..##..
##.#...
##.#...
#..##..
###..##
.##...#
#...#..
....#.#
....#.#
#..##..
.##...#

..####....###
.##..........
...#.#.##...#
#.....####...
.#...........
#..####..####
...#.##..##.#
...#.##..##.#
#..####..####

..#.##..##.##
.##...####...
#...#.#.###..
#..#.####.###
#.##....#....
####..#..#..#
####..#..#..#
#.##....#....
#.##.####.###
#.##.####.###
#.##....#....
####..#..#..#
####..#..#..#
#.##....#....
#..#.####.###

..#.#.##.
..#..#..#
#.#...##.
..#.#.##.
##.#.#..#
.#.#.#..#
##....##.
#..#.#..#
#.##.#..#
##....##.
.#.#.#..#
##.#.#..#
..#.#.##.

...####..##..##
..#.....##....#
....#.#..######
##.##.##...##..
...#####.######
..##.#..##....#
###...#..######
####.###..#..#.
..####.##..##..
.#.#..#....##..
###.##.##......
####..##.......
###.#.....####.
##..##.#..####.
####.##.#######
...##.##.##..##
######.########

#.##....####...
.##...###..###.
##.#..#..##..#.
.###.#.######.#
#.#.....#..#...
.#####.##..##..
#.##.....##....
.##............
###.##...##...#
..##.#..#..#..#
..##.#..#..#..#
###.##...##...#
.##............

.#.....#.##.#
.#.###.######
###..##.####.
#.#.###.#..#.
..#.###.#..#.
###..##.####.
.#.###.######
.#.....#.##.#
#...####....#
#.#...#######
...#.#..#..#.
#..##...#..#.
#.#####.####.

####......#######
...##.##.##...#..
#.##......##.#.##
..###.##.###..#..
.#.#.####.#.#..#.
###.######.######
#####....#####.##
....#....#....#..
#####....######..

......##.#.
#..#....#..
#..#....#..
......#..#.
####..##..#
.##..#..#..
......#....
.....#..#.#
#..####..##
#..##.#.###
#..#.#.###.
.....####..
......##...
.........#.
#..#...##..

...#....#
###.####.
###.#....
##.......
..#######
##...##..
...#....#

##...........
###.#...####.
###.##.#....#
####..#..##..
###..##.#..#.
.....##.#..#.
.#.##.#.#..#.
.....#.######
..##..##....#

###...#
###..##
...#.##
###..#.
#..##.#
#.#...#
#.#...#
#..##.#
###..#.
...#.##
###..##
###...#
.#..##.
#...#..
..##.##

...####..##
##.#..#..#.
#......##..
..#.#......
##.###.##.#
.##.#.####.
.##.#......
##.########
..##.######
...#...##..
###...#..#.
#....##..##
.###.......
.#.#...#...
...##.#..#.
.##....##..
.##....##..

#.#####.####.#.
...####....#...
#..#...###.#.##
#..#...###.#.##
...####....#...
#.#####.####.#.
.#####.....##..
.#..##.#.##.###
#..#.#....#..##
##.#...#..#.###
##.#...#..#.###
#..#.#....#..##
.#..##.#.##.###
.#####.....##..
#.#####.####...
...####....#...
#..#...###.#.##

........#.#.##.#.
####....#....#..#
####....#....#..#
........#.#.####.
.....#.##.##..#..
.##.#.....#...#..
.##.###..####...#
###########.#..#.
......#....#.#.##
#..#.####.###..##
.##.#...##..##.##
.##....#.....#.#.
#######....#.#.##
#..#..##.#.#..#.#
########..##.###.

......#.##.##.#..
.#..#.##..#.##...
..###..###....#.#
#...#####....#..#
#.####.###..#...#
#.####.###..#...#
#...#####....#..#
..###..###....#.#
.#..#.##..#.##...
......#.##.##.#..
.#.#...##..##.##.
####.#..#.####..#
.#..#####.#.#.#..
...#.#......####.
...#.#......####.
.#..#####.#.#.#..
#.##.#..#.####..#

..#..#..##.##.##.
#.#..#.##..##..##
.##..##.#.#..#.#.
#.#..#.####..####
###..#####....###
.#....#..........
#..##..#.#....#.#
.#.##.#.###..###.
#########.#..#.##
.##..##.#...#..#.
.#....#..##..##..
########.######.#
.######...####...
##....##..####..#
#.####.#..#..#..#

........####.
.######..#...
#......###..#
#......###..#
.######......
........####.
#..##..#.....
.#....#.###..
#.####.####.#
#.#..#.#..###
..####..##.##
##....##.##.#
##....###...#
#.####.#..##.
..####....##.
.##..##..#...
.#.##.#..###.

.###.##.#..#.##.#
..#..#........#..
###.#..#.##.#..#.
##...#........#..
..####..###...###
..####..###...###
##...#........#..
###.#..#.##.#..#.
..#..#........#..

.#########.##.##.
#..#......#..#..#
.##..#..#..##....
.....#..#.....#.#
..##.####.##..##.
..#.######.#..#.#
..#.#.##.#.#..###
.#.#.#..#.#.#.##.
.###......###....
.###......###....
.#.#.#..#.#.#.##.

######.#...##
######..#...#
.####...##...
.####......#.
......#.#.#.#
..##..#.#.###
#..#.#.##..#.
.####.####..#
.####.####..#

#.#.#.....###.#..
#.##.###.##.#...#
#..#..###..#.....
#..#..###..#.....
#.##.######.#...#
#.#.#.....###.#..
..##.#######.###.
..##.#######.###.
#.#.#.....###.#..
#.##.######.#...#
#..#..###..#.....
#..#..###..#.....
#.##.###.##.#...#
#.#.#.....###.#..
.#####.#.#####.#.

....####.#.##
##.....##.#..
.##.#.###..##
#..###..#....
#..###..#....
.##.#.###..##
##.....##.#..
....####.#.##
###.###.##.#.
.#.##.#..#.#.
.#.##.#..#.##
###.###.##.#.
....####.#.##

.##..#.##..
.#..#.###..
.#..#..##..
.##..#.##..
.##..#.##..
.#..#..##..
.#..#.###..
.##..#.##..
.##...###..
...#..#..##
..#..#.##..
#.....#.#..
..#.##...##
#.##.##..#.
##.#..#.#.#
##...#.#...
#...##....#

###..##.......#
.....#.#..#####
...#...#..#####
##..####.##.#.#
..#..##.#...#.#
..##.#.#....#..
##.##...#.#.#..
##.##...#.#.#..
..##.#.#....#..
..#..##.#...#.#
##..####.##.#.#
...#...##.#####
.....#.#..#####
###..##.......#
##..##.......#.

###.####.##
####.##.###
#...####...
....####...
.###....###
####.##.###
#....##....
#####..####
.....##....
#..######..
..#......#.
####....###
#..##..##..
.###.##.###
#..######..

#.#.###..##..
###..#.#....#
..####.......
##..#.#.###..
##..#.###..##
#.#...##.##.#
#.#...##.##.#

#....#..#..
.#..#...###
##..##...##
.####..#.#.
.####..#.#.
##..##...##
.#..#...##.
#....#..#..
..##..#.#..
#....##...#
######..#.#
.####..##.#
.####.#..##
..##...#..#
......##.#.

....##...
...#..#..
###....##
.########
.#.#..#.#
####..###
.##.##.##
.##....##
#........
###.##.##
#..####..

.####.##..##..#
###....###..###
.##....##....##
##..##...#..#..
..##....######.
..#.###.#.##.#.
######.#......#
.#..#..##.##.##
.#..##.##.##.##
######.#......#
..#.###.#.##.#.
..##....######.
##..##...#..#..

..##.#.####.#
..##.#.####.#
#.#.#.###.###
....###.#....
###.#####.##.
##...#####.##
###.###.#.#..
.#####..#.##.
.#####..#.##.
###.###...#..
##...#####.##

#.##...##.###
#.#..###..#..
..#..###..#..
#.##...##.###
#.##...##.###
..#..###..#..
#.#..###..#..
#.##...##.###
#..#.#.#...##
.#.###..####.
#.######..#..
..###...#####
#####.####..#
###.####..##.
...##.#####.#
.##...#....##
########.##..

.#.##.#..###.....
##.##.#####.#.###
.######....#.#...
#..##..#.###.....
#.####.#..#.##...
...##....###.##..
##....####...##..
.#.##.#.#.#...###
..####...##.#####
..##.#......#....
.#.##.#..#.....##
###..########....
.#....#.##.###...
#..##..#..##..#..
########.#####...

#..#.#..#
.##.##..#
#####...#
.##.#.###
.##....#.
####...#.
.....#...
....##.##
.##....##
.....###.
.##.#.#..
.......#.
.......##

..#..####
##....##.
...#.....
#.##.####
#.#.#####
.#.######
.##......

.###.#.#.#.######
#...###.###.#.###
#...###.###.#.###
.###.#.#.#.######
##.......##.##..#
#.#...#.#.#..#...
.##.###.#.#####.#
.#.####..####.#.#
...#.##.#.#.##.#.
.#..#.##.##...##.
.#..#.##.##...##.
...#.##.#.#.##.#.
.#.####..####.#.#
.##.###.#.#.###.#
#.#...#.#.#..#...

#.#.###.#
..##...#.
##..#.###
##..#..#.
##..#..#.
##..#.###
..##...#.
#.#.###.#
#.#.###.#
..##...#.
#...#.###

###....
#.##.##
....#..
##.....
...##..
.##....
...#...
.####..
#..####
.#.####
.#.####
#...###
.####..

.#.#.#.#.#.#.
############.
....##.##....
....##.##....
############.
.#.#.#.#.#.#.
..###.#..###.
.....######.#
######.#.#...
###.#...##.#.
.#..###.#...#
.##.##.#####.
.########.##.
.########.##.
.##.##.#####.
.#..###.#...#
.##.#...##.#.

####....##....#
.##..######..##
#.##.##.#.#..#.
#.##.##.#.#..#.
.##..######..##
####..#.##....#
..####...#.##.#
.###.#.#..#..#.
#.##.#....#..#.
##...###.##..##
#####.#...#..#.
##.###...######
##.#...#.......
#####.##...##..
####.####..##..
#..#.##...#..#.
..##.#.#...##..

..####..#
..#..#...
.#.##.#..
.#....#..
#..##..##
..####...
###..####

..##.#...##...#
........#..#...
.##..#...##...#
#...#...#..#..#
#.####..####..#
##..#....##....
.###.#.#....#.#
#.###.########.
.##.#.###..###.
.##.#..#.##.#..
#...#.#......#.
##.#####.##.###
###..###.##.###
##...#..####..#
##...#..####..#

##....##..#.#
##....###.#.#
..##.....####
..#.#...#...#
##.......##..
...###.##.##.
.#..#.#.#..##
#.######...##
##.###...##..
###...#..#.##
.##.##.###..#
#.###.#..###.
...##..##....
####..#...###
####.##.#.##.
####.##.#.##.
####..#...###

####......####.
.##.##..##.##.#
.....#..#......
#...######...##
.#....##....#..
.##.##..#..##..
..####..####...
#.#..#..#..#.##
#.###.##.###.#.
#..########..##
.############..
.#..######..#.#
...########....
...########....
.#..######..#.#

#.##.#...........
#.##.##.......#..
#.##.#####....###
......#.#..##..#.
.####..#.#....#.#
#.##.####.####.##
#....###.######.#
.........##..##..
.#..#.##........#
EOF

solve INPUT
