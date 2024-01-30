resource "local_file" "devops" {
    filename = "/study/terraform/terraformlocal/devops_automated.txt"
    content = "i am greatest devops enginneer who knows terraform"
}
    
# local = provider file = provider type  "devops "=name of ther resources 


resource "random_string" "rand-str" {    # #provider is random and   provider_type is string   name of resource is rand-str #this is block 
    length = 20 # atribute
    special= true # atribute
    override_special = "!~@#$%^&*()_?"   # atribute
}
output "rand-str" {
value = random_string.rand-str[*].result   #random_string is provider , rand-str provider name ,.result is for display result

}