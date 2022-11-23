
provider "aws" {
  region = "us-east-2"
}

# VPC
resource "aws_vpc" "terra_vpc" {
  cidr_block = "10.20.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "TerraVPC"
  }
}

# Public subnet1
resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = "10.20.1.0/24" 
  availability_zone = "us-east-2a"
  
  tags = {
    Name = "publicsubnet1"
  }	  	
}



# Public subnet2
resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = "10.20.2.0/24" 
  availability_zone = "us-east-2b"
  
  tags = {
    Name = "publicsubnet2"
  }	  	
}
 
 

# Public subnet3 
resource "aws_subnet" "public3" {
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = "10.20.3.0/24" 
  availability_zone = "us-east-2c"
  
  tags = {
    Name = "publicsubnet3"
  }	  	
}



# Private subnet1
resource "aws_subnet" "private1" {
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = "10.20.4.0/24"  
  availability_zone = "us-east-2a"
 
  tags = {
    Name = "privatesubnet"
  }
  
}


# Private subnet2
resource "aws_subnet" "private2" {
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = "10.20.5.0/24"  
  availability_zone = "us-east-2b"
 
  tags = {
    Name = "privatesubnet"
  }
  
}

# Private subnet3
resource "aws_subnet" "private3" {
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = "10.20.6.0/24"  
  availability_zone = "us-east-2c"
 
  tags = {
    Name = "privatesubnet"
  }
  
}



# Internet gateway
resource "aws_internet_gateway" "vpcIG" {
  vpc_id = aws_vpc.terra_vpc.id
 
  tags = {
    Name = "VPCIG"
  }
}
 
 
# Route table
resource "aws_route_table" "vpcRT" {
  vpc_id = aws_vpc.terra_vpc.id
  
  route {
      cidr_block = "0.0.0.0/0"
	  gateway_id = aws_internet_gateway.vpcIG.id
  }	 
  tags = {
    Name = "VPCRT"
  }
}




