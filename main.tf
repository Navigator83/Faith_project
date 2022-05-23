#creating aws networking for a project

resource "aws_vpc" "faith_work" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "faith_work"
  }
}

#Rock-test-pub-subnet1

resource "aws_subnet" "Dream-pub-sub1" {
  vpc_id            = aws_vpc.faith_work.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Dream-pub-sub1"
  }
}

#Rock-test-pub-subnet2

resource "aws_subnet" "Dream-pub-sub2" {
  vpc_id            = aws_vpc.faith_work.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Dream-pub-sub2"
  }
}

#Rock-test-priv-subnet1

resource "aws_subnet" "Dream-priv-sub1" {
  vpc_id            = aws_vpc.faith_work.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "Dream-priv-sub1"
  }
}

#Rock-test-priv-subnet2

resource "aws_subnet" "Dream-priv-sub2" {
  vpc_id            = aws_vpc.faith_work.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "Dream-priv-sub2"
  }
}

#Rock-test-pub-route-table 

resource "aws_route_table" "Dream-route-pub-table" {
  vpc_id = aws_vpc.faith_work.id



  tags = {
    Name = "Dream-route-pub-table"
  }
}

#Rock-test-priv-route-table

resource "aws_route_table" "Dream-route-priv-table" {
  vpc_id = aws_vpc.faith_work.id



  tags = {
    Name = "Dream-route-priv-table"
  }
}

#Rock-test-pub-association1

resource "aws_route_table_association" "Dream-assoc1" {
  subnet_id      = aws_subnet.Dream-pub-sub1.id
  route_table_id = aws_route_table.Dream-route-pub-table.id
}

#Rock-test-pub-association2

resource "aws_route_table_association" "Dream-assoc2" {
  subnet_id      = aws_subnet.Dream-pub-sub2.id
  route_table_id = aws_route_table.Dream-route-pub-table.id
}

#Rock-test-priv-association1
resource "aws_route_table_association" "Dream-priv-assoc1" {
  subnet_id      = aws_subnet.Dream-priv-sub1.id
  route_table_id = aws_route_table.Dream-route-priv-table.id

}

#Rock-test-priv-association2
resource "aws_route_table_association" "Dream-priv-assoc" {
  subnet_id      = aws_subnet.Dream-priv-sub2.id
  route_table_id = aws_route_table.Dream-route-priv-table.id
}

#Rock-test-IGW

resource "aws_internet_gateway" "Rock-IGW" {
  vpc_id = aws_vpc.faith_work.id

  tags = {
    Name = "Rock-IGW"
  }
}

#Rock-IGW-attachment

resource "aws_route" "rock-Rose1-association" {
  route_table_id         = aws_route_table.Dream-route-pub-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.Rock-IGW.id
}
