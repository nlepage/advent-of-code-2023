def ways(time, distance)
  time + 1 - 2 * (time.to_f / 2 - Math.sqrt(time.to_f**2 / 4 - distance) + 1).to_i
end

def solve(input)
  p input
    .split("\n")
    .map { |line| line.split[1..].map(&:to_i) }
    .inject { |times, distances| times.zip(distances) }
    .map { |time, distance| ways time, distance }
    .inject(:*)
  
  p input
    .split("\n")
    .map { |line| line.split(':')[1].delete(' ').to_i }
    .inject { |time, distance| ways time, distance }
end

TEST_INPUT = <<~EOF
Time:      7  15   30
Distance:  9  40  200
EOF

INPUT = <<~EOF
Time:        63     78     94     68
Distance:   411   1274   2047   1035
EOF

solve TEST_INPUT
solve INPUT
