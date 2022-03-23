host="fabmedical-[SUFFIX].documents.azure.com"
username="fabmedical-570611"
password="e287ZuNADUF10oqZkKHTOds6eYSUz5vZFLmIsXioT36cQ3HZmbZ35KU90U3ag1tfE3hSGpsix3igrnZftzERSQ"
dbname="contentdb"
port="10255"

for i in {1..250}; do
    mongo $host:$port/$dbname \
        -u $username -p $password \
        --ssl --sslAllowInvalidCertificates \
        --eval 'db.sessions.insert({"title":"Perf Test"})' &
done
