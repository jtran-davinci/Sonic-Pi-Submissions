counter=36
use_bpm 120

49.times do
  print(counter)
  play counter, amp: 0.5
  sleep 0.3
  counter=counter+1
end

49.times do
  print(counter)
  play counter
  sleep 0.125
  counter=counter-1
end
