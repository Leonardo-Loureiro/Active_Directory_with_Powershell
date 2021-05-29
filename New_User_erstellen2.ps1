
#Import AD Module
Import-Module ActiveDirectory

# Grab variable from users
$Vorname = Read-Host -Prompt "Geben Sie Ihren Vornamen ein "
$Nachname = Read-Host -Prompt "Geben Sie Ihren Nachnamen ein "
$Passwort = Read-Host -Prompt "Ihr Passwort "

#Create new AD User    
New-ADUser `
   -Name "$Vorname $Nachname" `
   -GivenName $Vorname `
   -Surname $Nachname `
   -UserPrincipalName "$Vorname.$Nachname" `
   -Path "CN=Users,DC=Domain,DC=local" `
   -AccountPassword (ConvertTo-SecureString $Passwort -AsPlainText -Force) `
   -ChangePasswordAtLogon 1 `
  