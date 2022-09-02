#!/usr/bin/env ruby

#programme qui recoit une expression arithmetique dans une chaine de caracteres et en retourne le resultat apres l'avoir calculee. Vous devez gerer les 5 operateurs suivants : +â-â* /â% (le modulo), affiche error sinon

require 'bigdecimal'
require 'bigdecimal/util' #to_d

#fonction utile qui mesure la longueur d'une array ou string comme .length()
def longueurArgument(mot)
        i = 0
        while mot[i]
                i += 1
        end
        return i
end

#fonction utile qui verifie la syntaxe du calcul
def testArgument(array, arrayCheck)
        i = 0
	a = 0
        sortie = "ok"
        while array[i] && sortie == "ok"
		a = 0
		sortie = "erreur" 
		while arrayCheck[a] && sortie == "erreur"
                	if array[i] == arrayCheck[a]
                        	sortie = "ok"
                	end
			a = a + 1
		end
    		i = i + 1
        end
	i = 0
	while array[i] && sortie == "ok"
		
		i = i + 1
	end
        return sortie
end

goodSyntaxElement = [" ", ".", "(", ")", "+", "-", "*", "/", "%", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
#coeur du programme
if longueurArgument(ARGV) != 1 || testArgument(ARGV[0], goodSyntaxElement) == "erreur"
	puts "error"
else
	puts "calcul en cours"
end
