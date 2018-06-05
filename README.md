
# awscredentials

awscredentials manage the file /root/.aws/credentials file







#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with awscredentials](#setup)
    * [What awscredentials affects](#what-awscredentials-affects)
    * [Setup requirements](#setup-requirements)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This module handle the management of the AWS API Keys present in /root/.aws/credentials

## Setup

### What awscredentials affects

This module will overwrite your /root/.aws/credentials file

### Setup Requirements

On the puppet master:

```bash
cd /etc/puppetlabs/code/modules
git clone https://github.com/loiklo/puppet-awscredentials.git awscredentials
```

## Usage

1. Subscribe your instance to the puppet module

2. Fill the hiera file

```yaml
---
awscredentials::awsprofiles:
  default:
    aws_access_key_id: abcdefghijklmnopqrst
    aws_secret_access_key: abcdefghijklmnopqrstuvwxyz0123456789abcd
  goofys-aws:
    aws_access_key_id: zyxwvutsrqponmlkjihg
    aws_secret_access_key: dcba9876543210zyxwvutsrqponmlkjihgfedcba
```

## Limitations

none

## Development

If you want to contribute, just open a pull request with your improvement.

