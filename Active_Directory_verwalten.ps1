#Active Directory öffnen - Leonardo
#dsa.msc
$ADoef_schli = dsa.msc

do{
write-host "Active Directory verwalten"
write-host "--------------------------"
write-host "Was möchten Sie tun?`n"
write-host "1 : Neuen Benutzer oder Gruppe erstellen"
write-host "2 : Änderungen vornehmen"
write-host "3 : User oder Gruppen Löschen"
write-host "4 : Programm beenden`n"

#Eingabe für welche Aktion!
$eingabe = read-host "Drücken Sie eine Zahl zwischen 1-4 für eine Aktion"

#Switch - Leonardo
switch($eingabe) {

1{"`n Neuen Benutzer oder Gruppe erstellen`n"
write-host "1 = Benutzer / 2 = Gruppe`n"
$Benu_Grup = read-host "Benutzer oder Gruppe?"

if($Benu_Grup -eq 1){
    #AD Module Importieren - Leonardo
    Import-Module ActiveDirectory

    # Variablen vom Benutzer empfangen - Leonardo
    $Vorname = Read-Host -Prompt "`nGeben Sie Ihren Vornamen ein "
    $Nachname = Read-Host -Prompt "Geben Sie Ihren Nachnamen ein "
    $Passwort = Read-Host -Prompt "Ihr Passwort "

    # Neuen User erstellen - Leonardo    
    New-ADUser `
     -Name "$Vorname $Nachname" `
     -GivenName $Vorname `
     -Surname $Nachname `
     -UserPrincipalName "$Vorname.$Nachname" `
     -Path "CN=Users,DC=Domain,DC=local" `
     -AccountPassword (ConvertTo-SecureString $Passwort -AsPlainText -Force) `
     -ChangePasswordAtLogon 1 `

    write-host "User erstellt..."

    #Loop festlegen - Leonardo
    $Fragen = read-host "`nMöchten Sie mit dem Programm fortsetzen? 1 für JA / 2 für NEIN"
if($Fragen -eq 1){
    $Fortsetzung = 1
}
if($Fragen -eq 2){
    $Fortsetzung = 0
 }
}

if($Benu_Grup -eq 2){
    #AD Module Importieren - Leonardo
    Import-Module ActiveDirectory

    # Variablen vom Benutzer empfangen - Leonardo
    $Name_Grup = Read-Host -Prompt "Geben Sie den Namen der Gruppe ein "
    $Scope = Read-Host -Prompt "Geben Sie den Typ der Gruppe ein (Global, Universal usw.) "

    # Neue Gruppe erstellen - Leonardo
    NEW-ADGroup `
        -Name $Name_Grup `
        -GroupScope $Scope `
        -Path "CN=Users,DC=Domain,DC=local" `

    write-host "Gruppe erstellt..."

    #Loop festlegen - Leonardo
    $Fragen = read-host "`nMöchten Sie mit dem Programm fortsetzen? 1 für JA / 2 für NEIN"
if($Fragen -eq 1){
    $Fortsetzung = 1
}
if($Fragen -eq 2){
    $Fortsetzung = 0
    }
  }
}


2{"`n Änderungen vornehmen"

$Pass_Abl = read-host "1 = Passwort ändern / 2 = Ablaufdatum ändern"

if($Pass_Abl -eq 1){
    #AD Module Importieren - Leonardo
    Import-Module ActiveDirectory

    #Aufzeigen aller User - Leonardo | mit * alle aufzeigen
    Get-ADUser 

    # Variablen vom Benutzer empfangen - Leonardo
    $Name_User = Read-Host -Prompt "`nGeben Sie den Namen des Users ein "
    #$oldPassword = Read-Host -Prompt "Geben Sie Ihren alten Passwort ein"
    $newPassword = Read-Host -Prompt "Bitte geben Sie Ihren neuen Passwort ein"

    # Passwort ändern - Leonardo
    Set-ADAccountPassword `
        -Identity $Name_User `
        -Reset -Newpassword (ConvertTo-SecureString -AsPlainText $newPassword -Force)`

    #Loop festlegen - Leonardo
    $Fragen = read-host "`nMöchten Sie mit dem Programm fortsetzen? 1 für JA / 2 für NEIN"
if($Fragen -eq 1){
    $Fortsetzung = 1
}
if($Fragen -eq 2){
    $Fortsetzung = 0
 }
}

if($Pass_Abl -eq 2){
    #Import AD Module- Shaadhanaa
    Import-Module ACtiveDirectory

    #Alle Users anzeigen - Shaadhanaa
    Get-ADUser

    $Auswahl_User = Read-Host "Ihre Auswahl? (Name)"
    $Ablaufdatum_user = Read-Host "Datum? (dd/mm/yyyy)"

    #Ablaufdatum festlegen - Shaadhanaa
    set-ADAccountExpiration `
        -Identity $Auswahl_User `
        -DateTime $Ablaufdatum_user `

    write-host "Ablaufdatum festgelegt!"


    #Loop festlegen - Leonardo
    $Fragen = read-host "`nMöchten Sie mit dem Programm fortsetzen? 1 für JA / 2 für NEIN"
if($Fragen -eq 1){
    $Fortsetzung = 1
    }
if($Fragen -eq 2){
    $Fortsetzung = 0
    }
  }
}


3{"`n User oder Gruppen Löschen`n"
write-host "-------------------------"
$User_Grup_loesch = read-host "1 = User / 2 = Gruppen"

if($User_Grup_loesch -eq 1){
    #Import AD Module - Shaadhanaa
    Import-Module ActiveDirectory

    #Alle Users auflisten | mit * alle aufzeigen - Shaadhanaa
    Get-ADUser

    $Auswahl_user = read-host "Ihre Auswahl? (Name)"

    Remove-ADUser `
    -Identity "$Auswahl_user" `

    #Loop festlegen - Leonardo
    $Fragen = read-host "`nMöchten Sie mit dem Programm fortsetzen? 1 für JA / 2 für NEIN"
if($Fragen -eq 1){
    $Fortsetzung = 1
    }
if($Fragen -eq 2){
    $Fortsetzung = 0
    }
}

if($User_Grup_loesch -eq 2){
    #Import AD Module - Shaadhanaa
    Import-Module ActiveDirectory

    #Alle Users auflisten - Shaadhanaa 
    Get-ADGroup

    $Auswahl_user2 = read-host "Ihre Auswahl? (Name)"

    #Gruppe entfernen - Shaadhanaa
    Remove-ADGroup `
    -Identity "$Auswahl_user2" `

    #Loop festlegen - Leonardo
    $Fragen = read-host "`nMöchten Sie mit dem Programm fortsetzen? 1 für JA / 2 für NEIN"
if($Fragen -eq 1){
    $Fortsetzung = 1
    }
if($Fragen -eq 2){
    $Fortsetzung = 0
    }
  }
}

4{"`nVielen Dank und auf wiedersehen!"

    #Import AD Module - Shaadhanaa
    Import-Module ActiveDirectory

    #AD Fenster schliessen
    Stop-Process `
    -ProcessName mmc `

    #Programm beenden - Leonardo
    $Fortsetzung = 0
}

default{"`nGeben Sie einen Wert zwischen 1-4 ein!"}
}
#Wird das Programm nochmals verwendet?
} while ($Fortsetzung -eq 1)
