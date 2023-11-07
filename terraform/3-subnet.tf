// Create public Subnet a,c
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.smpVPC.id
  cidr_block              = "10.0.1.0/24" 
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Web a"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = aws_vpc.smpVPC.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Web c"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}
// Create private subnet a,c
resource "aws_subnet" "private_subnet_a" {
  vpc_id     = aws_vpc.smpVPC.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "App a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id     = aws_vpc.smpVPC.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "App c"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}