
echo "print  csr"
openssl req -text -noout -verify -in server.csr


echo "print crt"
openssl x509 -text -noout -in server-cert.pem

