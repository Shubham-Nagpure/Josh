print"Enter Grade:"
grade=gets.chomp.to_i

level = case grade
        when 1..5 then "elementry"
        when 6..8 then "middle school"
        when 9..12 then "high school"
        else "college"
        end

puts level

