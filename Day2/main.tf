resource local_file "devops"{
    filename = var.file_list1[0]
    content = var.contentmap["content1"]
}

resource local_file "new-devops_var" {
    filename = var.file_list1[1]
    content = var.contentmap["content2"]
}