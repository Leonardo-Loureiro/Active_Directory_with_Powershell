
#Import AD Module
Import-Module ActiveDirectory

# Grab variable from users


#Create new AD User    
New-ADUser `
   -Name "Leonardo Loureiro" `
   -GivenName "Leonardo" `
   -Surname "Loureiro" `
   -UserPrincipalName "Leonardo.Loureiro" `
   -Path "CN=Users,DC=Domain,DC=local" `
   -AccountPassword (ConvertTo-SecureString "P@$$wOrd123" -AsPlainText -Force) `
   -ChangePasswordAtLogon 1 `
  