#!/bin/bash
xdg-mime default $1 text/html x-scheme-handler/http x-scheme-handler/https
xdg-settings set default-web-browser $1
