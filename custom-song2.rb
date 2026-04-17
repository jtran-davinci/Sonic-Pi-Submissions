use_bpm 60

Cmaj7 = [:c3, :e3, :g3, :b3]
D7 = [:d3, :fs3, :a3, :c4]
F = [:f3, :a3, :c4]
Fm = [:f3, :ab3, :c4]
C = [:c3, :e3, :g3]
C7 = [:c3, :e3, :g3, :bb3]
Em = [:e3, :g3, :b3]
Am = [:a3, :c4, :e4]

breathing = "C:/Users/justin_tran/Downloads/Breathing.mp3"
breathing_amp = 10
breath_duration = (sample_duration breathing) + (sample_duration breathing)

melody_notes_p1 = [64, 64, 64, 64, 64, 64, 62, 60, 55, 60, 69, 64, 64, 64, 64, 64, 64, 62, 60, 57, 60, 67, 59, 64, 64, 64, 64, 64, 62, 60, 55, 67, 69, 64, 67, 69, 64, 60, 68, 67, 67, 69, 71, 72, 76, 67, 69, 67, 66, 81, 79, 81, 76, 72, 67, 69, 71, 72, 76, 67, 69, 71, 69, 76, 74, 76, 71, 67, 67, 69, 71, 72, 76, 67, 69, 67, 66, 81, 79, 81, 76, 72, 65, 64]
melody_sleeps_p1 = [0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 1.5, 0.25, 0.25, 4.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 1.5, 0.25, 0.25, 4.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 1.25, 0.25, 0.5, 1.25, 0.25, 0.5, 0.5, 1.75, 4, 4, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1.75, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1.75, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1.75, 4, 3.5]

melody_notes_p2 = [67, 76, 67, 76, 67, 67, 69, 74, 69, 74, 69, 74, 67, 69, 67, 76, 74, 72, 67, 75, 67, 75, 69, 74, 69, 74, 69, 79, 76, 72, 72, 69, 69, 69, 79, 75, 72, 72]
melody_sleeps_p2 = [0.25, 1.75, 0.25, 1, 0.25, 0.25, 0.5, 1.75, 0.25, 1.75, 0.25, 2.25, 0.75, 0.5, 0.5, 0.75, 0.25, 2.75, 0.25, 1.75, 0.25, 1.75, 0.25, 1.75, 0.25, 1.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 1.25, 0.25, 0.5, 0.75, 0.25, 3.25]

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

define :drum_beat do
  smallamp = 0.2
  medamp = 0.4
  symbamp = 0.5
  12.times do
    sample :drum_snare_soft, amp: medamp
    sleep 0.5
    
    sample :drum_snare_soft, amp: smallamp
    sleep 0.5
    
    sample :drum_cymbal_closed, amp: symbamp
    sample :drum_snare_soft, amp: medamp
    sleep 0.5
    
    sample :drum_snare_soft, amp: smallamp
    sleep 0.25
    
    sample :drum_snare_soft, amp: smallamp
    sleep 0.25
    
    sample :drum_snare_soft, amp: medamp
    sleep 0.5
    
    sample :drum_snare_soft, amp: smallamp
    sleep 0.5
    
    sample :drum_cymbal_closed, amp: symbamp
    
    sample :drum_snare_soft, amp: medamp
    sleep 0.5
    
    sample :drum_snare_soft, amp: smallamp
    sleep 0.5
  end
end

define :sing do |note, duration|
  play note, release: duration + 0.1, amp: 0.75
  sleep duration
end

define :guitarchordprog do
  guitar_chord Cmaj7
  guitar_chord D7
  guitar_chord F
  guitar_chord Cmaj7
end

define :bass_chord do
  play :c2, amp: 0.8
  sleep 4
  play :d2, amp: 0.8
  sleep 4
  play :f2, amp: 0.8
  sleep 4
  play :c2, amp: 0.8
  sleep 4
end

define :pianochord do
  play_chord Cmaj7, amp: 3, hard: 0.5, release: 4
  sleep 4
  play_chord D7, amp: 3, hard: 0.5, release: 4
  sleep 4
  play_chord F, amp: 3, hard: 0.5, release: 4
  sleep 4
  play_chord Cmaj7, amp: 3, hard: 0.5, release: 4
  sleep 4
end

define :whine do |note, duration|
  use_synth :saw
  
  play note,
    attack: duration * 0.05,
    sustain: duration * 0.85,
    release: duration * 0.1,
    vibrato_rate: 6,
    vibrato_depth: 0.15,
    cutoff: 80,
    amp: 0.5
  
  sleep duration
end

with_fx :reverb, room: 0.8, mix: 0.5 do
  with_fx :lpf, cutoff: 90 do
    live_loop :guitar do
      5.times do
        guitarchordprog
      end
      sleep breath_duration
      4.times do
        guitarchordprog
      end
      stop
    end
  end
end

sleep 12

# flats: g, a, b, d, e

live_loop :vocal do
  sleep 3.75
  
  p1_index = 0
  melody_notes_p1.each do
    sing melody_notes_p1[p1_index], melody_sleeps_p1[p1_index]
    p1_index = p1_index + 1
  end
  
  sleep breath_duration
  
  p2_index = 0
  melody_notes_p2.each do
    sing melody_notes_p2[p2_index], melody_sleeps_p2[p2_index]
    p2_index = p2_index + 1
  end
  
  # measure 10
  whine 76, 1.5
  whine 74, 2.5
  
  # measure 11
  whine 72, 0.5
  whine 74, 0.5
  whine 76, 0.5
  whine 69, 2.5
  
  # measure 12
  whine 72, 0.5
  whine 74, 0.5
  whine 76, 0.5
  whine 69, 1.5
  whine 76, 0.5
  whine 67, 4.5
  
  stop
end

sleep 4

live_loop :piano do
  use_synth :piano
  
  4.times do
    pianochord
  end
  sleep breath_duration
  4.times do
    pianochord
  end
  
  stop
end

sleep 16

live_loop :bass do
  use_synth :fm
  use_synth_defaults divisor: 1, depth: 1, attack: 0.1, release: 3
  
  3.times do
    bass_chord
  end
  sleep breath_duration
  3.times do
    bass_chord
  end
  
  stop
end

live_loop :drums do
  drum_beat
  sleep breath_duration
  drum_beat
  stop
end

sleep 48
sample breathing, amp: breathing_amp
sleep sample_duration breathing
sample breathing, amp: breathing_amp
