resource "aws_security_group" "ntier" {
    name = var.ntiersg_info.name
    vpc_id = var.ntiersg_info.vpc_id
}



resource "aws_security_group_rule" "websg" {
    count = length(var.ntiersg_info.rules)
     security_group_id = var.ntiersg_info.security_group.ntier
    from_port = var.ntiersg_info.rules[count.index].from_port
    protocol = var.ntiersg_info.rules[count.index].protocol
    to_port = var.ntiersg_info.rules[count.index].to_port
    type = var.ntiersg_info.rules[count.index].type
    cidr_blocks = var.ntiersg_info.rules[count.index].cidr_block

  
}