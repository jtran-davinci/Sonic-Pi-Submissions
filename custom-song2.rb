use_bpm 60

Cmaj7 = [:c3, :e3, :g3, :b3]
D7    = [:d3, :fs3, :a3, :c4]
F     = [:f3, :a3, :c4]
Fm    = [:f3, :ab3, :c4]
C     = [:c3, :e3, :g3]
C7    = [:c3, :e3, :g3, :bb3]
Em    = [:e3, :g3, :b3]
Am    = [:a3, :c4, :e4]

breathing = "C:/Users/justin_tran/Downloads/Breathing.mp3"
breath_duration = (sample_duration breathing) + (sample_duration breathing)

define :strum do |notes, release_time, amp|
  use_synth :pluck
  
  in_thread do
    notes.each do |note|
      play note, attack: 0.02, amp: amp, release: release_time, coef: 0.6
      sleep 0.03
    end
  end
end

define :guitar_chord do | chord |
  strum chord, 4, 1
  sleep 1
  strum chord, 3, 1
  sleep 0.75
  strum chord, 3, 0.7
  sleep 0.5
  strum chord, 3, 0.7
  sleep 0.25
  strum chord, 4, 1
  sleep 0.5
  strum chord, 3, 1
  sleep 0.25
  strum chord, 3, 0.7
  sleep 0.25
  strum chord, 3, 1
  sleep 0.25
  strum chord, 3, 0.7
  sleep 0.25
end

define :sing do |note, duration|
  play note, release: duration + 0.1, amp: 0.75
  sleep duration
end

with_fx :reverb, room: 0.8, mix: 0.5 do
  with_fx :lpf, cutoff: 90 do
    live_loop :guitar do
      5.times do
        guitar_chord Cmaj7
        guitar_chord D7
        guitar_chord F
        guitar_chord Cmaj7
      end
      sleep breath_duration
      5.times do
        guitar_chord Cmaj7
        guitar_chord D7
        guitar_chord F
        guitar_chord Cmaj7
      end
      stop
    end
  end
end

sleep 12

# flats: g, a, b, d, e

live_loop :vocal do
  sleep 3.75
  sing 64, 0.25
  
  # measure 1
  sing 64, 0.25
  sing 64, 0.25
  sing 64, 0.25
  sing 64, 0.25
  sing 64, 0.25
  sing 62, 0.25
  sing 60, 0.25
  sing 55, 1.5
  sing 60, 0.25
  sing 69, 0.25
  sing 64, 4.25
  
  # measure 2
  sing 64, 0.25
  sing 64, 0.25
  sing 64, 0.25
  sing 64, 0.25
  sing 64, 0.25
  sing 62, 0.25
  sing 60, 0.25
  sing 57, 1.5
  sing 60, 0.25
  sing 67, 0.25
  sing 59, 4.25
  
  # measure 3
  sing 64, 0.25
  sing 64, 0.25
  sing 64, 0.25
  sing 64, 0.25
  sing 64, 0.25
  sing 62, 0.25
  sing 60, 0.25
  sing 55, 1.25
  sing 67, 0.25
  sing 69, 0.5
  sing 64, 1.25
  sing 67, 0.25
  sing 69, 0.5
  sing 64, 0.5
  sing 60, 1.75
  sing 68, 4
  
  # measure 4
  sing 67, 4
  
  # measure 5
  sing 67, 0.25
  sing 69, 0.5
  sing 71, 0.5
  sing 72, 0.5
  sing 76, 0.5
  sing 67, 0.5
  sing 69, 0.5
  sing 67, 0.5
  sing 66, 0.5
  sing 81, 0.5
  sing 79, 0.5
  sing 81, 0.5
  sing 76, 0.5
  sing 72, 1.75
  
  # measure 6
  sing 67, 0.25
  sing 69, 0.5
  sing 71, 0.5
  sing 72, 0.5
  sing 76, 0.5
  sing 67, 0.5
  sing 69, 0.5
  sing 71, 0.5
  sing 69, 0.5
  sing 76, 0.5
  sing 74, 0.5
  sing 76, 0.5
  sing 71, 0.5
  sing 67, 1.75
  
  # measure 7
  sing 67, 0.25
  sing 69, 0.5
  sing 71, 0.5
  sing 72, 0.5
  sing 76, 0.5
  sing 67, 0.5
  sing 69, 0.5
  sing 67, 0.5
  sing 66, 0.5
  sing 81, 0.5
  sing 79, 0.5
  sing 81, 0.5
  sing 76, 0.5
  sing 72, 1.75
  sing 65, 4
  
  # measure 8
  sing 64, 3.5
  
  # measure 9
  sleep breath_duration
  sing 67, 0.25
  sing 76, 1.75
  sing 67, 0.25
  sing 76, 1
  sing 67, 0.25
  sing 67, 0.25
  sing 69, 0.5
  sing 74, 1.75
  sing 69, 0.25
  sing 74, 1.75
  sing 69, 0.25
  sing 74, 2.25
  sing 67, 0.75
  sing 69, 0.5
  sing 67, 0.5
  sing 76, 0.75
  sing 74, 0.25
  sing 72, 2.75
  
  # measure 9
  sing 67, 0.25
  sing 75, 1.75
  sing 67, 0.25
  sing 75, 1.75
  sing 69, 0.25
  sing 74, 1.75
  sing 69, 0.25
  sing 74, 1.25
  sing 69, 0.25
  sing 79, 0.5
  sing 76, 0.5
  sing 72, 0.5
  sing 72, 0.5
  sing 69, 0.5
  sing 69, 1.25
  sing 69, 0.25
  sing 79, 0.5
  sing 75, 0.75
  sing 72, 0.25
  sing 72, 3.25
  
  # measure 10
  sing 76, 1.5
  sing 74, 2.5
  
  # measure 11
  sing 72, 0.5
  sing 74, 0.5
  sing 76, 0.5
  sing 69, 2.5
  
  # measure 12
  sing 72, 0.5
  sing 74, 0.5
  sing 76, 0.5
  sing 69, 1.5
  sing 76, 0.5
  sing 67, 4.5
  
  stop
