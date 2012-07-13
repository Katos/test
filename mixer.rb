
def max_min(tab)
	min=-1
	max=-1
	tab.each do |i|
		if  max==-1 || (i.length)>max 
			max=i.length
			
		end
		if  min==-1 || (i.length)<min
		       min=i.length
		end
	end
	
	return max,min
end	

			


def mixer(string)


	s1=string
	il_zam=0
	il_dom=0
	dl=0
	dl_max=0
	dl_min=0
	i=0
	il_zam=s1.count"{"
	il_dom=s1.count"}"
	if il_zam != il_dom
	wynik="Niezgodnosc w ilosci nawiasow { }"
	
	else
	s1=s1.gsub('{','}')

	s2=s1.split("}")    #  s2=s1.split(/{[^}]+}/) 
	
	s2.each do |j|

		z=j.split("|")
		tmp_min,tmp_max = max_min(z)
		s2[i]=z[rand(z.size())]      #wybrnaie losowego odcinka,
		dl=dl+s2[i].size
		dl_max=dl_max+tmp_max
		dl_min=dl_min+tmp_min
		i=i+1

	end
	wynik=""
	s2.each do |j|
		wynik=wynik+j
	end
	end
   return wynik,dl,dl_max,dl_min # wynik,dlugosc zdania, maksymalna dlugosc zdania, minimalna dlugosc zdania
	
end


wynik,dl,dl_max,dl_min=mixer("To jest {przykladnowe|nowe} {zdanie|fraza} utworzony w mixerze")

puts wynik
puts dl
puts dl_max
puts dl_min



