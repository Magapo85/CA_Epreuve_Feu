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
		if array[i] == "("
			count += 1
		elsif array[i] == ")"
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
		i += 1
	end
	i = 0
	while new[i] && sortie == "ok"
		if (i == 0 && trouverDansArray(new[i], arrayCheck[2..8])[1] == "erreur") || (!new[i+1] && trouverDansArray(new[i], arrayCheck[3..8].push(arrayCheck[1]))[1] == "erreur")
			sortie = "erreur"
			#puts "df"
		end
		if i != 0 && new[i+1]
			if new[i] == "(" && (trouverDansArray(new[i-1], arrayCheck[8..-1])[1] == "erreur" || trouverDansArray(new[i+1], arrayCheck[2..8])[1] == "erreur")
				#puts "("
                                sortie = "erreur"
                        end
                        if new[i] == ")" && (trouverDansArray(new[i-1], arrayCheck[3..8].push(arrayCheck[1]))[1] == "erreur" || trouverDansArray(new[i+1], arrayCheck[8..-1])[1] == "erreur")
				#puts ")"
                                sortie = "erreur"
                        end
			if (new[i] == "+" || new[i] == "-" || new[i] == "*" || new[i] == "/" || new[i] == "%") && (trouverDansArray(new[i-1], arrayCheck[3..8].push(arrayCheck[1]))[1] == "erreur" || trouverDansArray(new[i+1], arrayCheck[2..8])[1] == "erreur")
				#puts "add"
                                sortie = "erreur"
                        end
			if new[i] == "." && (trouverDansArray(new[i-1], arrayCheck[1..8])[1] == "erreur" || trouverDansArray(new[i+1], arrayCheck[1..8])[1] == "erreur")
				#puts "point"
                                sortie = "erreur"
                        end
		end
		i += 1
	end
	#puts arrayCheck[3..8].push(arrayCheck[1]).to_s pareil que #puts newarray = arrayCheck[1..8].delete_at(1).to_s
        #puts arrayCheck[2..8].to_s
        #puts arrayCheck[3..8].to_s
        #puts arrayCheck[8..-1].to_s
	#puts arrayCheck.to_s
	i = 0
	debut = -1
	fin = -1
	while new[i] && sortie == "ok"
		if debut == -1 && trouverDansArray(new[i], arrayCheck[9..-1])[1] == "erreur"
			debut = i
		end
		if debut != -1 && debut != i && trouverDansArray(new[i], arrayCheck[8..-1])[1] != "erreur"
			fin = i-1
		end
		if debut != -1 && fin != -1
			a = debut
			pointCount = 0
			while a != fin + 1 #i
				if new[a] == "."
					pointCount += 1
				end
				a += 1
			end
			if pointCount > 1
				sortie = "erreur"
			end
			debut = -1
			fin = -1
		end
		i += 1
	end
	if count != 0
		sortie = "erreur"
	end
        return sortie, new
end

def split(formule)
	partition = []
	taille = longueurArgument(formule)
	i = 0
        count = 0
        while i != taille
                if formule[i] == "("
                        count += 1
                elsif array[i] == ")"
                        count -= 1
                end
                i = i + 1
        end
	return partition
end

def calcul(formule)
	resultat = 0
	equation = slipt(formule)
	return resultat
end
def addition(nombre1,nombre2)
	result = 0
	result = nombre1 + nombre2
	return result
end
def soustraction(nombre1,nombre2)
        result = 0
        result = nombre1 - nombre2
        return result
end
def multiplication(nombre1,nombre2)
        result = 0
        result = nombre1 * nombre2
        return result
end
def division(nombre1,nombre2)
        result = 0
        result = nombre1 / nombre2
        return result
end
def euclide(nombre1, nombre2)
	result = 0
	result = nombre1%nombre2
	return result
end
goodSyntaxElement = [" ", "(", ")", "+", "-", "*", "/", "%", ".", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
#coeur du programme
if longueurArgument(ARGV) != 1 || longueurArgument(ARGV[0]) < 3
	puts "error"
else
	sortie, new = testArgument(ARGV[0], goodSyntaxElement)
	if sortie == "erreur"
		puts "error"
	else
		puts "calcul en cours..."
		puts new + " = " + calcul(new).to_s
	end
end
