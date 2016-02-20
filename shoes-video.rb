require 'green_shoes'

Shoes.app width: 400, height: 300 do
  background gold..cyan, angle: 90
  space = ' ' * 3
  v = video 'http://is.gd/xZ6Jih'
  links = para space,
  link('play'){v.play; links.move(0, 300)},
  space, link('pause'){v.pause},
  space, link('-1sec'){v.time -= 1000},
  space, link('+1sec'){v.time += 1000},
  top: 250
  msg = para left: 250, top: 300
  every do
    msg.text = fg("#{(v.position*100).to_i}% " +
                  "(#{v.time/1000}/#{v.length.to_i/1000}sec)",
                  darkcyan)
  end
end
