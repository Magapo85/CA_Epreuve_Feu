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

#fonction pour trouver un caractere dans un array, comme .index()
def trouverDansArray(carac, array)
        sortie = "ok"
        index = longueurArgument(array)
        i = 0
        while i < longueurArgument(array) && sortie == "ok"
                if array[i] == carac
                        sortie = "erreur"
                        index = i
                end
                i = i + 1
        end
        return index, sortie
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
	count = 0
	while array[i] && sortie == "ok"
		count = 0
		if array[i] == "("
			count += 1
		elsif array[i] == "("
			count -= 1
		end		
		i = i + 1
	end
	i = 0
	new = ""
	while array[i] && sortie == "ok"
		if array[i] != " "
			new = new + array[i]
		end
	end
	i = 0
	while new[i] && sortie == "ok"
		if (i == 0 && trouverDansArray(new[i], arrayCheck[2..8])[1] == "erreur") || (!new[i+1] && trouverDansArray(new[i], arrayCheck[3..8].push(arrayCheck[1]))[1] == "erreur")
			sortie = "erreur"
		else
			if new[i] == "(" && (trouverDansArray(new[i-1], arrayCheck[8..-1])[1] == "erreur" || trouverDansArray(new[i+1], arrayCheck[2..8])[1] == "erreur")
                                sortie == "erreur"
                        end
                        if new[i] == ")" && (trouverDansArray(new[i-1], arrayCheck[1..8].delete_at(1))[1] == "erreur" || trouverDansArray(new[i+1], arrayCheck[8..-1])[1] == "erreur")
                                sortie == "erreur"
                        end
			if (new[i] == "+" || new[i] == "-" || new[i] == "*" || new[i] == "/" || new[i] == "%") && (trouverDansArray(new[i-1], arrayCheck[1..8].delete_at(1))[1] == "erreur" || trouverDansArray(new[i+1], arrayCheck[2..8])[1] == "erreur")
                                sortie == "erreur"
                        end
			if new[i] == "." && (trouverDansArray(new[i-1], arrayCheck[1..8])[1] == "erreur" || trouverDansArray(new[i+1], arrayCheck[1..8])[1] == "erreur")
                                sortie == "erreur"
                        end
		end
	end
	if count != 0 && sortie == "ok"
		sortie = "erreur"
	end
        return sortie, new
end

def calcul(formule)
	resultat = 0

	return resultat
end

goodSyntaxElement = [" ", "(", ")", "+", "-", "*", "/", "%", ".", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
#coeur du programme
sortie, new = testArgument(ARGV[0], goodSyntaxElement)
if longueurArgument(ARGV) != 1 || longueurArgument(ARGV[0]) < 3 || sortie == "erreur"
	puts "error"
else
	puts "calcul en cours..."
	puts new + " = " + calcul(new)
end
