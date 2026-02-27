use_bpm 75

dear_basketball = "C:/Users/justin_tran/Downloads/Dear Basketball - Kobe Bryant [1978-2020].mp3"

# --- Define the Chord Functions ---
define :strum do |note, release|
  use_synth :pluck
  
  with_fx :distortion do
    play note, attack: 0.01, amp: 0.7, release: release, note_slide: 0.25
  end
end

define :sing do |note, sleep|
  play note, release: 0.75, amp: 0.75
  sleep sleep
end

define :play_dmaj7 do |release|
  strum :d3, release
  strum :a3, release
  strum :cs4, release
  strum :fs4, release
end

define :play_am7 do |release|
  strum :a2, release
  strum :e3, release
  strum :g3, release
  strum :c4, release
  strum :e4, release
end

define :play_gmaj7 do |release|
  strum :g2, release
  strum :d3, release
  strum :fs3, release
  strum :b3, release
end

define :play_bbmaj7 do |release|
  strum :bb2, release
  strum :f3, release
  strum :a3, release
  strum :d3, release
  strum :f4, release
end

define :play_bbmaj7_2 do |release|
  strum :bb2, release
  strum :a3, release
  strum :d4, release
  strum :g4, release
end

define :guitar_slap do
  with_fx :distortion do
    sample :perc_snap, amp: 0.125
  end
  sample :drum_snare_soft, amp: 0.6
end

live_loop :chord do
  4.times do
    play_dmaj7 1.5
    sleep 1
    sleep 0.5
    
    play_dmaj7 2
    sleep 1.5
    sleep 1
    
    play_am7 1.5
    sleep 1
    sleep 0.5
    
    play_am7 2
    sleep 1.5
    sleep 1
    
    play_gmaj7 1.5
    sleep 1
    sleep 0.5
    
    play_gmaj7 2
    sleep 1.5
    sleep 1
    
    play_bbmaj7 1.5
    sleep 1
    sleep 0.5
    
    play_bbmaj7_2 2
    sleep 1.5
    sleep 1
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
