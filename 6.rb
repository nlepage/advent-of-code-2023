def solve(input)
  p input
    .split("\n")
    .map { |line| line.split[1..].map(&:to_i) }
    .inject { |times, distances| times.zip(distances) }
    .map { |time, distance| (0..time).count { |push| (time-push)*push > distance } }
    .inject(:*)
  
  p input
    .split("\n")
    .map { |line| line.split(':')[1].delete(' ').to_i }
    .inject { |time, distance| (0..time).count { |push| (time-push)*push > distance } }
end

TEST_INPUT = <<~EOF
Time:      7  15   30
Distance:  9  40  200
EOF

INPUT = <<~EOF
Time:        63     78     94     68
Distance:   411   1274   2047   1035
EOF

solve(TEST_INPUT)
solve(INPUT)
