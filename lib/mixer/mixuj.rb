#encoding: UTF-8

class Mixer::Mixuj
#private
	attr_accessor :dl, :input, :output, :error, :dl_max, :dl_min 
public	
def initialize(string)
    @input = string
	@dl=string.size
	@dl_max=string.size
	@dl_min=string.size
  end

def valid(string)

	s1=string
	il_zam=0
	il_dom=0
	il_zam2=0
	il_dom2=0

	il_zam=s1.count"{"
	il_dom=s1.count"}"
	il_zam2=s1.count"["
	il_dom2=s1.count"]"
	
	if s1.empty?
		@error="Brak tekstu"
		return false
	end
	if il_zam != il_dom
		@error="Niezgodnosc w ilosci nawiasow { }"
		return false
	end
	if il_zam2 != il_dom2
		@error="Niezgodnosc w ilosci nawiasow [ ]"
		return false
	end
	if il_zam==0 and il_zam2==0 and s1.include? "|"
		@error="wystapilo | pomimmo bralu nawiasow [] lub {}"
		return false
	end
	if s1.include? "{}"
		@error="pusty { }"
		return false
	end
	if s1.include? "[]"
		@error="pusty [ ]"
		return false
	end
  
  s1.slice(/<a href=[^.+<\/a>]+<\/a>/)
  for i in 0..s1.size
    for j in i+1..s1.size
      if s1[i]==s1[j]
        		@error="brak unikalnych linkow"
		        return false
      end
    end
  end
  
	#if not s1.slice(/{*[^{]*}*\|.*{/).nil? #(/{[^{]+}+|.+{/
	#	puts s1.slice(/{*[^{]*}*\|.*{/)
	#	@error="wystapilo | przed po za  {}"
	#	return false
	#end

	return true
end

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

def mixuj(s1)

	valid(s1)
	if not valid(s1)
		return error
	else
	


        #                        SPRAWDZANIE paragrafow
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

		@dl=dl-wyc.size
		@dl_max=dl_max-wyc.size
		@dl_min=dl_min-wyc.size
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
			@dl=dl+wyc.size
			@dl_max=dl_max+wyc.size
			@dl_min=dl_min+wyc.size
			s1.insert(poz, wyc)

		rescue
  			puts @error="Blad: #{$!}"
		end
	end

	


	#                        SPRAWDZANIE  { }
	until s1.slice(/{[^}]+}/).nil?
 		wyc=s1.slice(/{[^{.+}]+}/)
		@dl=dl-wyc.size
		@dl_max=dl_max-wyc.size
		@dl_min=dl_min-wyc.size
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
			@dl=dl+wyc.size
			@dl_max=dl_max+tmp_max
			@dl_min=dl_min+tmp_min
			s1.insert(poz, wyc)
		rescue
  			puts @error="Blad: #{$!}"
		end
	end
	wynik=""
	wynik=s1
	@output=wynik
   return output   #,dl,dl_max,dl_min
	
	end
	end
end
