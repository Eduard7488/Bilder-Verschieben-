#!/bin/bash

# Variablen deklarierung und initialiserung 
verzeichnis="verzeichnis"
anzahlJPGDateien=$(find "$verzeichnis" -name "*.jpg" | wc -l)
neuesVerzeichnis="neuesverzeichnis/"
anzahlDerDateien=$(find "$verzeichnis" -name "*.jpg" -o -name "*.png" | wc -l)
anzahlDateienNeuesVerzeichnis=$(ls "$neuesVerzeichnis" | wc -l)

# Anweisung was man machen soll
echo "Hallo, durch die ausführung dieses Programmes werden die Bilder vom Ordner $verzeichnis/ zu $neuesVerzeichnis verschoben."
read -p  "Wollen sie fortfahren? (Y|N): " auswahl

# Damit man auswaehlen kann ob man das Programm ausfuehren will
case "$auswahl" in
			[yY])
			echo "Programm wird ausgeführt..."
		;;
			[nN])
			echo "Programm wird abgebrochen."
			exit
		;;
			*)
			echo "Ungültige Eingabe bitte geben sie Y oder N ein"
		;;
esac

# Prüft ob das Verzeichnis existiert
if [ -d "$verzeichnis" ]
        then
		echo "Info: Gerade befinden sich soviele Dateien:$anzahlDerDateien im Ordner: $verzeichnis/ diese werden in dieses Verzeichnis verschoben: $neuesVerzeichnis"
	else
		echo "Info: Das Verzeichnis: $verzeichnis existiert nicht und das Programm wird abgebrochen"
	exit
fi

# Info für den User
echo "Info: Verschiebung und löschung findet jetzt statt"
echo "Info: $anzahlDerDateien"


# Solange Dateien noch vorhanden sind, verschiebe
while [ "$anzahlDerDateien" != 0 ];
do
        find "$verzeichnis" -name "*.jpg" -exec mv -t "$neuesVerzeichnis" {} +
        rm -rf "$verzeichnis"
done

echo "fertig..."

# Wenn keine Dateien mehr da sind
	if [ "$anzahlDerDateien" == 0 ]
then
	echo "Die JPG wurden erfolgreich verschoben und die PNG Dateien gelöscht"
	echo "Info: Anzahl von Dateien im Ordner: $anzahlDateienNeuesVerzeichnis"
fi

