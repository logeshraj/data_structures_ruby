def url_shortener(string)
  map = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  str_hash = string.hash
  short_url = ''
  n = str_hash
  while (n != 0 && n != -1) do
    short_url += map[n%62];
    n = n/62;
  end
  short_url.reverse 
end

puts url_shortener("abcdefgh")
puts url_shortener("abcdefghij")
puts url_shortener("abcdefghijkl")
puts url_shortener("abcdefghij2974i2hrkwnfkwhifgw")



def trim_protocol(string)
  string.sub(/https?:\/\//,'').sub(/w{3}./, '')
end



puts trim_protocol('google.com')

puts trim_protocol('www.google.com')

puts trim_protocol('http://google.com')

puts trim_protocol('http://www.google.com')

puts trim_protocol('https://google.com')

puts trim_protocol('https://www.google.com')