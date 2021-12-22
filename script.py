#!/usr/bin/env python

import yaml

with open("input.yml", "r") as stream:
    try:
        data = (yaml.safe_load(stream))
        dns_name = (data['inputs']['dns_name'])
        if dns_name == "":
            print ("null")
        else:
            print (dns_name)
    except yaml.YAMLError as exc:
        print(exc)