end

sleep 4

live_loop :piano do
  use_synth :piano
  
  4.times do
    play_chord Cmaj7, amp: 3, hard: 0.5, release: 4
    sleep 4
    play_chord D7, amp: 3, hard: 0.5, release: 4
    sleep 4
    play_chord F, amp: 3, hard: 0.5, release: 4
    sleep 4
    play_chord Cmaj7, amp: 3, hard: 0.5, release: 4
    sleep 4
  end
  sleep breath_duration
  4.times do
    play_chord Cmaj7, amp: 3, hard: 0.5, release: 4
    sleep 4
    play_chord D7, amp: 3, hard: 0.5, release: 4
    sleep 4
    play_chord F, amp: 3, hard: 0.5, release: 4
    sleep 4
    play_chord Cmaj7, amp: 3, hard: 0.5, release: 4
    sleep 4
  end
  stop
end

sleep 16

live_loop :bass do
  use_synth :fm
  use_synth_defaults divisor: 1, depth: 1, attack: 0.1, release: 3
  
  3.times do
    play :c2, amp: 0.8
    sleep 4
    play :d2, amp: 0.8
    sleep 4
    play :f2, amp: 0.8
    sleep 4
    play :c2, amp: 0.8
    sleep 4
  end
  sleep breath_duration
  3.times do
    play :c2, amp: 0.8
    sleep 4
    play :d2, amp: 0.8
    sleep 4
    play :f2, amp: 0.8
    sleep 4
    play :c2, amp: 0.8
    sleep 4
  end
  stop
end

live_loop :drums do
  12.times do
    sample :drum_snare_soft, amp: 0.6
    sleep 0.5
    
    sample :drum_snare_soft, amp: 0.4
    sleep 0.5
    
    sample :drum_cymbal_closed, amp: 0.75
    sample :drum_snare_soft, amp: 0.6
    sleep 0.5
    
    sample :drum_snare_soft, amp: 0.4
    sleep 0.25
    
    sample :drum_snare_soft, amp: 0.4
    sleep 0.25
    
    sample :drum_snare_soft, amp: 0.6
    sleep 0.5
    
    sample :drum_snare_soft, amp: 0.4
    sleep 0.5
    
    sample :drum_cymbal_closed, amp: 0.75
    
    sample :drum_snare_soft, amp: 0.6
    sleep 0.5
    
    sample :drum_snare_soft, amp: 0.4
    sleep 0.5
  end
  sleep breath_duration
  12.times do
    sample :drum_snare_soft, amp: 0.6
    sleep 0.5
    
    sample :drum_snare_soft, amp: 0.4
    sleep 0.5
    
    sample :drum_cymbal_closed, amp: 0.75
    sample :drum_snare_soft, amp: 0.6
    sleep 0.5
    
    sample :drum_snare_soft, amp: 0.4
    sleep 0.25
    
    sample :drum_snare_soft, amp: 0.4
    sleep 0.25
    
    sample :drum_snare_soft, amp: 0.6
    sleep 0.5
    
    sample :drum_snare_soft, amp: 0.4
    sleep 0.5
    
    sample :drum_cymbal_closed, amp: 0.75
    
    sample :drum_snare_soft, amp: 0.6
    sleep 0.5
    
    sample :drum_snare_soft, amp: 0.4
    sleep 0.5
  end
  stop
end

sleep 48
sample breathing, amp: 10
sleep sample_duration breathing
sample breathing, amp: 10
