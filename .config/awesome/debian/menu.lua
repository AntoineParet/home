-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

Debian_menu["Debian_Aide"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"yelp","/usr/bin/yelp"},
}
Debian_menu["Debian_Applications_Dessin_et_image"] = {
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
}
Debian_menu["Debian_Applications_Éditeurs"] = {
	{"Gedit","/usr/bin/gedit","/usr/share/pixmaps/gedit-icon.xpm"},
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
}
Debian_menu["Debian_Applications_Émulateurs_de_terminaux"] = {
	{"X-Terminal as root (GKsu)","/usr/bin/gksu -u root /usr/bin/x-terminal-emulator","/usr/share/pixmaps/gksu-debian.xpm"},
}
Debian_menu["Debian_Applications_Gestion_de_fichiers"] = {
	{"gmrun","/usr/bin/gmrun"},
	{"Thunar","/usr/bin/thunar"},
}
Debian_menu["Debian_Applications_Interpréteurs_de_commandes"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
	{"Zsh", "x-terminal-emulator -e ".."/bin/zsh4"},
}
Debian_menu["Debian_Applications_Lecteurs"] = {
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
}
Debian_menu["Debian_Applications_Programmation"] = {
	{"Python (v2.6)", "x-terminal-emulator -e ".."/usr/bin/python2.6","/usr/share/pixmaps/python2.6.xpm"},
	{"Python (v2.7)", "x-terminal-emulator -e ".."/usr/bin/python2.7","/usr/share/pixmaps/python2.7.xpm"},
	{"Python (v3.2)", "x-terminal-emulator -e ".."/usr/bin/python3.2","/usr/share/pixmaps/python3.2.xpm"},
}
Debian_menu["Debian_Applications_Réseau_Communication"] = {
	{"Icedove Mail","icedove","/usr/share/pixmaps/icedove.xpm"},
	{"Jitsi","/usr/bin/jitsi","/usr/share/pixmaps/jitsi-32.xpm"},
	{"Mutt", "x-terminal-emulator -e ".."/usr/bin/mutt","/usr/share/pixmaps/mutt.xpm"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
}
Debian_menu["Debian_Applications_Réseau_Navigateurs_web"] = {
	{"Iceweasel","iceweasel","/usr/share/pixmaps/iceweasel.xpm"},
	{"w3m", "x-terminal-emulator -e ".."/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html"},
}
Debian_menu["Debian_Applications_Réseau_Surveillance"] = {
	{"WICD","/usr/bin/wicd-gtk","/usr/share/pixmaps/wicd-gtk.xpm"},
}
Debian_menu["Debian_Applications_Réseau_Transfert_de_fichiers"] = {
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission-gtk","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_Applications_Réseau"] = {
	{ "Communication", Debian_menu["Debian_Applications_Réseau_Communication"] },
	{ "Navigateurs web", Debian_menu["Debian_Applications_Réseau_Navigateurs_web"] },
	{ "Surveillance", Debian_menu["Debian_Applications_Réseau_Surveillance"] },
	{ "Transfert de fichiers", Debian_menu["Debian_Applications_Réseau_Transfert_de_fichiers"] },
}
Debian_menu["Debian_Applications_Sciences_Mathématiques"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
}
Debian_menu["Debian_Applications_Sciences"] = {
	{ "Mathématiques", Debian_menu["Debian_Applications_Sciences_Mathématiques"] },
}
Debian_menu["Debian_Applications_Son_et_musique"] = {
	{"moc", "x-terminal-emulator -e ".."/usr/bin/mocp"},
	{"Xfce Mixer","/usr/bin/xfce4-mixer","/usr/share/pixmaps/xfce4-mixer.xpm"},
}
Debian_menu["Debian_Applications_Système_Administration"] = {
	{"Debian Task selector", "x-terminal-emulator -e ".."su-to-root -c tasksel"},
	{"Editres","editres"},
	{"GTK+ 2.0 theme manager","/usr/bin/gtk-chtheme","/usr/share/pixmaps/gtk-chtheme.xpm"},
	{"GTK+ 2.0 Theme Switch","/usr/bin/gtk-theme-switch2"},
	{"LXAppearance","/usr/bin/lxappearance"},
	{"nitrogen","/usr/bin/nitrogen"},
	{"Reportbug", "x-terminal-emulator -e ".."/usr/bin/reportbug --exit-prompt"},
	{"Reportbug (GTK+)","/usr/bin/reportbug --exit-prompt --ui gtk2"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Applications_Système_Gestionnaires_de_paquets"] = {
	{"Aptitude Package Manager (text)", "x-terminal-emulator -e ".."/usr/bin/aptitude-curses"},
}
Debian_menu["Debian_Applications_Système_Matériel"] = {
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Applications_Système_Surveillance"] = {
	{"BOINC Manager","/usr/bin/boincmgr"},
	{"Conky", "x-terminal-emulator -e ".."/usr/bin/conky"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xev","x-terminal-emulator -e xev"},
}
Debian_menu["Debian_Applications_Système"] = {
	{ "Administration", Debian_menu["Debian_Applications_Système_Administration"] },
	{ "Gestionnaires de paquets", Debian_menu["Debian_Applications_Système_Gestionnaires_de_paquets"] },
	{ "Matériel", Debian_menu["Debian_Applications_Système_Matériel"] },
	{ "Surveillance", Debian_menu["Debian_Applications_Système_Surveillance"] },
}
Debian_menu["Debian_Applications_Vidéo"] = {
	{"VLC media player","/usr/bin/qvlc","/usr/share/icons/hicolor/32x32/apps/vlc.xpm"},
}
Debian_menu["Debian_Applications"] = {
	{ "Dessin et image", Debian_menu["Debian_Applications_Dessin_et_image"] },
	{ "Éditeurs", Debian_menu["Debian_Applications_Éditeurs"] },
	{ "Émulateurs de terminaux", Debian_menu["Debian_Applications_Émulateurs_de_terminaux"] },
	{ "Gestion de fichiers", Debian_menu["Debian_Applications_Gestion_de_fichiers"] },
	{ "Interpréteurs de commandes", Debian_menu["Debian_Applications_Interpréteurs_de_commandes"] },
	{ "Lecteurs", Debian_menu["Debian_Applications_Lecteurs"] },
	{ "Programmation", Debian_menu["Debian_Applications_Programmation"] },
	{ "Réseau", Debian_menu["Debian_Applications_Réseau"] },
	{ "Sciences", Debian_menu["Debian_Applications_Sciences"] },
	{ "Son et musique", Debian_menu["Debian_Applications_Son_et_musique"] },
	{ "Système", Debian_menu["Debian_Applications_Système"] },
	{ "Vidéo", Debian_menu["Debian_Applications_Vidéo"] },
}
Debian_menu["Debian"] = {
	{ "Aide", Debian_menu["Debian_Aide"] },
	{ "Applications", Debian_menu["Debian_Applications"] },
}
