# aprsdigi

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with aprsdigi](#setup)
    * [What aprsdigi affects](#what-aprsdigi-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with aprsdigi](#beginning-with-aprsdigi)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module manages Alan Crosswell's Amateur Radio AX.25 APRS digipeater [aprsdigi](https://github.com/n2ygk/aprsdigi)

## Module Description

aprsdigi installs, configures and runs aprsdigi. Your system must have a working AX.25 interface which
implies Linux kernel support being appropriately configured.

## Setup

### Beginning with aprsdigi

First set up an AX.25 interface, for example, with [soundmodem](https://github.com/n2ygk/puppet-soundmodem).

## Usage

```
  class { 'aprsdigi':
    callsign                     => 'N0NE-15',
  }

```
## Reference

### Parameters
[*intf*]
  Network interface name. Default 'sm0'
  
[*callsign*]
  Amateur radio AX.25 call sign.

## Limitations

This has only been tested on x86 hardware with Fedora and CentOS with one or
two sound cards and/or USB sound adapters. It requires a kernel built with AX.25 support.

## Development

Clone [here](https://github.com/n2ygk/puppet-aprsdigi) and submit a PR!

