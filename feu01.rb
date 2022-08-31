#!/usr/bin/env ruby

#un programme qui affiche un rectangle dans le terminal

#pour ajouter de la couleur au rectangle
class String
def bg_gray;        "\e[47m#{self}\e[0m" end
def bg_red;         "\e[41m#{self}\e[0m" end
end

#fonction utile qui trouve le nombre ou la longueur d'argument comme .length()
def longueurArgument(argument)
        i = 0
        while argument[i]
                i += 1
        end
        return i
end

#fonction qui fait le rectangle
def rectangle(longueur, largeur)
	sortie = ""
	etat = 0
	for i in 1..largeur
		if etat == 0
			etat = 1
		else
			etat = 0
		end
		for x in 1..longueur
			if (i == 1 && (x == 1 || x == longueur)) || (i == largeur && (x == 1 || x == longueur))
				sortie = sortie + "o"
			elsif (i == 1 && x != 1 && x != longueur) || (i == largeur && x != 1 && x != longueur)
				sortie = sortie + "-"
			elsif (x == 1 && i != 1 && i != largeur) || (x == longueur && i != 1 && i != largeur)
				sortie = sortie + "|"
			else
				if etat == 0
					sortie = sortie + " ".bg_gray
					etat = 1
				else
					sortie = sortie + " ".bg_red
					etat = 0
				end
			end
		end
		sortie = sortie + "\n"
	end
	return sortie
end

#coeur du programme
if longueurArgument(ARGV) != 2 || ARGV[0] != (ARGV[0].to_i).to_s || ARGV[1] != (ARGV[1].to_i).to_s || ARGV[0].to_i <= 0 || ARGV[1].to_i <= 0
	puts "error"
else
	puts rectangle(ARGV[0].to_i, ARGV[1].to_i)
end
