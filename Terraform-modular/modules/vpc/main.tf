resource "aws_vpc" "nouman_vpc" {
cidr_block = var.cidr_block
  
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.nouman_vpc.id
    cidr_block = var.public_subnet_cidr
    availability_zone = "eu-north-1b"
    map_public_ip_on_launch = true 
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.nouman_vpc.id
    cidr_block = var.private_subnet_cidr
    availability_zone = "eu-north-1c"
}

resource "aws_internet_gateway" "nouman_gw" {
    vpc_id = aws_vpc.nouman_vpc.id
}


resource "aws_route_table" "nouman__public_rt" {
    vpc_id = aws_vpc.nouman_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.nouman_gw.id
    }
}



resource "aws_route_table_association" "public_rt_association" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.nouman__public_rt.id
}

