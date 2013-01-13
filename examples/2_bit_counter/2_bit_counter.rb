require 'pi_piper'

puts "Press the switch to get started"
pin17 = PiPiper::Pin.new(:pin => 17, :direction => :out)
pin27 = PiPiper::Pin.new(:pin => 27, :direction => :out)

pin17.off
pin27.off

sum = 0

PiPiper.watch :pin => 22, :trigger => :rising do |pin|
  sum = sum + 1
  display = sum % 4
  puts sum 
  if display == 2 or display == 3
    pin17.on
  else
    pin17.off
  end
  if display == 1 or display == 3
    pin27.on
  else
    pin27.off
  end
end

PiPiper.wait
