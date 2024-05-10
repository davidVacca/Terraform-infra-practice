module "aws_vpc" {
  source              = "../Child_module/VPC_module"
  cidr_block          = var.cidr_block
  tag_name            = var.tag_name
  cidr_block_public1  = var.cidr_block_public1
  cidr_block_public2  = var.cidr_block_public2
  cidr_block_public3  = var.cidr_block_public3
  cidr_block_private1 = var.cidr_block_private1
  cidr_block_private2 = var.cidr_block_private2
  cidr_block_private3 = var.cidr_block_private3

}
