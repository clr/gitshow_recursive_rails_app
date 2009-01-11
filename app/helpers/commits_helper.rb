module CommitsHelper

  def diff_to_html( diff )
    rows = []
    line_number_a = 1
    line_number_b = 1
    space = "&nbsp;"
    diff.split( "\n").each do |line|
      case line
      when /^(\-\-\-)/
      when /^(\+\+\+)/
      when /^(\-)/
        rows << [ 'minus', line_number_a = line_number_a.next, space, html_escape( line[ 1, line.length ] ) ]
      when /^(\+)/
        rows << [ 'plus', space, line_number_b = line_number_b.next, html_escape( line[ 1, line.length ] ) ]
      when /^(@@ \-)(\d+),(\d+) \+(\d+),(\d+) (@@)$/
        line_numbers = line.match /^(@@ \-)(\d+),(\d+) \+(\d+),(\d+) (@@)$/
        line_number_a = ( line_numbers[2].to_i - 1 ).to_s
        line_number_b = ( line_numbers[4].to_i - 1 ).to_s
      else
        rows << [ 'normal', line_number_a = line_number_a.next, line_number_b = line_number_b.next, html_escape( line ) ]
      end
    end
    return "<table>#{ rows.collect{ |row| "<tr class=\"#{ row[0] }\"><td class=\"line_number\">#{ row[1].to_s }</td><td class=\"line_number\">#{ row[2].to_s }</td><td><pre>#{ row[3].to_s }</pre></td></tr>" } * '' }</table>"
  end
end
