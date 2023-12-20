def parse(input)
  modules = input.split("\n").map { |line|
    sinput,soutputs = line.split ' -> '
    [sinput=='broadcaster' ? sinput : sinput[1..], [sinput[0], soutputs.split(', '), sinput[0] == '%' ? false : {}]]
  }.to_h

  modules.entries.each { |k,m| m[1].each { |o| modules[o] = ['>',[]] if !modules.include?(o); modules[o][2][k] = false if modules[o][0] == '&' } }

  modules
end

def push(modules)
  queue = modules['broadcaster'][1].map { |o| [o,false,'broadcaster'] }
  highs = 0
  lows = modules['broadcaster'][1].length+1
  
  while !queue.empty?
    i,pu,o = queue.shift
    # puts "#{o} -#{pu ? 'high' : 'low'}-> #{i}"
    m = modules[i]
    case m[0]
    when '%'
      next if pu
      m[2] = !m[2]
      queue.push(*m[1].map { |o| [o,m[2],i] })
      highs += m[1].length if m[2]
      lows += m[1].length unless m[2]
    when '&'
      m[2][o] = pu
      opu = !m[2].each_value.all?
      queue.push(*m[1].map { |o| [o,opu,i] })
      highs += m[1].length if opu
      lows += m[1].length unless opu
    end
  end

  [highs,lows]
end

def solve(input)
  modules = parse input

  allHighs,allLows=0,0

  for i in 0...1000
    highs,lows = push modules
    allHighs += highs
    allLows += lows
  end

  p allHighs*allLows
end

TEST1 = <<~EOF
broadcaster -> a, b, c
%a -> b
%b -> c
%c -> inv
&inv -> a
EOF

solve TEST1

TEST2 = <<~EOF
broadcaster -> a
%a -> inv, con
&inv -> b
%b -> con
&con -> output
EOF

solve TEST2

INPUT = <<~EOF
%nr -> mr
&sx -> zh
%rk -> dc, bl
%lx -> rs
%hx -> bl
%hp -> bj
%dk -> mr, lf
%hc -> xc
%bj -> vv, rd
&jt -> zh
&bl -> ks, kn, dc, hc, zk
&zh -> rx
%sp -> hz, bl
%rd -> vv, tp
%cg -> dk
%rg -> jl, pv
%jl -> js
%fb -> vv, zd
%gv -> lx
%lr -> vj, bl
%vz -> hc, bl
%kn -> bl, zk
%rj -> mr, nr
%cn -> pv, sb
%rs -> vv, hp
&mr -> qc, kb, gc, vl, bs, cg, lf
%rb -> qj
%sm -> bv, vv
%dh -> rg
%zk -> vz
%qj -> xs, pv
%ng -> ql, pv
%vj -> bl, sp
&kb -> zh
%sb -> pv
%vl -> mr, cz
%dc -> lr
%xc -> rk, bl
%cz -> cg, mr
%hz -> bl, hx
%xs -> pv, cn
%js -> ng
%cb -> mr, nc
%qb -> vv
%gc -> qc
%bv -> qb, vv
broadcaster -> kn, fb, ln, vl
%bs -> cb
%lf -> gc
%nc -> mr, rj
%ln -> pv, dh
%qc -> bs
&vv -> zd, jt, fb, hp, gv, lx
&ks -> zh
%ql -> rb
%tp -> sm, vv
&pv -> sx, dh, jl, ln, js, rb, ql
%zd -> gv
EOF

solve INPUT
