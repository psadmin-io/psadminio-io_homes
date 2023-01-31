
# io_portalwar

#### Table of Contents

- [io_portalwar](#io_portalwar)
      - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
    - [Setup Requirements](#setup-requirements)
    - [Beginning with io_portalwar](#beginning-with-io_portalwar)
  - [Usage](#usage)
    - [Custom PS_HOME Files](#custom-ps_home-files)

## Description

Deploy files ot PS_HOME for Peoplesoft to complement the DPK.

## Setup

### Setup Requirements

This module has a requirement of the puppetlabs/inifile module. https://forge.puppet.com/puppetlabs/inifile

If you are using PeopleTools 8.55, that version of Puppet will need version 1.6.0 of the `inifile` module.

### Beginning with io_ps_home  

Add `contain ::io_ps_home` to a delivered or custom DPK profile. To change defaults, see usage below.

## Usage

This module will use data from your yaml files. It uses delivered DPK hashes/variables, as well as `io_ps_home` specific hashes/variables you will want to add.

### Custom PS_HOME Files

```yaml
io_ps_home::source: "/tmp/"
io_ps_home::files:
  "%{hiera('ps_home')}":
    root:
      - logo.png
    "%{hiera('pia_site_name')}":
      portal:
        - bootstrap.min.css
        - bootstrap.min.js
        - bootstrap-theme.min.css
        - logo.png
      psftdocs:
        - custom.html
        - custom.js
        - logo.png
```

The `io_ps_home::source` value is used as the source location for all the files. 

* The `root` array is for files to be deployed under the `PORTAL.war` folder. 
* The `portal` array is for files to be deployed under the `PORTAL.war\site_name` folder.
* The `psftdocs` array is for files to be deployed under the `PORTAL.war\WEB-INF\psftdocs\site_name` folder.
