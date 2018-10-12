date
echo processing axtlswrap/axtlswrap.c
echo cli_file ./535.config/axtlswrap.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd axtlswrap
cppcheck --force -I ../config -I ../ssl -I ../crypto axtlswrap.c
echo processing crypto/sha384.c
echo cli_file ./368.config/sha384.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck --force -I ../config -I ../ssl -I ../crypto sha384.c
echo processing crypto/sha1.c
echo cli_file ./368.config/sha1.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck --force -I ../config -I ../ssl -I ../crypto sha1.c
echo processing crypto/rsa.c
echo cli_file ./368.config/rsa.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck --force -I ../config -I ../ssl -I ../crypto rsa.c
echo processing crypto/bigint.c
echo cli_file ./368.config/bigint.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck --force -I ../config -I ../ssl -I ../crypto bigint.c
echo processing crypto/rc4.c
echo cli_file ./368.config/rc4.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck --force -I ../config -I ../ssl -I ../crypto rc4.c
echo processing crypto/sha512.c
echo cli_file ./368.config/sha512.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck --force -I ../config -I ../ssl -I ../crypto sha512.c
echo processing crypto/crypto_misc.c
echo cli_file ./368.config/crypto_misc.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck --force -I ../config -I ../ssl -I ../crypto crypto_misc.c
echo processing crypto/sha256.c
echo cli_file ./368.config/sha256.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck --force -I ../config -I ../ssl -I ../crypto sha256.c
echo processing crypto/md5.c
echo cli_file ./368.config/md5.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck --force -I ../config -I ../ssl -I ../crypto md5.c
echo processing crypto/aes.c
echo cli_file ./368.config/aes.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck --force -I ../config -I ../ssl -I ../crypto aes.c
echo processing crypto/hmac.c
echo cli_file ./368.config/hmac.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd crypto
cppcheck --force -I ../config -I ../ssl -I ../crypto hmac.c
echo processing httpd/proc.c
echo cli_file ./368.config/proc.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd httpd
cppcheck --force -I ../config -I ../ssl -I ../crypto proc.c
echo processing httpd/axhttpd.c
echo cli_file ./368.config/axhttpd.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd httpd
cppcheck --force -I ../config -I ../ssl -I ../crypto axhttpd.c
echo processing httpd/htpasswd.c
echo cli_file ./9.config/htpasswd.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd httpd
cppcheck --force -I ../config -I ../ssl -I ../crypto htpasswd.c
echo processing httpd/tdate_parse.c
echo cli_file ./368.config/tdate_parse.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd httpd
cppcheck --force -I ../config -I ../ssl -I ../crypto tdate_parse.c
echo processing samples/c/axssl.c
echo cli_file ./944.config/axssl.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd samples/c
cppcheck --force -I ../../config -I ../../ssl -I ../../crypto axssl.c
echo processing ssl/tls1_clnt.c
echo cli_file ./368.config/tls1_clnt.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck --force -I ../config -I ../ssl -I ../crypto tls1_clnt.c
echo processing ssl/openssl.c
echo cli_file ./368.config/openssl.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck --force -I ../config -I ../ssl -I ../crypto openssl.c
echo processing ssl/test/perf_bigint.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl/test
cppcheck --force perf_bigint.c
echo processing ssl/test/ssltest.c
echo cli_file 
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl/test
cppcheck --force ssltest.c
echo processing ssl/loader.c
echo cli_file ./368.config/loader.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck --force -I ../config -I ../ssl -I ../crypto loader.c
echo processing ssl/p12.c
echo cli_file ./368.config/p12.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck --force -I ../config -I ../ssl -I ../crypto p12.c
echo processing ssl/asn1.c
echo cli_file ./368.config/asn1.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck --force -I ../config -I ../ssl -I ../crypto asn1.c
echo processing ssl/gen_cert.c
echo cli_file ./368.config/gen_cert.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck --force -I ../config -I ../ssl -I ../crypto gen_cert.c
echo processing ssl/tls1.c
echo cli_file ./368.config/tls1.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck --force -I ../config -I ../ssl -I ../crypto tls1.c
echo processing ssl/tls1_svr.c
echo cli_file ./368.config/tls1_svr.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck --force -I ../config -I ../ssl -I ../crypto tls1_svr.c
echo processing ssl/x509.c
echo cli_file ./368.config/x509.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck --force -I ../config -I ../ssl -I ../crypto x509.c
echo processing ssl/os_port.c
echo cli_file ./368.config/os_port.c.cli
cd /mnt/scratch/paul/varbugs/src/axtls-code/
cd ssl
cppcheck --force -I ../config -I ../ssl -I ../crypto os_port.c
date
