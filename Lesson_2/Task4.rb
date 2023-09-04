vowels = {}
index = 0
for letter in ('a'...'z')
    if letter == 'a' || letter == 'e' ||  letter == 'i' || letter == 'o' || letter == 'u'
        vowels[letter] = index
    end
index += 1
end
puts vowels