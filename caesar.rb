def is_a_letter(ascii_value)
  ((ascii_value.between?(65, 90)) || (ascii_value.between?(97, 122))) ? true : false
end

def is_uppercase(ascii_value)
  ascii_value.between?(65, 90) ? true : false
end

def caesar_cipher(string, shift_factor)
  real_shift_factor = shift_factor % 26
  char_array = string.split("")
  shifted_chars = char_array.map do |char|
    ascii_value = char.ord
    if is_a_letter(ascii_value)
      if is_uppercase(ascii_value)
        distance_to_end = 90 - ascii_value
        if real_shift_factor > distance_to_end
          shifted_char = (65 + real_shift_factor - distance_to_end - 1).chr
        else
          shifted_char = (ascii_value + real_shift_factor).chr
        end
      else
        distance_to_end = 122 - ascii_value
        if real_shift_factor > distance_to_end
          shifted_char = (97 + real_shift_factor - distance_to_end - 1).chr
        else
          shifted_char = (ascii_value + real_shift_factor).chr
        end
      end
    else
      char
    end
  end
  shifted_chars.join("")
end

puts caesar_cipher("hOla soy justino", 26*30)