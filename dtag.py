#!/usr/bin/python3
import sys
import json
import requests

if len(sys.argv) != 2:
    print("Argument Error")
    sys.exit(0)

if "/" in sys.argv[1]:
    namespace   =  (sys.argv[1]).split("/")[0]
    repository  =  (sys.argv[1]).split("/")[1]
else:
    namespace   =  "library"
    repository  =  sys.argv[1]

print("n: ", namespace)
print("r: ", repository)

url         = "https://hub.docker.com/v2/namespaces/" + namespace + "/repositories/" + repository + "/tags?page_size=1000"
response = requests.get(url)

for each_result in response.json()["results"]:
    # print(each_result)
    output_str  = "last_updated: "
    output_str  += each_result["last_updated"].split("T")[0]
    output_str  += "\t"
    output_str  += "tag: "
    output_str  += each_result["name"]
    print(output_str)

# print(json.dumps(response.json()["results"][0]["last_updated"], indent = 4))

# print(output_str)
# print(len(response.json()["results"]))


