class Mixer
  def self.mixuj(napis)
    napis="{{{wow|now}|tram|xx}| zram} "
    mix = Mixuj.new(napis)
    return mix
  end
end

require 'mixer/mixuj'