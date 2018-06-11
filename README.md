# Dockerized Open Lighting Architecture

[![Build Status](https://travis-ci.org/bartfeenstra/docker-ola.svg?branch=master)](https://travis-ci.org/bartfeenstra/docker-ola)

## Usage

### Configuration
OLA's configuration directory is located at `/usr/lib/olad/.ola`, and configuration files can be copied or mounted
there. Alternatively, plugins can be enabled without configuration by setting
[environment variables](#environment-variables).

### Environment variables
Set any of the following variables to a non-empty value to enable the corresponding plugin. OLA will use its default
configuration for each.
- `OLA_PLUGIN_DUMMY` (ID: 1)
- `OLA_PLUGIN_ARTNET` (ID: 2)
- `OLA_PLUGIN_SHOWNET` (ID: 3)
- `OLA_PLUGIN_ESPNET` (ID: 4)
- `OLA_PLUGIN_USBSERIAL` (ID: 5)
- `OLA_PLUGIN_OPENDMX` (ID: 6)
- `OLA_PLUGIN_SANDNET` (ID: 7)
- `OLA_PLUGIN_STAGEPROFI` (ID: 8)
- `OLA_PLUGIN_PARTHPORT` (ID: 9)
- `OLA_PLUGIN_E131` (ID: 11)
- `OLA_PLUGIN_FTDIDMX` (ID: 13)
- `OLA_PLUGIN_OSC` (ID: 14)
- `OLA_PLUGIN_SPI` (ID: 15)
- `OLA_PLUGIN_KINET` (ID: 16)
- `OLA_PLUGIN_KARATE` (ID: 17)
- `OLA_PLUGIN_MILINST` (ID: 18)
- `OLA_PLUGIN_RENARD` (ID: 19)
- `OLA_PLUGIN_UARTDMX` (ID: 20)
- `OLA_PLUGIN_OPENPIXELCONTROL` (ID: 21)
- `OLA_PLUGIN_GPIO` (ID: 22)
