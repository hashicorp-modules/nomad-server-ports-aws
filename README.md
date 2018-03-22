# AWS Nomad Server Ports Terraform Module

Creates a standard Nomad server security group in AWS.

## Environment Variables

- `AWS_DEFAULT_REGION`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

## Input Variables

- `create`: [Optional] Create Module, defaults to true.
- `name`: [Optional] Name for resources, defaults to "nomad-server-ports-aws".
- `vpc_id`: [Required] VPC ID to provision resources in.
- `cidr_blocks`: [Required] CIDR blocks for Security Groups.
- `tags`: [Optional] Optional map of tags to set on resources, defaults to empty map.

## Outputs

- `nomad_server_sg_id`: Nomad server security group ID.

## Module Dependencies

- [AWS Nomad Client Ports Terraform Module](https://github.com/hashicorp-modules/nomad-client-ports-aws)

## Authors

HashiCorp Solutions Engineering Team.

## License

Mozilla Public License Version 2.0. See LICENSE for full details.
