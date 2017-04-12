downloadcmd and cmdutiles
=========================

In order to install all my settings, I have made a function **downloadcmd** that ask you for each fuction listed on **cmdutiles** if you want to download it.

Before using this function, paste it on /usr/bin

    sudo cp downloadcmd /usr/bin
    downloadcmd

After typing this command, just answer by `y` if you need this function or `n` if you don't need it yet.

Another function have been made to properly add paquets to the **cmdutiles** list : **addcmd**
Just type `addcmd yourfunction`

cpsav and rmsav
===============

    cpsav text.txt

This function just copy a .sav version of your file in order that if the file is damage you only have to delete it and
the .sav version is clean.

    rmsav text.txt

This function ask you if you want to **delete** the .sav version because the other one is ok or if you want to **came back to your initial situation**.

opn
===

The `opn` function choose for you the best logiciel to open your file by using the extension of the file.
For exemple, a PDF file will automatically be open with evince.

    opn my_file.mp3
