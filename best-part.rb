use_bpm 75

dear_basketball = "C:/Users/justin_tran/Downloads/Dear Basketball - Kobe Bryant [1978-2020].mp3"
vocal = "C:/Users/justin_tran/Downloads/Daniel Caesar ft H.E.R - Best Part (AcapellaVocals Only).mp3"
vocal_amp = 1

# Chords
dmaj7 = [:d3,:a3,:cs4,:fs4]
am7 = [:a2,:e3,:g3,:c4,:e4]
gmaj7 = [:g2,:d3,:fs3,:b3]
bbmaj7 = [:bb2,:f3,:a3,:d3,:f4]
bbmaj7_2 = [:bb2,:a3,:d4,:g4]

define :strum do |notes, release|
  use_synth :pluck
  
  notes.each do | note |
    with_fx :distortion do
      play note, attack: 0.01, amp: 0.7, release: release, note_slide: 0.25
    end
  end
end

define :sing do |note, sleep|
  play note, release: 0.75, amp: 0.75
  sleep sleep
end

define :guitar_slap do
  with_fx :distortion do
    sample :perc_snap, amp: 0.125
  end
  sample :drum_snare_soft, amp: 0.6
end

live_loop :chord do
  4.times do
    strum(dmaj7, 1.5)
    sleep 1.5
    
    strum(dmaj7, 2)
    sleep 2.5
    
    strum(am7, 1.5)
    sleep 1.5
    
    strum(am7, 2)
    sleep 2.5
    
    strum(gmaj7, 1.5)
    sleep 1.5
    
    strum(gmaj7, 2)
    sleep 2.5
    
    strum(bbmaj7, 1.5)
    sleep 1.5
    
    strum(bbmaj7_2, 2)
    sleep 2.5
  end
  stop
end

sleep 16

live_loop :sample do
  sample dear_basketball, amp: 3
  stop
end

live_loop :guitar_slap do
  3.times do
    sleep 1
    
    7.times do
      guitar_slap
      sleep 2
    end
    
    guitar_slap
    sleep 1
  end
  stop
end

sleep 16

live_loop :melody do
  1.times do
    use_synth :sine
    
    sleep 1.5
    sing :d4, 0.25
    sing :e4, 0.25
    sing :fs4, 0.5
    sing :d4, 1.5
    
    sleep 1.5
    sing :d4, 0.25
    sing :e4, 0.25
    sing :fs4, 0.5
    sing :e4, 1.5
    
    sleep 1.25
    sing :b3, 0.25
    sing :d4, 0.25
    sing :e4, 0.25
    sing :fs4, 0.5
    sing :d4, 1
    sing :b3, 0.25
    sing :d4, 0.25
    
    sing :f4, 0.25
    sing :e4, 0.25
    sing :e4, 3.5
    
    sleep 1.5
    sing :d4, 0.25
    sing :e4, 0.25
    sing :fs4, 0.5
    sing :d4, 1.5
    
    sleep 1
    sing :f3, 0.25
    sing :a3, 0.25
    sing :c4, 0.25
    sing :d4, 0.25
    sing :fs4, 0.5
    sing :e4, 1.5
    
    sleep 1.5
    sing :d4, 0.25
    sing :e4, 0.25
    sing :fs4, 0.5
    sing :d4, 0.5
    
    sing :g4, 0.25
    sing :a4, 0.25
    sing :g4, 0.25
    sing :g4, 3.25
  end
  stop
end

sleep 30.5

4.times do
  sample vocal, amp: vocal_amp
  vocal_amp = vocal_amp - 0.25
  sleep 1
end
