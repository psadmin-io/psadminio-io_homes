
# io_homes

#### Table of Contents

- [io_homes](#io_homes)
      - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
    - [Setup Requirements](#setup-requirements)
    - [Beginning with io_homes](#beginning-with-io_homes)
  - [Usage](#usage)
    - [Custom PS_HOME Files](#custom-ps_home-files)
    - [Custom PS_CUST_HOME Files](#custom-ps_cust_home-files)

## Description

Deploy files to PS_HOME and PS_CUST_HOME for Peoplesoft to complement the DPK.

## Setup

### Setup Requirements

This module has a requirement of the puppetlabs/inifile module. https://forge.puppet.com/puppetlabs/inifile

If you are using PeopleTools 8.55, that version of Puppet will need version 1.6.0 of the `inifile` module.

### Beginning with io_home  

Add `contain ::io_home` to a delivered or custom DPK profile. To change defaults, see usage below.

## Usage

This module will use data from your yaml files. It uses delivered DPK hashes/variables, as well as `io_ps_home` specific hashes/variables you will want to add.

### Custom PS_HOME Files

```yaml
io_homes::source: "/tmp/"
io_homes::ps_home_files:
  fonts:
    - GNUMICR_0.TTF
  bin:
    - PSRTISRV
  class:
    - commons-io-2.11.0.jar
  appserv:
    - xdo.cfg
```
### Custom PS_CUST_HOME Files

```yaml
io_homes::source: "/tmp/"
io_homes::ps_cust_home_files:
  fonts:
    - GNUMICR_0.TTF
  bin:
    - PSRTISRV
  class:
    - commons-io-2.11.0.jar
  appserv:
    - xdo.cfg
```



The `io_home::source` value is used as the source location for all the files. The files under the `source` folder are all in a single directory; the module will deploy the files under the appropriate directory in either `PS_HOME` or `PS_CUST_HOME`.
