
#Import AD Module
Import-Module ActiveDirectory

# Show a list of users
Get-ADUser `
-Filter {name -like "A*"}

#Remove a AD User    
    Remove-ADUser `
        -Identity "Leonardo Loureiro" `

  