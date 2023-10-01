#!/usr/bin/python3
import sys
import json
import requests

if len(sys.argv) != 2:
    print("\nArgument Error")
    sys.exit(0)

if "/" in sys.argv[1]:
    namespace   =  (sys.argv[1]).split("/")[0]
    repository  =  (sys.argv[1]).split("/")[1]
else:
    namespace   =  "library"
    repository  =  sys.argv[1]

url             = "https://hub.docker.com/v2/namespaces/" + namespace + "/repositories/" + repository + "/tags?page_size=1000"
response        = requests.get(url)

if "results" not in response.json():
    print("\nNo tag exist, Please check the image info")
    sys.exit(0)

# print(json.dumps(response.json(), indent=4))

for each_result in response.json()["results"]:

    if each_result["last_updated"]:
        output_str  = "last_updated:\t"
        output_str  += each_result["last_updated"].split("T")[0]
        output_str  += "\t"
        output_str  += "tag: "
        output_str  += each_result["name"]

    print(output_str)

