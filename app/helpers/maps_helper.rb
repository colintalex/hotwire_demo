module MapsHelper
   def to_dms(degrees, type)
    # Determine hemisphere (N/S for latitude, E/W for longitude)
    hemisphere = if type == 'lat'
                   degrees >= 0 ? 'N' : 'S'
                 else
                   degrees >= 0 ? 'E' : 'W'
                 end

    # Get the absolute value for calculations
    degrees_abs = degrees.abs
    d = degrees_abs.to_i
    minutes_full = (degrees_abs - d) * 60
    m = minutes_full.to_i
    s = ((minutes_full - m) * 60).round(2)

    "#{d}° #{m}' #{s}\" #{hemisphere}"
  end
end
