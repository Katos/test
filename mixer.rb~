#encoding: utf-8

def max_min(tab)
	min=-1
	max=-1
	tab.each do |i|
		if  max==-1 or (i.length)>max 
			max=i.length
			
		end
		if  min==-1 or (i.length)<min
		       min=i.length
		end
	end
	
	return max,min
end	

def mixer(string)

	s1=string

	il_zam=0
	il_dom=0
	il_zam2=0
	il_dom2=0
	dl=0
	dl_max=0
	dl_min=0

	il_zam=s1.count"{"
	il_dom=s1.count"}"
	il_zam2=s1.count"["
	il_dom2=s1.count"]"

	if il_zam != il_dom
		wynik="Niezgodnosc w ilosci nawiasow { }"

	elsif il_zam2 != il_dom2
		wynik="Niezgodnosc w ilosci nawiasow [ ]"
	else
	dl=dl_max=dl_min=s1.size


        #                        SPRAWDZANIE \n\n
	if s1.include? "\n\n"
		tab_wyc=s1.split("\n\n")
		tab_wyc.shuffle!  
		tab_wyc.each do |j|
			j=j+"\n\n"
		end
		tab_wyc[tab_wyc.size-1].chomp! 
		s1=""
		tab_wyc.each do |j|
			s1=s1+j
		end
	end	




	#                        SPRAWDZANIE  [ ]
	until s1.slice(/\[.+\]/).nil?
 		wyc=s1.slice(/\[.+\]/)

		dl=dl-wyc.size
		dl_max=dl_max-wyc.size
		dl_min=dl_min-wyc.size
		poz=s1.index(wyc)
		s1.slice!(/\[.+\]/)
		wyc=wyc[1..-2]

		
		begin

			tab_wyc=wyc.split("|")
			tab_wyc.shuffle!  
			wyc=""
			tab_wyc.each do |j|
				wyc=wyc+j
			end
			dl=dl+wyc.size
			dl_max=dl_max+wyc.size
			dl_min=dl_min+wyc.size
			s1.insert(poz, wyc)

		rescue
  			puts "Blad: #{$!}"
		end
	end

	


	#                        SPRAWDZANIE  { }
	until s1.slice(/{[^}]+}/).nil?
 		wyc=s1.slice(/{[^{.+}]+}/)
		dl=dl-wyc.size
		dl_max=dl_max-wyc.size
		dl_min=dl_min-wyc.size
		poz=s1.index(wyc)
		s1.slice!(/{[^{.+}]+}/)	 
		wyc=wyc[1..-2]

		
		begin
			if wyc[-1, 1]=="|"  
				tab_wyc=wyc.split("|")
				tab_wyc[tab_wyc.size]=""
			else
				tab_wyc=wyc.split("|")
			end
			tmp_min,tmp_max = max_min(tab_wyc)
			wyc=tab_wyc[rand(tab_wyc.size())]      #random synonimu
			dl=dl+wyc.size
			dl_max=dl_max+tmp_max
			dl_min=dl_min+tmp_min
			s1.insert(poz, wyc)
		rescue
  			puts "Blad: #{$!}"
		end
	end

	end	



   return wynik,dl,dl_max,dl_min
	
end


