#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout cert/karma.key -out cert/karma.crt
