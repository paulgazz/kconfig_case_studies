date
echo processing axtlswrap/axtlswrap.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd axtlswrap
cppcheck axtlswrap.c
echo processing crypto/sha384.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck sha384.c
echo processing crypto/sha1.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck sha1.c
echo processing crypto/rsa.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck rsa.c
echo processing crypto/bigint.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck bigint.c
echo processing crypto/rc4.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck rc4.c
echo processing crypto/sha512.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck sha512.c
echo processing crypto/crypto_misc.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck crypto_misc.c
echo processing crypto/sha256.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck sha256.c
echo processing crypto/md5.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck md5.c
echo processing crypto/aes.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck aes.c
echo processing crypto/hmac.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck hmac.c
echo processing httpd/proc.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd httpd
cppcheck proc.c
echo processing httpd/axhttpd.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd httpd
cppcheck axhttpd.c
echo processing httpd/htpasswd.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd httpd
cppcheck htpasswd.c
echo processing httpd/tdate_parse.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd httpd
cppcheck tdate_parse.c
echo processing samples/c/axssl.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd samples/c
cppcheck axssl.c
echo processing ssl/tls1_clnt.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck tls1_clnt.c
echo processing ssl/openssl.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck openssl.c
echo processing ssl/test/perf_bigint.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl/test
cppcheck perf_bigint.c
echo processing ssl/test/ssltest.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl/test
cppcheck ssltest.c
echo processing ssl/loader.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck loader.c
echo processing ssl/p12.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck p12.c
echo processing ssl/asn1.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck asn1.c
echo processing ssl/gen_cert.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck gen_cert.c
echo processing ssl/tls1.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck tls1.c
echo processing ssl/tls1_svr.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck tls1_svr.c
echo processing ssl/x509.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck x509.c
echo processing ssl/os_port.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck os_port.c
date
