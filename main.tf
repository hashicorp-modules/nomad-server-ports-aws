terraform {
  required_version = ">= 0.9.3"
}

# https://www.nomadproject.io/guides/cluster/requirements.html#ports-used
module "nomad_client_ports_aws" {
  source = "git@github.com:hashicorp-modules/nomad-client-ports-aws?ref=f-refactor"

  count       = "${var.count}"
  name        = "${var.name}"
  vpc_id      = "${var.vpc_id}"
  cidr_blocks = "${var.cidr_blocks}"
}

# The port used for the gossip protocol for cluster membership. Both TCP and
# UDP should be routable between the server nodes on this port
# https://www.nomadproject.io/docs/agent/configuration/index.html#serf-2
resource "aws_security_group_rule" "serf_tcp" {
  count = "${var.count}"

  security_group_id = "${element(module.nomad_client_ports_aws.nomad_client_sg_id, count.index)}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 4648
  to_port           = 4648
  cidr_blocks       = ["${var.cidr_blocks}"]
}

# The port used for the gossip protocol for cluster membership. Both TCP and
# UDP should be routable between the server nodes on this port
# https://www.nomadproject.io/docs/agent/configuration/index.html#serf-2
resource "aws_security_group_rule" "serf_udp" {
  count = "${var.count}"

  security_group_id = "${element(module.nomad_client_ports_aws.nomad_client_sg_id, count.index)}"
  type              = "ingress"
  protocol          = "udp"
  from_port         = 4648
  to_port           = 4648
  cidr_blocks       = ["${var.cidr_blocks}"]
}
